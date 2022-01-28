package com.maze.project.web.service;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.maze.project.web.common.enums.FundEnum;
import com.maze.project.web.common.enums.PortfolioEnum;
import com.maze.project.web.dto.common.PieDTO;
import com.maze.project.web.dto.dashboard.IndexDTO;
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

    public IndexDTO index(){
        IndexDTO indexDTO = new IndexDTO();
        Map<String, Double> assetsInfo = getAssetsInfo();
        Map<String, Object> everyTotal = getEveryDayAssets();

        indexDTO.setTotalAssets(assetsInfo.get("totalMoney"));
        indexDTO.setTotalProfit(assetsInfo.get("totalProfit"));
        indexDTO.setYesterdayProfit(yesterdayProfit());
        indexDTO.setPieList(buildPie());
        indexDTO.setDateList((List<String>) everyTotal.get("date"));
        indexDTO.setMoneyList((List<Double>) everyTotal.get("everyAssets"));

        return indexDTO;
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
        DateTime yesterday = DateUtil.yesterday();
        List<MyFundDetail> fundDetail = fundDetailService.list(Wrappers.<MyFundDetail>lambdaQuery()
                .eq(MyFundDetail::getType, FundEnum.FundChangeEnum.AMOUNT_UPDATE.getCode())
                .eq(MyFundDetail::getCreateTime, yesterday.toString("yyyy-MM-dd")));
        BigDecimal fundDetailProfit = CollUtil.isEmpty(fundDetail) ? BigDecimal.ZERO :
                fundDetail.stream().map(MyFundDetail::getChangeMoney).reduce(BigDecimal.ZERO, BigDecimal::add);

        List<MyFundPortfolioDetail> portfolioDetail = portfolioDetailService.list(Wrappers.<MyFundPortfolioDetail>lambdaQuery()
                .eq(MyFundPortfolioDetail::getType, FundEnum.FundChangeEnum.AMOUNT_UPDATE.getCode())
                .eq(MyFundPortfolioDetail::getCreateTime, yesterday.toString("yyyy-MM-dd")));
        BigDecimal portfolioProfit = CollUtil.isEmpty(portfolioDetail) ? BigDecimal.ZERO :
                portfolioDetail.stream().map(MyFundPortfolioDetail::getChangeMoney).reduce(BigDecimal.ZERO, BigDecimal::add);

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

    /**
     * 每日资产变化
     * @return map
     */
    private Map<String, Object> getEveryDayAssets(){
        Map<String, Object> map = new HashMap<>();
        List<String> dateList = new ArrayList<>();
        List<Double> assetList = new ArrayList<>();
        DateTime end = DateUtil.yesterday().setField(DateField.HOUR_OF_DAY, 0).setField(DateField.MINUTE,0).setField(DateField.SECOND, 0);
        DateTime start = DateUtil.offsetDay(end, -90);
        DateTime myTime = DateUtil.parse("2022-01-25", "yyyy-MM-dd");
        if (start.isBefore(myTime)){
            start = myTime;
        }
        while (start.isBefore(end)){
            dateList.add(start.toString("yyyy-MM-dd"));
            List<MyFundDetail> fundDetail = fundDetailService.list(Wrappers.<MyFundDetail>lambdaQuery()
                    .eq(MyFundDetail::getType, FundEnum.FundChangeEnum.AMOUNT_UPDATE.getCode())
                    .eq(MyFundDetail::getCreateTime, start));
            BigDecimal totalFund = fundDetail.stream().map(MyFundDetail::getNewMoney).reduce(BigDecimal.ZERO, BigDecimal::add);
            List<MyFundPortfolioDetail> portfolioDetails = portfolioDetailService.list(Wrappers.<MyFundPortfolioDetail>lambdaQuery()
                    .eq(MyFundPortfolioDetail::getType, FundEnum.FundChangeEnum.AMOUNT_UPDATE.getCode())
                    .eq(MyFundPortfolioDetail::getCreateTime, start));
            BigDecimal totalPortfolio = portfolioDetails.stream().map(MyFundPortfolioDetail::getNewAssets).reduce(BigDecimal.ZERO, BigDecimal::add);
            List<MyCash> cashList = cashService.list();
            BigDecimal cashMoney = cashList.stream().map(MyCash::getAmount).reduce(BigDecimal.ZERO, BigDecimal::add);
            BigDecimal total = totalFund.add(totalPortfolio).add(cashMoney);
            assetList.add(total.doubleValue());

            start = DateUtil.offsetDay(start, 1);
        }
        map.put("date", dateList);
        map.put("everyAssets", assetList);

        return map;
    }
}
