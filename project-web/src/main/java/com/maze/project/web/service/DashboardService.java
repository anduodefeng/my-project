package com.maze.project.web.service;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.maze.project.web.common.enums.FundEnum;
import com.maze.project.web.common.enums.PortfolioEnum;
import com.maze.project.web.dto.common.ManyLineDTO;
import com.maze.project.web.dto.common.PieDTO;
import com.maze.project.web.dto.dashboard.IndexDTO;
import com.maze.project.web.entity.*;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
        //总金额、总盈利
        Map<String, Double> assetsInfo = getAssetsInfo();
        Map<String, Object> everyTotal = getEveryDayAssets();
        List<String> dateList = (List<String>) everyTotal.get("date");
        List<Double> moneyList = (List<Double>) everyTotal.get("everyAssets");
        List<Double> principalList = (List<Double>) everyTotal.get("principal");
        List<List<Double>> profitEveryday = (List<List<Double>>) everyTotal.get("profitEveryday");

        indexDTO.setTotalAssets(assetsInfo.get("totalMoney"));
        indexDTO.setTotalProfit(assetsInfo.get("totalProfit"));

        BigDecimal totalPrincipal = BigDecimal.valueOf(indexDTO.getTotalAssets()).subtract(BigDecimal.valueOf(indexDTO.getTotalProfit()));
        BigDecimal totalProfitRate = BigDecimal.valueOf(indexDTO.getTotalProfit()).divide(totalPrincipal, 4, RoundingMode.HALF_UP);
        totalProfitRate = totalProfitRate.multiply(BigDecimal.valueOf(100));
        indexDTO.setTotalProfitRate(totalProfitRate.doubleValue());

        indexDTO.setPieList(buildPie());
        indexDTO.setDateList(dateList);
        indexDTO.setMoneyList(moneyList);
        indexDTO.setPrincipalList(principalList);
        indexDTO.setProfitEveryday(profitEveryday);


        Map<String, Object> indexFundLine = getFundLine(FundEnum.FundTypeEnum.INDEX_FUND.getCode(), dateList);
        indexDTO.setIndexFundNameList((List<String>) indexFundLine.get("fundName"));
        indexDTO.setIndexFundLine((List<ManyLineDTO>) indexFundLine.get("manyLine"));
        Map<String, Object> activeFundLine = getFundLine(FundEnum.FundTypeEnum.ACTIVE_FUND.getCode(), dateList);
        indexDTO.setActiveFundNameList((List<String>) activeFundLine.get("fundName"));
        indexDTO.setActiveFundLine((List<ManyLineDTO>) activeFundLine.get("manyLine"));

        List<Integer> list = new ArrayList<>();
        list.add(PortfolioEnum.PortfolioTypeEnum.ROBUST.getCode());
        Map<String, Object> robustPortfolioLine = getPortfolioLine(list, dateList);
        indexDTO.setRobustPortfolioNameList((List<String>) robustPortfolioLine.get("portfolioName"));
        indexDTO.setRobustPortfolioLine((List<ManyLineDTO>) robustPortfolioLine.get("manyLine"));
        list.clear();
        list.add(PortfolioEnum.PortfolioTypeEnum.AGGRESSIVE.getCode());
        list.add(PortfolioEnum.PortfolioTypeEnum.FIXED_CASTING.getCode());
        Map<String, Object> aggressivePortfolioLine = getPortfolioLine(list, dateList);
        indexDTO.setAggressivePortfolioNameList((List<String>) aggressivePortfolioLine.get("portfolioName"));
        indexDTO.setAggressivePortfolioLine((List<ManyLineDTO>) aggressivePortfolioLine.get("manyLine"));

        indexDTO.setCalendarList(getMonth());

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
        List<Double> assetList = new ArrayList<>();
        List<Double> principalList = new ArrayList<>();
        List<List<Double>> profitEveryday = new ArrayList<>();

        List<MyFundDetail> fundDetailList = fundDetailService.list(Wrappers.<MyFundDetail>lambdaQuery().select(MyFundDetail::getCreateTime)
                .groupBy(MyFundDetail::getCreateTime).orderByAsc(MyFundDetail::getCreateTime));
        List<String> dateList = fundDetailList.stream().map(fundDetail -> DateUtil.format(fundDetail.getCreateTime(), "yyyy-MM-dd")).collect(Collectors.toList());

        for (String date : dateList){
            List<MyFundDetail> fundAssets = fundDetailService.list(Wrappers.<MyFundDetail>lambdaQuery()
                    .eq(MyFundDetail::getCreateTime, date));
            BigDecimal totalFundAssets = BigDecimal.ZERO;
            BigDecimal totalFundPrincipal = BigDecimal.ZERO;
            BigDecimal totalFundProfit = BigDecimal.ZERO;
            if (CollectionUtil.isNotEmpty(fundAssets)) {
                totalFundAssets = fundAssets.stream().map(MyFundDetail::getNewMoney).reduce(BigDecimal.ZERO, BigDecimal::add);
                totalFundPrincipal = fundAssets.stream().map(MyFundDetail::getPrincipal).reduce(BigDecimal.ZERO, BigDecimal::add);
                totalFundProfit = fundAssets.stream().map(MyFundDetail::getProfit).reduce(BigDecimal.ZERO, BigDecimal::add);
            }

            List<MyFundPortfolioDetail> portfolioDetails = portfolioDetailService.list(Wrappers.<MyFundPortfolioDetail>lambdaQuery()
                    .eq(MyFundPortfolioDetail::getCreateTime, date));
            BigDecimal totalPortfolioAssets = BigDecimal.ZERO;
            BigDecimal totalPortfolioPrincipal = BigDecimal.ZERO;
            BigDecimal totalPortfolioProfit = BigDecimal.ZERO;
            if (CollectionUtil.isNotEmpty(portfolioDetails)) {
                totalPortfolioAssets = portfolioDetails.stream().map(MyFundPortfolioDetail::getNewAssets).reduce(BigDecimal.ZERO, BigDecimal::add);
                totalPortfolioPrincipal = portfolioDetails.stream().map(MyFundPortfolioDetail::getPrincipal).reduce(BigDecimal.ZERO, BigDecimal::add);
                totalPortfolioProfit = portfolioDetails.stream().map(MyFundPortfolioDetail::getProfit).reduce(BigDecimal.ZERO, BigDecimal::add);
            }

            List<MyCash> cashList = cashService.list();
            BigDecimal cashMoney = cashList.stream().map(MyCash::getAmount).reduce(BigDecimal.ZERO, BigDecimal::add);

            BigDecimal total = totalFundAssets.add(totalPortfolioAssets).add(cashMoney);
            BigDecimal principal = totalFundPrincipal.add(totalPortfolioPrincipal).add(cashMoney);
            assetList.add(total.doubleValue());
            principalList.add(principal.doubleValue());

            BigDecimal totalProfit = totalFundProfit.add(totalPortfolioProfit);
            List<Double> changeList = new ArrayList<>();
            changeList.add(0d);
            changeList.add(totalProfit.doubleValue());
            changeList.add(0d);
            changeList.add(totalProfit.doubleValue());

            profitEveryday.add(changeList);
        }
        map.put("date", dateList);
        map.put("everyAssets", assetList);
        map.put("principal", principalList);
        map.put("profitEveryday", profitEveryday);

        return map;
    }

    /**
     * 基金收益率
     * @param fundType  基金类型
     * @param dateList  日期列表
     * @return  map
     */
    private Map<String, Object> getFundLine(int fundType,List<String> dateList){
        List<ManyLineDTO> manyLineList = new ArrayList<>();
        List<String> indexNameList = new ArrayList<>();
        List<MyFund> fundList = fundService.list(Wrappers.<MyFund>lambdaQuery().eq(MyFund::getType, fundType).gt(MyFund::getFundMoney, 0));
        String start = dateList.get(0);
        String end = dateList.get(dateList.size()-1);
        for (MyFund fund : fundList){
            ManyLineDTO manyLineDTO = new ManyLineDTO();
            manyLineDTO.setName(fund.getFundName());
            List<MyFundDetail> fundDetailList = fundDetailService.list(Wrappers.<MyFundDetail>lambdaQuery()
                    .eq(MyFundDetail::getFundCode, fund.getFundCode())
                    .between(MyFundDetail::getCreateTime, start, end).orderByAsc(MyFundDetail::getCreateTime));
            List<Double> list = fundDetailList.stream().map(myFundDetail -> myFundDetail.getProfitRate().doubleValue())
                    .collect(Collectors.toList());
            manyLineDTO.setData(list);
            indexNameList.add(fund.getFundName());
            manyLineList.add(manyLineDTO);
        }
        Map<String, Object> map = new HashMap<>();
        map.put("manyLine", manyLineList);
        map.put("fundName", indexNameList);

        return map;
    }

    /**
     * 组合收益率
     * @param portfolioTypeList  基金类型
     * @param dateList  日期列表
     * @return  map
     */
    private Map<String, Object> getPortfolioLine(List<Integer> portfolioTypeList,List<String> dateList){
        List<ManyLineDTO> manyLineList = new ArrayList<>();
        List<String> portfolioNameList = new ArrayList<>();
        List<MyFundPortfolio> portfolioList = portfolioService.list(Wrappers.<MyFundPortfolio>lambdaQuery().in(MyFundPortfolio::getType, portfolioTypeList).gt(MyFundPortfolio::getMoney, 0));
        String start = dateList.get(0);
        String end = dateList.get(dateList.size()-1);
        for (MyFundPortfolio portfolio : portfolioList){
            ManyLineDTO manyLineDTO = new ManyLineDTO();
            manyLineDTO.setName(portfolio.getName());
            List<MyFundPortfolioDetail> portfolioDetailList = portfolioDetailService.list(Wrappers.<MyFundPortfolioDetail>lambdaQuery()
                    .eq(MyFundPortfolioDetail::getFundPortfolioId, portfolio.getId())
                    .between(MyFundPortfolioDetail::getCreateTime, start, end).orderByAsc(MyFundPortfolioDetail::getCreateTime));
            List<Double> list = portfolioDetailList.stream().map(portfolioDetail -> portfolioDetail.getProfitRate().doubleValue())
                    .collect(Collectors.toList());
            manyLineDTO.setData(list);
            portfolioNameList.add(portfolio.getName());
            manyLineList.add(manyLineDTO);
        }
        Map<String, Object> map = new HashMap<>();
        map.put("manyLine", manyLineList);
        map.put("portfolioName", portfolioNameList);

        return map;
    }

    private List<String> getMonth(){
        List<String> list = new ArrayList<>();
        DateTime start = DateUtil.beginOfMonth(DateUtil.parseDate("2021-03-01"));
        DateTime end = DateUtil.endOfMonth(DateUtil.parseDate("2021-03-01"));
        while (start.isBefore(end)){
            list.add(start.toString(DatePattern.NORM_DATE_PATTERN));
            start = start.offset(DateField.DAY_OF_YEAR, 1);
        }

        return list;
    }
}
