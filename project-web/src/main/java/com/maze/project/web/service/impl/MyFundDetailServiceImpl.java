package com.maze.project.web.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maze.project.web.common.constant.CommonConstant;
import com.maze.project.web.dto.fund.FundDetailChartDTO;
import com.maze.project.web.dto.fund.FundDetailDTO;
import com.maze.project.web.dto.fund.FundDetailPageDTO;
import com.maze.project.web.entity.MyFundDetail;
import com.maze.project.web.mapper.MyFundDetailMapper;
import com.maze.project.web.service.MyFundDetailService;
import com.maze.project.web.vo.fund.FundChangeVO;
import com.maze.project.web.vo.fund.FundDetailPageVO;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 我的基金明细 服务实现类
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
@Service
public class MyFundDetailServiceImpl extends ServiceImpl<MyFundDetailMapper, MyFundDetail> implements MyFundDetailService {

    @Override
    public boolean change(FundChangeVO fundChangeVO) {
        BigDecimal newAssets = new BigDecimal(fundChangeVO.getNewMoney());
        BigDecimal profit = new BigDecimal(fundChangeVO.getProfit());
        BigDecimal principal = newAssets.subtract(profit);
        BigDecimal rate;
        if (StringUtils.isBlank(fundChangeVO.getProfitRate())){
            rate = profit.divide(principal,4, RoundingMode.HALF_UP).multiply(BigDecimal.valueOf(100));
        }else{
            rate = new BigDecimal(fundChangeVO.getProfitRate());
        }
        MyFundDetail myFundDetail = new MyFundDetail();
        myFundDetail.setFundCode(fundChangeVO.getCode());
        myFundDetail.setFundName(fundChangeVO.getName());
        myFundDetail.setNewMoney(newAssets);
        myFundDetail.setProfit(profit);
        myFundDetail.setProfitRate(rate);
        myFundDetail.setPrincipal(principal);
        myFundDetail.setCreateTime(DateUtil.parseLocalDateTime(fundChangeVO.getCreateTime(), "yyyy-MM-dd"));

        return save(myFundDetail);
    }

    @Override
    public FundDetailChartDTO getChart(String fundCode) {
        List<String> dateList = new ArrayList<>();
        List<List<Double>> dataList = new ArrayList<>();
        List<Double> rateList = new ArrayList<>();
        List<MyFundDetail> fundDetailList = list(Wrappers.<MyFundDetail>lambdaQuery()
                .eq(MyFundDetail::getFundCode, fundCode)
                .orderByAsc(MyFundDetail::getCreateTime));
        BigDecimal last = BigDecimal.ZERO;
        for (MyFundDetail fundDetail : fundDetailList){
            List<Double> changeList = new ArrayList<>();
            String date = DateUtil.format(fundDetail.getCreateTime(), "yyyy-MM-dd");
            double weekProfit = fundDetail.getProfit().subtract(last).doubleValue();
            changeList.add(0d);
            changeList.add(weekProfit);
            changeList.add(0d);
            changeList.add(weekProfit);
            dateList.add(date);
            dataList.add(changeList);

            last = fundDetail.getProfit();

            //收益率
            double rate = fundDetail.getProfitRate().doubleValue();
            rateList.add(rate);
        }

        FundDetailChartDTO fundDetailChartDTO = new FundDetailChartDTO();
        fundDetailChartDTO.setDateList(dateList);
        fundDetailChartDTO.setDataList(dataList);
        fundDetailChartDTO.setRateList(rateList);

        return fundDetailChartDTO;
    }

    @Override
    public FundDetailPageDTO getFundDetail(FundDetailPageVO fundDetailPageVO) {
        List<FundDetailDTO> list = new ArrayList<>();
        Page<MyFundDetail> page = new Page<>(fundDetailPageVO.getPage(), fundDetailPageVO.getPageSize());
        IPage<MyFundDetail> fundDetailIPage = page(page, Wrappers.<MyFundDetail>lambdaQuery()
                .eq(MyFundDetail::getFundCode, fundDetailPageVO.getCode()).orderByDesc(MyFundDetail::getCreateTime));
        if (CollectionUtil.isNotEmpty(fundDetailIPage.getRecords())){
            list = fundDetailIPage.getRecords().stream().map(myFundDetail -> {
                FundDetailDTO fundDetailDTO = new FundDetailDTO();
                fundDetailDTO.setCode(myFundDetail.getFundCode());
                fundDetailDTO.setName(myFundDetail.getFundName());
                fundDetailDTO.setNewAssets(CommonConstant.DECIMAL_FORMAT.format(myFundDetail.getNewMoney()));
                fundDetailDTO.setProfit(CommonConstant.DECIMAL_FORMAT.format(myFundDetail.getProfit()));
                fundDetailDTO.setProfitRate(CommonConstant.DECIMAL_FORMAT.format(myFundDetail.getProfitRate()));
                fundDetailDTO.setCreateTime(myFundDetail.getCreateTime());
                return fundDetailDTO;
            }).collect(Collectors.toList());
        }
        FundDetailPageDTO fundDetailPageDTO = new FundDetailPageDTO();
        fundDetailPageDTO.setCurrentPage(fundDetailPageVO.getPage());
        fundDetailPageDTO.setTotalNum(fundDetailIPage.getTotal());
        fundDetailPageDTO.setFundDetailList(list);
        return fundDetailPageDTO;
    }
}
