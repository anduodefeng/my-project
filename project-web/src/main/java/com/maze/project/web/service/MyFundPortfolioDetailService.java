package com.maze.project.web.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.maze.project.web.dto.portfolio.PortfolioDetailPageDTO;
import com.maze.project.web.entity.MyFundPortfolioDetail;
import com.maze.project.web.vo.portfolio.PortfolioChangeVO;
import com.maze.project.web.vo.portfolio.PortfolioDetailPageVO;

/**
 * <p>
 * 组合变动明细 服务类
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
public interface MyFundPortfolioDetailService extends IService<MyFundPortfolioDetail> {

    boolean change(PortfolioChangeVO portfolioChangeVO);

    PortfolioDetailPageDTO getPortfolioDetail(PortfolioDetailPageVO portfolioDetailPageVO);
}
