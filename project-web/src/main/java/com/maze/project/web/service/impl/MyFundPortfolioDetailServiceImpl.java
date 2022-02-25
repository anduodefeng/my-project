package com.maze.project.web.service.impl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maze.project.web.common.constant.CommonConstant;
import com.maze.project.web.dto.PortfolioDetailChartDTO;
import com.maze.project.web.dto.portfolio.PortfolioDetailDTO;
import com.maze.project.web.dto.portfolio.PortfolioDetailPageDTO;
import com.maze.project.web.entity.MyFundPortfolioDetail;
import com.maze.project.web.mapper.MyFundPortfolioDetailMapper;
import com.maze.project.web.service.MyFundPortfolioDetailService;
import com.maze.project.web.service.MyFundPortfolioService;
import com.maze.project.web.vo.portfolio.PortfolioChangeVO;
import com.maze.project.web.vo.portfolio.PortfolioDetailPageVO;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 组合变动明细 服务实现类
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
@Service
public class MyFundPortfolioDetailServiceImpl extends ServiceImpl<MyFundPortfolioDetailMapper, MyFundPortfolioDetail>
        implements MyFundPortfolioDetailService {

    private final MyFundPortfolioService portfolioService;

    public MyFundPortfolioDetailServiceImpl(MyFundPortfolioService portfolioService) {
        this.portfolioService = portfolioService;
    }

    @Override
    public PortfolioDetailChartDTO getChart(String portfolioId) {
        List<String> dateList = new ArrayList<>();
        List<List<Double>> dataList = new ArrayList<>();
        List<Double> rateList = new ArrayList<>();
        List<MyFundPortfolioDetail> portfolioDetailList = list(Wrappers.<MyFundPortfolioDetail>lambdaQuery()
                .eq(MyFundPortfolioDetail::getFundPortfolioId, portfolioId)
                .ge(MyFundPortfolioDetail::getCreateTime, CommonConstant.beginTime)
                .orderByAsc(MyFundPortfolioDetail::getCreateTime));
        for (MyFundPortfolioDetail portfolioDetail : portfolioDetailList){
            List<Double> changeList = new ArrayList<>();
            String date = DateUtil.format(portfolioDetail.getCreateTime(), "yyyy-MM-dd");
            changeList.add(0d);
            changeList.add(portfolioDetail.getProfit().doubleValue());
            changeList.add(0d);
            changeList.add(portfolioDetail.getProfit().doubleValue());

            dateList.add(date);
            dataList.add(changeList);

            //收益率
            double rate = portfolioDetail.getProfitRate().doubleValue();
            rateList.add(rate);


        }
        PortfolioDetailChartDTO portfolioDetailChartDTO = new PortfolioDetailChartDTO();
        portfolioDetailChartDTO.setDateList(dateList);
        portfolioDetailChartDTO.setDataList(dataList);
        portfolioDetailChartDTO.setRateList(rateList);

        return portfolioDetailChartDTO;
    }

    @Override
    public boolean change(PortfolioChangeVO portfolioChangeVO, Integer id) {
        BigDecimal newAssets = new BigDecimal(portfolioChangeVO.getNewMoney());
        BigDecimal profit = new BigDecimal(portfolioChangeVO.getProfit());
        BigDecimal principal = newAssets.subtract(profit);
        BigDecimal profitRate;
        if(StrUtil.isEmpty(portfolioChangeVO.getProfitRate())){
            profitRate = profit.divide(principal, 4, RoundingMode.HALF_UP).multiply(BigDecimal.valueOf(100));
        }else {
            profitRate = new BigDecimal(portfolioChangeVO.getProfitRate());
        }
        MyFundPortfolioDetail portfolioDetail = new MyFundPortfolioDetail();
        portfolioDetail.setFundPortfolioId(id);
        portfolioDetail.setFundPortfolioName(portfolioChangeVO.getName());
        portfolioDetail.setNewAssets(newAssets);
        portfolioDetail.setProfit(profit);
        portfolioDetail.setProfitRate(profitRate);
        portfolioDetail.setPrincipal(principal);
        portfolioDetail.setCreateTime(DateUtil.parseLocalDateTime(portfolioChangeVO.getCreateTime(), "yyyy-MM-dd"));

        return save(portfolioDetail);
    }

    @Override
    public PortfolioDetailPageDTO getPortfolioDetail(PortfolioDetailPageVO portfolioDetailPageVO) {
        List<PortfolioDetailDTO> list = new ArrayList<>();
        Page<MyFundPortfolioDetail> page = new Page<>(portfolioDetailPageVO.getPage(), portfolioDetailPageVO.getPageSize());
        IPage<MyFundPortfolioDetail> portfolioDetailIPage = page(page, Wrappers.<MyFundPortfolioDetail>lambdaQuery()
                .eq(MyFundPortfolioDetail::getFundPortfolioId, portfolioDetailPageVO.getId())
                .orderByDesc(MyFundPortfolioDetail::getCreateTime));
        for (MyFundPortfolioDetail myFundPortfolioDetail : portfolioDetailIPage.getRecords()){
            PortfolioDetailDTO portfolioDetailDTO = new PortfolioDetailDTO();
            portfolioDetailDTO.setName(myFundPortfolioDetail.getFundPortfolioName());
            portfolioDetailDTO.setNewMoney(CommonConstant.DECIMAL_FORMAT.format(myFundPortfolioDetail.getNewAssets()));
            portfolioDetailDTO.setProfit(CommonConstant.DECIMAL_FORMAT.format(myFundPortfolioDetail.getProfit()));
            portfolioDetailDTO.setProfitRate(CommonConstant.DECIMAL_FORMAT.format(myFundPortfolioDetail.getProfitRate()));
            portfolioDetailDTO.setCreateTime(myFundPortfolioDetail.getCreateTime());
            list.add(portfolioDetailDTO);
        }
        PortfolioDetailPageDTO portfolioDetailPageDTO = new PortfolioDetailPageDTO();
        portfolioDetailPageDTO.setCurrentPage(portfolioDetailPageVO.getPage());
        portfolioDetailPageDTO.setTotalNum(portfolioDetailIPage.getTotal());
        portfolioDetailPageDTO.setDetailList(list);
        return portfolioDetailPageDTO;
    }
}
