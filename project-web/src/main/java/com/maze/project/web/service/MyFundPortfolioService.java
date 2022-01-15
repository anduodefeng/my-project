package com.maze.project.web.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.maze.project.web.dto.portfolio.PortfolioDTO;
import com.maze.project.web.dto.portfolio.PortfolioInfoListDTO;
import com.maze.project.web.dto.portfolio.PortfolioPageDTO;
import com.maze.project.web.entity.MyFundPortfolio;
import com.maze.project.web.vo.portfolio.PortfolioChangeVO;
import com.maze.project.web.vo.portfolio.PortfolioPageVO;

/**
 * <p>
 * 基金组合表 服务类
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
public interface MyFundPortfolioService extends IService<MyFundPortfolio> {

    PortfolioPageDTO getPortfolioPage(PortfolioPageVO portfolioPageVO);

    boolean updatePortfolio(PortfolioChangeVO portfolioChangeVO);

    PortfolioInfoListDTO getPortfolioInfos(String accountId);

    PortfolioDTO getPortfolioInfo(String id);
}
