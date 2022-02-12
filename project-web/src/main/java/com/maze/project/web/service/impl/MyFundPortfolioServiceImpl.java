package com.maze.project.web.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maze.project.web.common.constant.CommonConstant;
import com.maze.project.web.dto.common.PieDTO;
import com.maze.project.web.dto.portfolio.PortfolioChartDTO;
import com.maze.project.web.dto.portfolio.PortfolioDTO;
import com.maze.project.web.dto.portfolio.PortfolioPageDTO;
import com.maze.project.web.entity.MyFundPortfolio;
import com.maze.project.web.entity.MyFundPortfolioDetail;
import com.maze.project.web.mapper.MyFundPortfolioDetailMapper;
import com.maze.project.web.mapper.MyFundPortfolioMapper;
import com.maze.project.web.service.MyFundPortfolioService;
import com.maze.project.web.vo.portfolio.PortfolioChangeVO;
import com.maze.project.web.vo.portfolio.PortfolioPageVO;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
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
        List<MyFundPortfolio> portfolioList = list(Wrappers.<MyFundPortfolio>lambdaQuery().eq(MyFundPortfolio::getAccountId, accountId));
        Map<String, List<String>> map = getDate(portfolioList);
        List<String> dateList = map.get("date");
        for (MyFundPortfolio portfolio : portfolioList){

            PieDTO pieDTO = new PieDTO();
            pieDTO.setName(portfolio.getName());
            pieDTO.setValue(portfolio.getMoney().doubleValue());
            pieList.add(pieDTO);

        }
        Map<String, List<Double>> totalMap = getTotal(portfolioList, dateList);
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
            portfolioDTO.setProfitRate(CommonConstant.DECIMAL_FORMAT.format(fundPortfolio.getProfitRate()));
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
    public Integer updatePortfolio(PortfolioChangeVO portfolioChangeVO) {
        BigDecimal newAssets = new BigDecimal(portfolioChangeVO.getNewMoney());
        BigDecimal profit = new BigDecimal(portfolioChangeVO.getProfit());
        BigDecimal principal = newAssets.multiply(profit);
        MyFundPortfolio portfolio = getById(portfolioChangeVO.getPortfolioId());
        if (null != portfolio){
            portfolio.setMoney(newAssets);
            portfolio.setProfit(profit);
            portfolio.setProfitRate(new BigDecimal(portfolioChangeVO.getProfitRate()));
            portfolio.setPrincipal(principal);
        }else {
            portfolio = new MyFundPortfolio();
            portfolio.setName(portfolioChangeVO.getName());
            portfolio.setMoney(newAssets);
            portfolio.setPrincipal(principal);
            portfolio.setAccountId(Integer.parseInt(portfolioChangeVO.getAccountId()));
            portfolio.setAccountName(portfolioChangeVO.getAccountName());
            portfolio.setProfit(profit);
            portfolio.setProfitRate(new BigDecimal(portfolioChangeVO.getProfitRate()));
            portfolio.setCreateTime(DateUtil.parseLocalDateTime(portfolioChangeVO.getCreateTime(), "yyyy-MM-dd"));
        }
        portfolio.setType(Integer.parseInt(portfolioChangeVO.getType()));
        portfolio.setUpdateTime(DateUtil.parseLocalDateTime(portfolioChangeVO.getCreateTime(), "yyyy-MM-dd"));
        saveOrUpdate(portfolio);
        return portfolio.getId();
    }


    private Map<String, List<String>> getDate(List<MyFundPortfolio> portfolioList){
        Map<String, List<String>> map = new HashMap<>();
        List<String> dateList = new ArrayList<>();
        if (CollectionUtil.isNotEmpty(portfolioList)){
            List<Integer> portfolios = portfolioList.stream().map(MyFundPortfolio::getId).collect(Collectors.toList());
            List<MyFundPortfolioDetail> myPortfolioDetails = portfolioDetailMapper.selectList(Wrappers.<MyFundPortfolioDetail>lambdaQuery()
                    .select(MyFundPortfolioDetail::getCreateTime).in(MyFundPortfolioDetail::getFundPortfolioId, portfolios)
                    .groupBy(MyFundPortfolioDetail::getCreateTime));
            dateList = myPortfolioDetails.stream().map(portfolioDetail -> DateUtil.format(portfolioDetail.getCreateTime(),"yyyy-MM-dd"))
                    .collect(Collectors.toList());
        }
        map.put("date", dateList);
        return map;
    }

    private Map<String, List<Double>> getTotal(List<MyFundPortfolio> portfolioList, List<String> dateList){
        List<Double> totalList = new ArrayList<>();
        List<Double> principalList = new ArrayList<>();
        for (String date : dateList){
            if (CollectionUtil.isNotEmpty(portfolioList)){
                List<Integer> idList = portfolioList.stream().map(MyFundPortfolio::getId).collect(Collectors.toList());
                List<MyFundPortfolioDetail> portfolioDetailList = portfolioDetailMapper.selectList(Wrappers.<MyFundPortfolioDetail>lambdaQuery()
                        .in(MyFundPortfolioDetail::getFundPortfolioId, idList)
                        .eq(MyFundPortfolioDetail::getCreateTime, date));
                BigDecimal total = portfolioDetailList.stream().map(MyFundPortfolioDetail::getNewAssets).reduce(BigDecimal.ZERO, BigDecimal::add);
                BigDecimal principal = portfolioDetailList.stream().map(MyFundPortfolioDetail::getPrincipal).reduce(BigDecimal.ZERO, BigDecimal::add);

                totalList.add(total.doubleValue());
                principalList.add(principal.doubleValue());
            }


        }
        Map<String, List<Double>> map = new HashMap<>();
        map.put("total", totalList);
        map.put("principal", principalList);

        return map;
    }
}
