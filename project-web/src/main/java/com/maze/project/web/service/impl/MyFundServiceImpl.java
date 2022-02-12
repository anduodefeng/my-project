package com.maze.project.web.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maze.project.web.common.constant.CommonConstant;
import com.maze.project.web.dto.common.PieDTO;
import com.maze.project.web.dto.fund.FundChartDTO;
import com.maze.project.web.dto.fund.FundDTO;
import com.maze.project.web.dto.fund.FundPageDTO;
import com.maze.project.web.entity.MyFund;
import com.maze.project.web.entity.MyFundDetail;
import com.maze.project.web.mapper.MyFundDetailMapper;
import com.maze.project.web.mapper.MyFundMapper;
import com.maze.project.web.service.MyFundService;
import com.maze.project.web.vo.fund.FundChangeVO;
import com.maze.project.web.vo.fund.FundPageVO;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
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
        List<MyFund> fundList = list(Wrappers.<MyFund>lambdaQuery().eq(MyFund::getType, fundType));
        Map<String,List<String>> map = getDate(fundList);
        List<String> dateList = map.get("date");
        for (MyFund fund : fundList){

            PieDTO pieDTO = new PieDTO();
            pieDTO.setName(fund.getFundName());
            pieDTO.setValue(fund.getFundMoney().doubleValue());
            pieList.add(pieDTO);

        }
        Map<String, List<Double>> totalMap = getTotal(fundList, dateList);
        FundChartDTO fundChartDTO = new FundChartDTO();
        fundChartDTO.setPieList(pieList);
        fundChartDTO.setDateList(dateList);
        fundChartDTO.setTotalAmount(totalMap.get("total"));
        fundChartDTO.setTotalPrincipal(totalMap.get("principal"));

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
                fundDTO.setProfitRate(CommonConstant.DECIMAL_FORMAT.format(myFund.getProfitRate()));
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
    public boolean updateFund(FundChangeVO fundChangeVO) {
        BigDecimal newAssets = new BigDecimal(fundChangeVO.getNewMoney());
        BigDecimal profit = new BigDecimal(fundChangeVO.getProfit());
        BigDecimal principal = newAssets.subtract(profit);
        MyFund myFund = getOne(Wrappers.<MyFund>lambdaQuery().eq(MyFund::getFundCode, fundChangeVO.getCode()));
        if (null != myFund){
            myFund.setFundMoney(newAssets);
            myFund.setProfit(profit);
            myFund.setProfitRate(new BigDecimal(fundChangeVO.getProfitRate()));
            myFund.setPrincipal(principal);
            myFund.setUpdateTime(DateUtil.parseLocalDateTime(fundChangeVO.getCreateTime(), "yyyy-MM-dd"));
        }else {
            myFund = new MyFund();
            myFund.setFundCode(fundChangeVO.getCode());
            myFund.setFundName(fundChangeVO.getName());
            myFund.setFundMoney(newAssets);
            myFund.setProfit(profit);
            myFund.setProfitRate(new BigDecimal(fundChangeVO.getProfitRate()));
            myFund.setPrincipal(principal);
            myFund.setType(Integer.parseInt(fundChangeVO.getFundType()));
            myFund.setCreateTime(DateUtil.parseLocalDateTime(fundChangeVO.getCreateTime(), "yyyy-MM-dd"));
            myFund.setUpdateTime(DateUtil.parseLocalDateTime(fundChangeVO.getCreateTime(), "yyyy-MM-dd"));
        }
        return saveOrUpdate(myFund);
    }

    private Map<String, List<String>> getDate(List<MyFund> fundList){
        Map<String, List<String>> map = new HashMap<>();
        List<String> dateList = new ArrayList<>();
        if (CollectionUtil.isNotEmpty(fundList)){
            List<String> fundCodes = fundList.stream().map(MyFund::getFundCode).collect(Collectors.toList());
            List<MyFundDetail> myFundDetails = fundDetailMapper.selectList(Wrappers.<MyFundDetail>lambdaQuery().select(MyFundDetail::getCreateTime)
                    .in(MyFundDetail::getFundCode, fundCodes)
                    .groupBy(MyFundDetail::getCreateTime)
                    .orderByAsc(MyFundDetail::getCreateTime));
            dateList = myFundDetails.stream().map(myFundDetail -> DateUtil.format(myFundDetail.getCreateTime(),"yyyy-MM-dd"))
                    .collect(Collectors.toList());
        }
        map.put("date", dateList);
        return map;
    }


    private Map<String, List<Double>> getTotal(List<MyFund> fundList, List<String> dateList){
        List<Double> totalList = new ArrayList<>();
        List<Double> principalList = new ArrayList<>();
        for (String date : dateList){
            if (CollectionUtil.isNotEmpty(fundList)){
                List<String> fundCode = fundList.stream().map(MyFund::getFundCode).collect(Collectors.toList());
                List<MyFundDetail> fundDetailList = fundDetailMapper.selectList(Wrappers.<MyFundDetail>lambdaQuery()
                        .in(MyFundDetail::getFundCode, fundCode)
                        .eq(MyFundDetail::getCreateTime, date));
                BigDecimal total = fundDetailList.stream().map(MyFundDetail::getNewMoney).reduce(BigDecimal.ZERO, BigDecimal::add);
                BigDecimal principal = fundDetailList.stream().map(MyFundDetail::getPrincipal).reduce(BigDecimal.ZERO, BigDecimal::add);

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
