package com.maze.project.web.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maze.project.web.common.constant.CommonConstant;
import com.maze.project.web.common.enums.FundEnum;
import com.maze.project.web.dto.common.*;
import com.maze.project.web.dto.fund.*;
import com.maze.project.web.entity.MyFund;
import com.maze.project.web.entity.MyFundDetail;
import com.maze.project.web.mapper.MyFundDetailMapper;
import com.maze.project.web.mapper.MyFundMapper;
import com.maze.project.web.service.MyFundService;
import com.maze.project.web.vo.fund.FundChangeVO;
import com.maze.project.web.vo.fund.FundPageVO;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 * 我的基金 服务实现类
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
@Service
public class MyFundServiceImpl extends ServiceImpl<MyFundMapper, MyFund> implements MyFundService {

    private final MyFundDetailMapper fundDetailMapper;

    public MyFundServiceImpl(MyFundDetailMapper fundDetailMapper) {
        this.fundDetailMapper = fundDetailMapper;
    }

    @Override
    public FundChartDTO getChart(String fundType) {
        List<PieDTO> pieList = new ArrayList<>();
        List<String> fundNameList = new ArrayList<>();
        List<MyFund> fundList = list(Wrappers.<MyFund>lambdaQuery().eq(MyFund::getType, fundType));
        Map<String,Object> map = getDate();
        List<String> dateList = (List<String>) map.get("date");
        DateTime start = (DateTime) map.get("start");
        DateTime end = (DateTime) map.get("end");
        for (MyFund fund : fundList){

            PieDTO pieDTO = new PieDTO();
            pieDTO.setName(fund.getFundName());
            pieDTO.setValue(fund.getFundMoney().doubleValue());
            pieList.add(pieDTO);

            fundNameList.add(fund.getFundName());
        }
        List<Double> totalList = getTotal(fundList, start, end);
        FundChartDTO fundChartDTO = new FundChartDTO();
        fundChartDTO.setPieList(pieList);
        fundChartDTO.setFundNameList(fundNameList);
        fundChartDTO.setDateList(dateList);
        fundChartDTO.setTotalAmount(totalList);

        return fundChartDTO;
    }

    @Override
    public FundPageDTO getFundPage(FundPageVO fundPageVO) {
        List<FundDTO> fundDTOS = new ArrayList<>();
        Page<MyFund> page = new Page<>(fundPageVO.getPage(), fundPageVO.getPageSize());
        IPage<MyFund> fundIPage = page(page, Wrappers.<MyFund>lambdaQuery().eq(MyFund::getType, fundPageVO.getType()));
        if (CollectionUtil.isNotEmpty(fundIPage.getRecords())){
            fundDTOS = fundIPage.getRecords().stream().map(myFund -> {
                FundDTO fundDTO = new FundDTO();
                fundDTO.setCode(myFund.getFundCode());
                fundDTO.setName(myFund.getFundName());
                fundDTO.setMoney(CommonConstant.DECIMAL_FORMAT.format(myFund.getFundMoney()));
                fundDTO.setPrincipal(CommonConstant.DECIMAL_FORMAT.format(myFund.getPrincipal()));
                fundDTO.setProfit(CommonConstant.DECIMAL_FORMAT.format(myFund.getProfit()));
                fundDTO.setCreateTime(myFund.getCreateTime());
                fundDTO.setUpdateTime(myFund.getUpdateTime());
                fundDTO.setProfitRate(CommonConstant.DECIMAL_FORMAT.format(myFund.getProfitRate().multiply(BigDecimal.valueOf(100))));
                return fundDTO;
            }).collect(Collectors.toList());
        }
        FundPageDTO fundPageDTO = new FundPageDTO();
        fundPageDTO.setCurrentPage(fundPageVO.getPage());
        fundPageDTO.setTotalNum(fundIPage.getTotal());
        fundPageDTO.setFundList(fundDTOS);

        return fundPageDTO;
    }

    @Override
    public boolean updateFund(FundChangeVO fundChangeVO, BigDecimal rate) {
        MyFund myFund = getOne(Wrappers.<MyFund>lambdaQuery().eq(MyFund::getFundCode, fundChangeVO.getCode()));
        if (null != myFund){
            myFund.setFundMoney(myFund.getFundMoney().add(new BigDecimal(fundChangeVO.getChangeMoney())));
            myFund.setUpdateTime(DateUtil.parseLocalDateTime(fundChangeVO.getCreateTime(), "yyyy-MM-dd"));
            if (FundEnum.FundChangeEnum.AMOUNT_UPDATE.getCode() == Integer.parseInt(fundChangeVO.getType())){
                myFund.setProfit(myFund.getProfit().add(new BigDecimal(fundChangeVO.getChangeMoney())));
            }else {
                myFund.setPrincipal(myFund.getPrincipal().add(new BigDecimal(fundChangeVO.getChangeMoney())));
            }
            myFund.setProfitRate(rate);
        }else {
            myFund = new MyFund();
            myFund.setFundCode(fundChangeVO.getCode());
            myFund.setFundName(fundChangeVO.getName());
            myFund.setType(Integer.parseInt(fundChangeVO.getFundType()));
            myFund.setFundMoney(new BigDecimal(fundChangeVO.getChangeMoney()));
            myFund.setProfit(BigDecimal.ZERO);
            myFund.setPrincipal(new BigDecimal(fundChangeVO.getChangeMoney()));
            myFund.setCreateTime(LocalDateTime.now());
            myFund.setUpdateTime(LocalDateTime.now());
            myFund.setType(Integer.parseInt(fundChangeVO.getFundType()));
            myFund.setProfitRate(BigDecimal.ZERO);
        }
        return saveOrUpdate(myFund);
    }

    @Override
    public FundInfoListDTO getFundInfos(String fundType) {
        FundInfoListDTO fundInfoListDTO = new FundInfoListDTO();
        List<FundInfoDTO> fundInfoDTOS = new ArrayList<>();
        List<MyFund> myFunds = list(Wrappers.<MyFund>lambdaQuery().select(MyFund::getFundCode)
                .eq(MyFund::getType, Integer.parseInt(fundType))
                .groupBy(MyFund::getFundCode));
        List<String> codes = myFunds.stream().map(MyFund::getFundCode).collect(Collectors.toList());
        if (CollectionUtil.isNotEmpty(codes)){
            myFunds = list(Wrappers.<MyFund>lambdaQuery().in(MyFund::getFundCode, codes));
            if (CollectionUtil.isNotEmpty(myFunds)){
                fundInfoDTOS = myFunds.stream().map(myFund -> {
                    FundInfoDTO fundInfoDTO = new FundInfoDTO();
                    fundInfoDTO.setCode(myFund.getFundCode());
                    fundInfoDTO.setName(myFund.getFundName());
                    return fundInfoDTO;
                }).collect(Collectors.toList());
            }
        }
        fundInfoListDTO.setFundInfos(fundInfoDTOS);
        return fundInfoListDTO;
    }

    @Override
    public FundDTO getFundInfo(String code) {
        MyFund myFund = getOne(Wrappers.<MyFund>lambdaQuery().eq(MyFund::getFundCode, StrUtil.nullToEmpty(code)));
        FundDTO fundDTO = new FundDTO();
        if (null != myFund){
            fundDTO.setCode(myFund.getFundCode());
            fundDTO.setName(myFund.getFundName());
            fundDTO.setWorth(String.valueOf(myFund.getFundNetWorth()));
            fundDTO.setShares(String.valueOf(myFund.getFundShares()));
            fundDTO.setMoney(CommonConstant.DECIMAL_FORMAT.format(myFund.getFundMoney()));
        }else{
            fundDTO.setName(code);
        }
        return fundDTO;
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


    private List<Double> getTotal(List<MyFund> fundList, DateTime start, DateTime end){
        List<Double> totalList = new ArrayList<>();
        List<String> fundCode = fundList.stream().map(MyFund::getFundCode).collect(Collectors.toList());
        for (DateTime i = start ; i.isBefore(end); i = DateUtil.offsetDay(i, 1)){
            List<MyFundDetail> fundDetailList = fundDetailMapper.selectList(Wrappers.<MyFundDetail>lambdaQuery()
                    .eq(MyFundDetail::getType, FundEnum.FundChangeEnum.AMOUNT_UPDATE.getCode())
                    .in(MyFundDetail::getFundCode, fundCode)
                    .eq(MyFundDetail::getCreateTime, i));
            BigDecimal total = fundDetailList.stream().map(MyFundDetail::getNewMoney).reduce(BigDecimal.ZERO, BigDecimal::add);
            totalList.add(total.doubleValue());
        }

        return totalList;
    }

}
