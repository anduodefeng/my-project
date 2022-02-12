package com.maze.project.web.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.maze.project.web.dto.fund.FundDetailChartDTO;
import com.maze.project.web.dto.fund.FundDetailPageDTO;
import com.maze.project.web.entity.MyFundDetail;
import com.maze.project.web.vo.fund.FundChangeVO;
import com.maze.project.web.vo.fund.FundDetailPageVO;

/**
 * <p>
 * 我的基金明细 服务类
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
public interface MyFundDetailService extends IService<MyFundDetail> {

    FundDetailChartDTO getChart(String fundCode);

    boolean change(FundChangeVO fundChangeVO);

    FundDetailPageDTO getFundDetail(FundDetailPageVO fundDetailPageVO);
}
