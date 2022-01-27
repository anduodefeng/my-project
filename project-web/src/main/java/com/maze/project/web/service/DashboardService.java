package com.maze.project.web.service;

import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.maze.project.web.common.enums.FundEnum;
import com.maze.project.web.common.enums.PortfolioEnum;
import com.maze.project.web.dto.common.PieDTO;
import com.maze.project.web.entity.*;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DashboardService {

    private final MyFundService fundService;
    private final MyFundDetailService fundDetailService;
    private final MyFundPortfolioService portfolioService;
    private final MyFundPortfolioDetailService portfolioDetailService;
    private final MyCashService cashService;

    public DashboardService(MyFundService fundService, MyFundDetailService fundDetailService,
                            MyFundPortfolioService portfolioService,
                            MyFundPortfolioDetailService portfolioDetailService, MyCashService cashService) {
        this.fundService = fundService;
        this.fundDetailService = fundDetailService;
        this.portfolioService = portfolioService;
        this.portfolioDetailService = portfolioDetailService;
        this.cashService = cashService;
    }

    public void index(){

    }

    /**
     * 总资产和盈利信息
     * @return map
     */
    private Map<String, Double> getAssetsInfo(){
        Map<String, Double> map = new HashMap<>();
        List<MyCash> cashList = cashService.list();
        List<MyFund> fundList = fundService.list();
        List<MyFundPortfolio> portfolioList = portfolioService.list();
        BigDecimal cashMoney = cashList.stream().map(MyCash::getAmount).reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal fundMoney = BigDecimal.ZERO;
        BigDecimal fundProfit = BigDecimal.ZERO;
        for (MyFund fund : fundList){
            fundMoney = fundMoney.add(fund.getFundMoney());
            fundProfit = fundProfit.add(fund.getProfit());
        }
        BigDecimal portfolioMoney = BigDecimal.ZERO;
        BigDecimal portfolioProfit = BigDecimal.ZERO;
        for (MyFundPortfolio portfolio : portfolioList){
            portfolioMoney = portfolioMoney.add(portfolio.getMoney());
            portfolioProfit = portfolioProfit.add(portfolio.getProfit());
        }
        double totalMoney = cashMoney.add(fundMoney).add(portfolioMoney).doubleValue();
        double totalProfit = fundProfit.add(portfolioProfit).doubleValue();

        map.put("totalMoney", totalMoney);
        map.put("totalProfit", totalProfit);

        return map;
    }

    /**
     * 昨日盈亏
     * @return double
     */
    private double yesterdayProfit(){
        DateTime yesterday = DateUtil.yesterday().setField(DateField.HOUR_OF_DAY, 0)
                .setField(DateField.MINUTE, 0).setField(DateField.SECOND, 0);
        MyFundDetail fundDetail = fundDetailService.getOne(Wrappers.<MyFundDetail>lambdaQuery()
                .eq(MyFundDetail::getType, FundEnum.FundChangeEnum.AMOUNT_UPDATE.getCode())
                .eq(MyFundDetail::getCreateTime, yesterday));
        BigDecimal fundDetailProfit = null == fundDetail ? BigDecimal.ZERO : fundDetail.getChangeMoney();
        MyFundPortfolioDetail portfolioDetail = portfolioDetailService.getOne(Wrappers.<MyFundPortfolioDetail>lambdaQuery()
                .eq(MyFundPortfolioDetail::getType, FundEnum.FundChangeEnum.AMOUNT_UPDATE.getCode())
                .eq(MyFundPortfolioDetail::getCreateTime, yesterday));
        BigDecimal portfolioProfit = null == portfolioDetail ? BigDecimal.ZERO : portfolioDetail.getChangeMoney();

        return fundDetailProfit.add(portfolioProfit).doubleValue();
    }
    /**
     * @description: 饼图
     * @param:
     * @return: java.util.List<com.maze.project.web.dto.common.PieDTO>
     * @author maze
     * @date: 2022/1/27 20:26
     */
    private List<PieDTO> buildPie(){
        //稳健组合(固收+)
        List<MyFundPortfolio> robustList = portfolioService.list(Wrappers.<MyFundPortfolio>lambdaQuery()
                .eq(MyFundPortfolio::getType, PortfolioEnum.PortfolioTypeEnum.ROBUST.getCode()));
        BigDecimal robustTotal = robustList.stream().map(MyFundPortfolio::getMoney).reduce(BigDecimal.ZERO, BigDecimal::add);
        //积极增值组合(定投+积极进取)
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
        cashPie.setName("现金");
        cashPie.setValue(cashTotal.doubleValue());

        PieDTO monetaryPie = new PieDTO();
        monetaryPie.setName("货币基金");
        monetaryPie.setValue(monetaryTotal.doubleValue());

        PieDTO robustPie = new PieDTO();
        robustPie.setName("固收+");
        robustPie.setValue(robustTotal.doubleValue());

        PieDTO aggressivePie = new PieDTO();
        aggressivePie.setName("积极增值");
        aggressivePie.setValue(aggressiveTotal.add(othereFundTotal).doubleValue());

        pieList.add(cashPie);
        pieList.add(monetaryPie);
        pieList.add(aggressivePie);
        pieList.add(robustPie);

        return pieList;
    }
}
