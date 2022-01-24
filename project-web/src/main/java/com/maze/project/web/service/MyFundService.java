package com.maze.project.web.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.maze.project.web.dto.fund.FundChartDTO;
import com.maze.project.web.dto.fund.FundDTO;
import com.maze.project.web.dto.fund.FundInfoListDTO;
import com.maze.project.web.dto.fund.FundPageDTO;
import com.maze.project.web.entity.MyFund;
import com.maze.project.web.vo.fund.FundChangeVO;
import com.maze.project.web.vo.fund.FundPageVO;

/**
 * <p>
 * 我的基金 服务类
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
public interface MyFundService extends IService<MyFund> {

    FundChartDTO getChart(String fundType);

    FundPageDTO getFundPage(FundPageVO fundPageVO);

    boolean updateFund(FundChangeVO fundChangeVO);

    FundInfoListDTO getFundInfos(String fundType);

    FundDTO getFundInfo(String code);
}
