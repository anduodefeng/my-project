package com.maze.project.web.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maze.project.web.entity.MyInvestAccount;
import com.maze.project.web.mapper.MyInvestAccountMapper;
import com.maze.project.web.service.MyInvestAccountService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 投资账户表 服务实现类
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
@Service
public class MyInvestAccountServiceImpl extends ServiceImpl<MyInvestAccountMapper, MyInvestAccount> implements MyInvestAccountService {

}
