package com.maze.project.web.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maze.project.web.common.constant.CommonConstant;
import com.maze.project.web.common.enums.FundEnum;
import com.maze.project.web.dto.common.BarValueDTO;
import com.maze.project.web.dto.common.PieDTO;
import com.maze.project.web.dto.fund.PortfolioChartDTO;
import com.maze.project.web.dto.portfolio.PortfolioDTO;
import com.maze.project.web.dto.portfolio.PortfolioInfoDTO;
import com.maze.project.web.dto.portfolio.PortfolioInfoListDTO;
import com.maze.project.web.dto.portfolio.PortfolioPageDTO;
import com.maze.project.web.entity.MyFundPortfolio;
import com.maze.project.web.mapper.MyFundPortfolioMapper;
import com.maze.project.web.service.MyFundPortfolioService;
import com.maze.project.web.vo.portfolio.PortfolioChangeVO;
import com.maze.project.web.vo.portfolio.PortfolioPageVO;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Override
    public PortfolioChartDTO getChart(String accountId) {
        List<PieDTO> pieList = new ArrayList<>();
        List<String> portfolioNameList = new ArrayList<>();
        List<BarValueDTO> profitRateList = new ArrayList<>();
        List<MyFundPortfolio> portfolioList = list(Wrappers.<MyFundPortfolio>lambdaQuery().eq(MyFundPortfolio::getAccountId, accountId));
        for (MyFundPortfolio portfolio : portfolioList){
            PieItemColor itemColor = new PieItemColor();
            String color = CommonConstant.randomColor();
            itemColor.setColor(color);

            PieDTO pieDTO = new PieDTO();
            pieDTO.setName(portfolio.getName());
            pieDTO.setValue(portfolio.getMoney().doubleValue());
            pieDTO.setItemStyle(itemColor);
            pieList.add(pieDTO);

            BarValueDTO barValueDTO = new BarValueDTO();
            barValueDTO.setValue(portfolio.getProfitRate().multiply(BigDecimal.valueOf(100)).doubleValue());
            barValueDTO.setColor(color);

            profitRateList.add(barValueDTO);

            portfolioNameList.add(portfolio.getName());
        }
        PortfolioChartDTO portfolioChartDTO = new PortfolioChartDTO();
        portfolioChartDTO.setPieList(pieList);
        portfolioChartDTO.setProfitRateList(profitRateList);

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
            if (FundEnum.FundChangeEnum.AMOUNT_UPDATE.getCode() == Integer.parseInt(portfolioChangeVO.getType())){
                portfolio.setProfit(portfolio.getProfit().add(new BigDecimal(portfolioChangeVO.getChangeMoney())));
            }else {
                portfolio.setPrincipal(portfolio.getPrincipal().add(new BigDecimal(portfolioChangeVO.getChangeMoney())));
            }
        }else {
            portfolio = new MyFundPortfolio();
            portfolio.setName(portfolioChangeVO.getName());
            portfolio.setMoney(new BigDecimal(portfolioChangeVO.getChangeMoney()));
            portfolio.setPrincipal(new BigDecimal(portfolioChangeVO.getChangeMoney()));
            portfolio.setAccountId(Integer.parseInt(portfolioChangeVO.getAccountId()));
            portfolio.setAccountName(portfolioChangeVO.getAccountName());
            portfolio.setCreateTime(LocalDateTime.now());
            portfolio.setProfit(BigDecimal.ZERO);
            portfolio.setProfitRate(BigDecimal.ZERO);
        }
        portfolio.setType(Integer.parseInt(portfolioChangeVO.getType()));
        portfolio.setUpdateTime(LocalDateTime.now());
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
        }
        return portfolioDTO;
    }
}
