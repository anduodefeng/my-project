package com.maze.project.web.service;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.maze.project.web.common.constant.CommonConstant;
import com.maze.project.web.common.enums.FundEnum;
import com.maze.project.web.common.enums.PortfolioEnum;
import com.maze.project.web.dto.common.ManyLineDTO;
import com.maze.project.web.dto.common.PieDTO;
import com.maze.project.web.dto.dashboard.IndexDTO;
import com.maze.project.web.entity.*;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
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
        Map<String, Double> assetsInfo = getAssetsInfo();
        Map<String, Object> everyTotal = getEveryDayAssets();
        List<String> dateList = (List<String>) everyTotal.get("date");
        List<Double> moneyList = (List<Double>) everyTotal.get("everyAssets");
        List<Double> principalList = (List<Double>) everyTotal.get("principal");
        List<List<Double>> profitEveryday = (List<List<Double>>) everyTotal.get("profitEveryday");

        indexDTO.setTotalAssets(assetsInfo.get("totalMoney"));
        indexDTO.setTotalProfit(assetsInfo.get("totalProfit"));
        indexDTO.setYesterdayProfit(yesterdayProfit());
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
     * 昨日盈亏
     * @return double
     */
    private double yesterdayProfit(){
        DateTime yesterday = DateUtil.yesterday();
        List<MyFundDetail> fundDetail = fundDetailService.list(Wrappers.<MyFundDetail>lambdaQuery()
//                .eq(MyFundDetail::getType, FundEnum.FundChangeEnum.AMOUNT_UPDATE.getCode())
                .eq(MyFundDetail::getCreateTime, yesterday.toString("yyyy-MM-dd")));
        BigDecimal fundDetailProfit = CollUtil.isEmpty(fundDetail) ? BigDecimal.ZERO : BigDecimal.ZERO;
//                fundDetail.stream().map(MyFundDetail::getChangeMoney).reduce(BigDecimal.ZERO, BigDecimal::add);

        List<MyFundPortfolioDetail> portfolioDetail = portfolioDetailService.list(Wrappers.<MyFundPortfolioDetail>lambdaQuery()
//                .eq(MyFundPortfolioDetail::getType, FundEnum.FundChangeEnum.AMOUNT_UPDATE.getCode())
                .eq(MyFundPortfolioDetail::getCreateTime, yesterday.toString("yyyy-MM-dd")));
        BigDecimal portfolioProfit = CollUtil.isEmpty(portfolioDetail) ? BigDecimal.ZERO : BigDecimal.ZERO;
//                portfolioDetail.stream().map(MyFundPortfolioDetail::getChangeMoney).reduce(BigDecimal.ZERO, BigDecimal::add);

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
        List<Double> principalList = new ArrayList<>();
        List<List<Double>> profitEveryday = new ArrayList<>();
        DateTime end = DateUtil.yesterday().setField(DateField.HOUR_OF_DAY, 0).setField(DateField.MINUTE,0).setField(DateField.SECOND, 0);
        DateTime start = DateUtil.offsetDay(end, -90);
        DateTime myTime = DateUtil.parse(CommonConstant.beginTime, "yyyy-MM-dd");
        if (start.isBefore(myTime)){
            start = myTime;
        }

        BigDecimal lastMonetaryFund = BigDecimal.ZERO;
        BigDecimal lastMonetaryFundPrincipal = BigDecimal.ZERO;
        BigDecimal lastOtherFund = BigDecimal.ZERO;
        BigDecimal lastOtherFundPrincipal = BigDecimal.ZERO;
        BigDecimal lastPortfolio = BigDecimal.ZERO;
        BigDecimal lastPrincipal = BigDecimal.ZERO;
        while (start.isBefore(end)){
            dateList.add(start.toString("yyyy-MM-dd"));
            List<MyFundDetail> monetaryFundDetail = fundDetailService.list(Wrappers.<MyFundDetail>lambdaQuery()
//                    .eq(MyFundDetail::getType, FundEnum.FundChangeEnum.AMOUNT_UPDATE.getCode())
                    .eq(MyFundDetail::getFundCode, "TTXJGS01200001")
                    .eq(MyFundDetail::getCreateTime, start));
            BigDecimal totalMonetaryFund;
            BigDecimal totalMonetaryFundPrincipal;
            if (CollectionUtil.isNotEmpty(monetaryFundDetail)){
                totalMonetaryFund = monetaryFundDetail.stream().map(MyFundDetail::getNewMoney).reduce(BigDecimal.ZERO, BigDecimal::add);
                totalMonetaryFundPrincipal = monetaryFundDetail.stream().map(MyFundDetail::getPrincipal).reduce(BigDecimal.ZERO, BigDecimal::add);
            }else {
                totalMonetaryFund = lastMonetaryFund;
                totalMonetaryFundPrincipal = lastMonetaryFundPrincipal;
            }
//            BigDecimal monetaryFundProfit = monetaryFundDetail.stream().map(MyFundDetail::getChangeMoney).reduce(BigDecimal.ZERO, BigDecimal::add);

            List<MyFundDetail> otherFundDetail = fundDetailService.list(Wrappers.<MyFundDetail>lambdaQuery()
//                    .eq(MyFundDetail::getType, FundEnum.FundChangeEnum.AMOUNT_UPDATE.getCode())
                    .ne(MyFundDetail::getFundCode, "TTXJGS01200001")
                    .eq(MyFundDetail::getCreateTime, start));
            BigDecimal totalOtherFund;
            BigDecimal totalOtherFundPrincipal;
            if (CollectionUtil.isNotEmpty(otherFundDetail)){
                totalOtherFund = otherFundDetail.stream().map(MyFundDetail::getNewMoney).reduce(BigDecimal.ZERO, BigDecimal::add);
                totalOtherFundPrincipal = otherFundDetail.stream().map(MyFundDetail::getPrincipal).reduce(BigDecimal.ZERO, BigDecimal::add);
            }else {
                totalOtherFund = lastOtherFund;
                totalOtherFundPrincipal = lastOtherFundPrincipal;
            }
//            BigDecimal otherFundProfit = otherFundDetail.stream().map(MyFundDetail::getChangeMoney).reduce(BigDecimal.ZERO, BigDecimal::add);

            List<MyFundPortfolioDetail> portfolioDetails = portfolioDetailService.list(Wrappers.<MyFundPortfolioDetail>lambdaQuery()
//                    .eq(MyFundPortfolioDetail::getType, FundEnum.FundChangeEnum.AMOUNT_UPDATE.getCode())
                    .eq(MyFundPortfolioDetail::getCreateTime, start));
            BigDecimal totalPortfolio;
            BigDecimal totalPrincipal;
            if (CollectionUtil.isNotEmpty(portfolioDetails)){
                totalPortfolio = portfolioDetails.stream().map(MyFundPortfolioDetail::getNewAssets).reduce(BigDecimal.ZERO, BigDecimal::add);
                totalPrincipal = portfolioDetails.stream().map(MyFundPortfolioDetail::getPrincipal).reduce(BigDecimal.ZERO, BigDecimal::add);
            }else {
                totalPortfolio = lastPortfolio;
                totalPrincipal = lastPrincipal;
            }
//            BigDecimal portfolioProfit = portfolioDetails.stream().map(MyFundPortfolioDetail::getChangeMoney).reduce(BigDecimal.ZERO, BigDecimal::add);

            List<MyCash> cashList = cashService.list();
            BigDecimal cashMoney = cashList.stream().map(MyCash::getAmount).reduce(BigDecimal.ZERO, BigDecimal::add);

            BigDecimal total = totalMonetaryFund.add(totalOtherFund).add(totalPortfolio).add(cashMoney);
            BigDecimal principal = totalPrincipal.add(totalMonetaryFundPrincipal).add(totalOtherFundPrincipal).add(cashMoney);
//            BigDecimal totalProfit = monetaryFundProfit.add(otherFundProfit).add(portfolioProfit);
            BigDecimal totalProfit = BigDecimal.ZERO;
            assetList.add(total.doubleValue());
            principalList.add(principal.doubleValue());

            List<Double> changeList = new ArrayList<>();
            changeList.add(0d);
            changeList.add(totalProfit.doubleValue());
            changeList.add(0d);
            changeList.add(totalProfit.doubleValue());

            profitEveryday.add(changeList);

            lastMonetaryFund = totalMonetaryFund;
            lastMonetaryFundPrincipal = totalMonetaryFundPrincipal;
            lastOtherFund = totalOtherFund;
            lastOtherFundPrincipal = totalOtherFundPrincipal;
            lastPortfolio = totalPortfolio;
            lastPrincipal = totalPrincipal;

            start = DateUtil.offsetDay(start, 1);
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
        List<MyFund> fundList = fundService.list(Wrappers.<MyFund>lambdaQuery().eq(MyFund::getType, fundType));
        String start = dateList.get(0);
        String end = dateList.get(dateList.size()-1);
        for (MyFund fund : fundList){
            ManyLineDTO manyLineDTO = new ManyLineDTO();
            manyLineDTO.setName(fund.getFundName());
            List<MyFundDetail> fundDetailList = fundDetailService.list(Wrappers.<MyFundDetail>lambdaQuery()
                    .eq(MyFundDetail::getFundCode, fund.getFundCode())
//                    .eq(MyFundDetail::getType, FundEnum.FundChangeEnum.AMOUNT_UPDATE.getCode())
                    .between(MyFundDetail::getCreateTime, start, end).orderByAsc(MyFundDetail::getCreateTime));
            List<Double> list = fundDetailList.stream().map(myFundDetail -> myFundDetail.getProfitRate().multiply(BigDecimal.valueOf(100)).doubleValue())
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
        List<MyFundPortfolio> portfolioList = portfolioService.list(Wrappers.<MyFundPortfolio>lambdaQuery().in(MyFundPortfolio::getType, portfolioTypeList));
        String start = dateList.get(0);
        String end = dateList.get(dateList.size()-1);
        for (MyFundPortfolio portfolio : portfolioList){
            ManyLineDTO manyLineDTO = new ManyLineDTO();
            manyLineDTO.setName(portfolio.getName());
            List<MyFundPortfolioDetail> portfolioDetailList = portfolioDetailService.list(Wrappers.<MyFundPortfolioDetail>lambdaQuery()
                    .eq(MyFundPortfolioDetail::getFundPortfolioId, portfolio.getId())
//                    .eq(MyFundPortfolioDetail::getType, FundEnum.FundChangeEnum.AMOUNT_UPDATE.getCode())
                    .between(MyFundPortfolioDetail::getCreateTime, start, end).orderByAsc(MyFundPortfolioDetail::getCreateTime));
            List<Double> list = portfolioDetailList.stream().map(portfolioDetail -> portfolioDetail.getProfitRate().multiply(BigDecimal.valueOf(100)).doubleValue())
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
