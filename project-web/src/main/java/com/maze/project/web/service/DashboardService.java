package com.maze.project.web.service;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.maze.project.web.common.constant.CommonConstant;
import com.maze.project.web.common.enums.FundEnum;
import com.maze.project.web.common.enums.PortfolioEnum;
import com.maze.project.web.dto.common.PieDTO;
import com.maze.project.web.dto.common.PieItemColor;
import com.maze.project.web.entity.MyCash;
import com.maze.project.web.entity.MyFund;
import com.maze.project.web.entity.MyFundPortfolio;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
public class DashboardService {

    private final MyFundService fundService;
    private final MyFundPortfolioService portfolioService;
    private final MyCashService cashService;

    public DashboardService(MyFundService fundService, MyFundPortfolioService portfolioService, MyCashService cashService) {
        this.fundService = fundService;
        this.portfolioService = portfolioService;
        this.cashService = cashService;
    }

    public void index(){

    }

    private List<PieDTO> buildPie(){
        //稳健组合
        List<MyFundPortfolio> robustList = portfolioService.list(Wrappers.<MyFundPortfolio>lambdaQuery()
                .eq(MyFundPortfolio::getType, PortfolioEnum.PortfolioTypeEnum.ROBUST.getCode()));
        BigDecimal robustTotal = robustList.stream().map(MyFundPortfolio::getMoney).reduce(BigDecimal.ZERO, BigDecimal::add);
        //积极增值组合
        List<MyFundPortfolio> aggressiveList = portfolioService.list(Wrappers.<MyFundPortfolio>lambdaQuery()
                .in(MyFundPortfolio::getType, PortfolioEnum.PortfolioTypeEnum.FIXED_CASTING.getCode(), PortfolioEnum.PortfolioTypeEnum.AGGRESSIVE.getCode()));
        BigDecimal aggressiveTotal = aggressiveList.stream().map(MyFundPortfolio::getMoney).reduce(BigDecimal.ZERO, BigDecimal::add);
        //货币基金
        List<MyFund> monetaryList = fundService.list(Wrappers.<MyFund>lambdaQuery().eq(MyFund::getType, FundEnum.FundTypeEnum.MONETARY_FUND.getCode()));
        BigDecimal monetaryTotal = monetaryList.stream().map(MyFund::getFundMoney).reduce(BigDecimal.ZERO, BigDecimal::add);
        //指数+主动+ETF 基金
        List<MyFund> otherFundList = fundService.list(Wrappers.<MyFund>lambdaQuery()
                .in(MyFund::getType, FundEnum.FundTypeEnum.INDEX_FUND.getCode(), FundEnum.FundTypeEnum.ACTIVE_FUND.getCode(),
                        FundEnum.FundTypeEnum.ETF_FUND.getCode()));
        BigDecimal othereFundTotal = otherFundList.stream().map(MyFund::getFundMoney).reduce(BigDecimal.ZERO, BigDecimal::add);
        //现金
        List<MyCash> cashList = cashService.list();
        BigDecimal cashTotal = cashList.stream().map(MyCash::getAmount).reduce(BigDecimal.ZERO, BigDecimal::add);

        List<PieDTO> pieList = new ArrayList<>();
        PieDTO cashPie = new PieDTO();
        PieItemColor itemColor = new PieItemColor();
        String cashColor = CommonConstant.randomColor();
        itemColor.setColor(cashColor);
        cashPie.setName("现金");
        cashPie.setValue(cashTotal.doubleValue());
        cashPie.setItemStyle(itemColor);

        PieDTO robustPie = new PieDTO();
        PieItemColor robustColor = new PieItemColor();
        String color = CommonConstant.randomColor();
        robustColor.setColor(color);
        robustPie.setName("稳健");
        robustPie.setValue(robustTotal.add(monetaryTotal).doubleValue());
        robustPie.setItemStyle(robustColor);

        PieDTO aggressivePie = new PieDTO();
        PieItemColor aggressiveColor = new PieItemColor();
        String color1 = CommonConstant.randomColor();
        aggressiveColor.setColor(color1);
        aggressivePie.setName("积极增值");
        aggressivePie.setValue(aggressiveTotal.add(othereFundTotal).doubleValue());
        aggressivePie.setItemStyle(aggressiveColor);

        pieList.add(cashPie);
        pieList.add(robustPie);
        pieList.add(aggressivePie);

        return pieList;
    }
}
