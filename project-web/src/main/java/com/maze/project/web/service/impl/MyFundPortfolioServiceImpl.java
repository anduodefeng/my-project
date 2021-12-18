package com.maze.project.web.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maze.project.web.entity.MyFundPortfolio;
import com.maze.project.web.mapper.MyFundPortfolioMapper;
import com.maze.project.web.service.MyFundPortfolioService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 基金组合表 服务实现类
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
@Service
public class MyFundPortfolioServiceImpl extends ServiceImpl<MyFundPortfolioMapper, MyFundPortfolio>
        implements MyFundPortfolioService {

}
