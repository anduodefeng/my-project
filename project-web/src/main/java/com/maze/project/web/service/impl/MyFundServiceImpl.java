package com.maze.project.web.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maze.project.web.entity.MyFund;
import com.maze.project.web.mapper.MyFundMapper;
import com.maze.project.web.service.MyFundService;
import org.springframework.stereotype.Service;

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

}
