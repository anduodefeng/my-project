package com.maze.project.web.service.impl;

import com.maze.project.web.entity.MyUser;
import com.maze.project.web.mapper.MyUserMapper;
import com.maze.project.web.service.MyUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
@Service
public class MyUserServiceImpl extends ServiceImpl<MyUserMapper, MyUser> implements MyUserService {

}
