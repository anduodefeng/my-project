package com.maze.project.web.service.impl;

import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maze.project.web.common.constant.CommonConstant;
import com.maze.project.web.common.enums.FundEnum;
import com.maze.project.web.dto.common.PieDTO;
import com.maze.project.web.dto.portfolio.*;
import com.maze.project.web.entity.MyFundPortfolio;
import com.maze.project.web.entity.MyFundPortfolioDetail;
import com.maze.project.web.mapper.MyFundPortfolioDetailMapper;
import com.maze.project.web.mapper.MyFundPortfolioMapper;
import com.maze.project.web.service.MyFundPortfolioService;
import com.maze.project.web.vo.portfolio.PortfolioChangeVO;
import com.maze.project.web.vo.portfolio.PortfolioPageVO;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 * 基金组合表 服务实现类
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
@Service
public class MyFundPortfolioServiceImpl extends ServiceImpl<MyFundPortfolioMapper, MyFundPortfolio>
        implements MyFundPortfolioService {

    private final MyFundPortfolioDetailMapper portfolioDetailMapper;

    public MyFundPortfolioServiceImpl(MyFundPortfolioDetailMapper portfolioDetailMapper) {
        this.portfolioDetailMapper = portfolioDetailMapper;
    }

    @Override
    public PortfolioChartDTO getChart(String accountId) {
        List<PieDTO> pieList = new ArrayList<>();
        Map<String,Object> map = getDate();
        List<String> dateList = (List<String>) map.get("date");
        DateTime start = (DateTime) map.get("start");
        DateTime end = (DateTime) map.get("end");
        List<MyFundPortfolio> portfolioList = list(Wrappers.<MyFundPortfolio>lambdaQuery().eq(MyFundPortfolio::getAccountId, accountId));
        for (MyFundPortfolio portfolio : portfolioList){

            PieDTO pieDTO = new PieDTO();
            pieDTO.setName(portfolio.getName());
            pieDTO.setValue(portfolio.getMoney().doubleValue());
            pieList.add(pieDTO);

        }
        Map<String, List<Double>> totalMap = getTotal(portfolioList, start, end);
        PortfolioChartDTO portfolioChartDTO = new PortfolioChartDTO();
        portfolioChartDTO.setPieList(pieList);
        portfolioChartDTO.setDateList(dateList);
        portfolioChartDTO.setTotalAmount(totalMap.get("total"));
        portfolioChartDTO.setTotalPrincipal(totalMap.get("principal"));

        return portfolioChartDTO;
    }

    @Override
    public PortfolioPageDTO getPortfolioPage(PortfolioPageVO portfolioPageVO) {
        List<PortfolioDTO> list = new ArrayList<>();
        Page<MyFundPortfolio> page = new Page<>(portfolioPageVO.getPage(), portfolioPageVO.getPageSize());
        IPage<MyFundPortfolio> iPage = page(page, Wrappers.<MyFundPortfolio>lambdaQuery()
                .eq(MyFundPortfolio::getAccountId, portfolioPageVO.getAccountId())
                .orderByDesc(MyFundPortfolio::getProfitRate));
        for (MyFundPortfolio fundPortfolio : iPage.getRecords()){
            PortfolioDTO portfolioDTO = new PortfolioDTO();
            portfolioDTO.setId(String.valueOf(fundPortfolio.getId()));
            portfolioDTO.setName(fundPortfolio.getName());
            portfolioDTO.setMoney(CommonConstant.DECIMAL_FORMAT.format(fundPortfolio.getMoney()));
            portfolioDTO.setPrincipal(CommonConstant.DECIMAL_FORMAT.format(fundPortfolio.getPrincipal()));
            portfolioDTO.setProfit(CommonConstant.DECIMAL_FORMAT.format(fundPortfolio.getProfit()));
            portfolioDTO.setProfitRate(CommonConstant.DECIMAL_FORMAT.format(fundPortfolio.getProfitRate().multiply(BigDecimal.valueOf(100))));
            portfolioDTO.setUpdateTime(fundPortfolio.getUpdateTime());
            portfolioDTO.setCreateTime(fundPortfolio.getCreateTime());
            list.add(portfolioDTO);
        }
        PortfolioPageDTO portfolioPageDTO = new PortfolioPageDTO();
        portfolioPageDTO.setPortfolioList(list);
        portfolioPageDTO.setCurrentPage(portfolioPageVO.getPage());
        portfolioPageDTO.setTotalNum(iPage.getTotal());
        return portfolioPageDTO;
    }

    @Override
    public Map<String, Object> updatePortfolio(PortfolioChangeVO portfolioChangeVO) {
        MyFundPortfolio portfolio = getById(portfolioChangeVO.getPortfolioId());
        if (null != portfolio){
            portfolio.setMoney(portfolio.getMoney().add(new BigDecimal(portfolioChangeVO.getChangeMoney())));
            if (FundEnum.FundChangeEnum.AMOUNT_UPDATE.getCode() == Integer.parseInt(portfolioChangeVO.getChangeType())){
                portfolio.setProfit(portfolio.getProfit().add(new BigDecimal(portfolioChangeVO.getChangeMoney())));
            }else {
                portfolio.setPrincipal(portfolio.getPrincipal().add(new BigDecimal(portfolioChangeVO.getChangeMoney())));
            }
            BigDecimal profitRate = portfolio.getProfit().divide(portfolio.getPrincipal(), 4, RoundingMode.HALF_UP);
            portfolio.setProfitRate(profitRate);
        }else {
            portfolio = new MyFundPortfolio();
            portfolio.setName(portfolioChangeVO.getName());
            portfolio.setMoney(new BigDecimal(portfolioChangeVO.getChangeMoney()));
            portfolio.setPrincipal(new BigDecimal(portfolioChangeVO.getChangeMoney()));
            portfolio.setAccountId(Integer.parseInt(portfolioChangeVO.getAccountId()));
            portfolio.setAccountName(portfolioChangeVO.getAccountName());
            portfolio.setCreateTime(DateUtil.parseLocalDateTime(portfolioChangeVO.getCreateTime(), "yyyy-MM-dd"));
            portfolio.setProfit(BigDecimal.ZERO);
            portfolio.setProfitRate(BigDecimal.ZERO);
        }
        portfolio.setType(Integer.parseInt(portfolioChangeVO.getType()));
        portfolio.setUpdateTime(DateUtil.parseLocalDateTime(portfolioChangeVO.getCreateTime(), "yyyy-MM-dd"));
        boolean result = saveOrUpdate(portfolio);
        Map<String, Object> map = new HashMap<>();
        map.put("result", result);
        map.put("portfolio", portfolio);
        return map;
    }

    @Override
    public PortfolioInfoListDTO getPortfolioInfos(String accountId) {
        PortfolioInfoListDTO portfolioInfoListDTO = new PortfolioInfoListDTO();
        List<PortfolioInfoDTO> portfolioInfoDTOS = new ArrayList<>();
        List<MyFundPortfolio> myPortfolios = list(Wrappers.<MyFundPortfolio>lambdaQuery()
                .eq(MyFundPortfolio::getAccountId, Integer.parseInt(accountId)));
        for (MyFundPortfolio portfolio : myPortfolios){
            PortfolioInfoDTO portfolioInfoDTO = new PortfolioInfoDTO();
            portfolioInfoDTO.setId(String.valueOf(portfolio.getId()));
            portfolioInfoDTO.setName(portfolio.getName());
            portfolioInfoDTOS.add(portfolioInfoDTO);
        }
        portfolioInfoListDTO.setPortfolioInfoDTOS(portfolioInfoDTOS);
        return portfolioInfoListDTO;
    }

    @Override
    public PortfolioDTO getPortfolioInfo(String id) {
        MyFundPortfolio myFundPortfolio = getById(id);
        PortfolioDTO portfolioDTO = new PortfolioDTO();
        if (null != myFundPortfolio){
            portfolioDTO.setId(String.valueOf(myFundPortfolio.getId()));
            portfolioDTO.setName(myFundPortfolio.getName());
            portfolioDTO.setMoney(CommonConstant.DECIMAL_FORMAT.format(myFundPortfolio.getMoney()));
            portfolioDTO.setPrincipal(CommonConstant.DECIMAL_FORMAT.format(myFundPortfolio.getPrincipal()));
            portfolioDTO.setProfit(CommonConstant.DECIMAL_FORMAT.format(myFundPortfolio.getProfit()));
            portfolioDTO.setType(String.valueOf(myFundPortfolio.getType()));
            portfolioDTO.setProfitRate(CommonConstant.DECIMAL_FORMAT.format(myFundPortfolio.getProfitRate()));
            portfolioDTO.setUpdateTime(myFundPortfolio.getUpdateTime());
        }else{
            portfolioDTO.setName(id);
        }
        return portfolioDTO;
    }


    private Map<String, Object> getDate(){
        Map<String, Object> map = new HashMap<>();
        List<String> dateList = new ArrayList<>();
        DateTime end = DateUtil.yesterday().setField(DateField.HOUR_OF_DAY, 0).setField(DateField.MINUTE,0).setField(DateField.SECOND, 0);
        DateTime start = DateUtil.offsetDay(end, -90);
        DateTime myTime = DateUtil.parse("2022-01-25", "yyyy-MM-dd");
        DateTime loopTime;
        if (start.isBefore(myTime)){
            loopTime = myTime;
            start = myTime;
        }else {
            loopTime = start;
        }
        while (loopTime.isBefore(end)){
            dateList.add(loopTime.toString("yyyy-MM-dd"));
            loopTime = DateUtil.offsetDay(loopTime, 1);
        }
        map.put("date", dateList);
        map.put("start", start);
        map.put("end", end);
        return map;
    }

    private Map<String, List<Double>> getTotal(List<MyFundPortfolio> portfolioList, DateTime start, DateTime end){
        List<Double> totalList = new ArrayList<>();
        List<Double> principalList = new ArrayList<>();
        List<Integer> idList = portfolioList.stream().map(MyFundPortfolio::getId).collect(Collectors.toList());
        for (DateTime i = start ; i.isBefore(end); i = DateUtil.offsetDay(i, 1)){
            List<MyFundPortfolioDetail> fundDetailList = portfolioDetailMapper.selectList(Wrappers.<MyFundPortfolioDetail>lambdaQuery()
                    .eq(MyFundPortfolioDetail::getType, FundEnum.FundChangeEnum.AMOUNT_UPDATE.getCode())
                    .in(MyFundPortfolioDetail::getFundPortfolioId, idList)
                    .eq(MyFundPortfolioDetail::getCreateTime, i));
            BigDecimal total = fundDetailList.stream().map(MyFundPortfolioDetail::getNewAssets).reduce(BigDecimal.ZERO, BigDecimal::add);
            BigDecimal principal = fundDetailList.stream().map(MyFundPortfolioDetail::getPrincipal).reduce(BigDecimal.ZERO, BigDecimal::add);
            totalList.add(total.doubleValue());
            principalList.add(principal.doubleValue());
        }
        Map<String, List<Double>> map = new HashMap<>();
        map.put("total", totalList);
        map.put("principal", principalList);

        return map;
    }
}
