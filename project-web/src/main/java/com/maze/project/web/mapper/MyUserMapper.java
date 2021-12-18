package com.maze.project.web.mapper;

import com.maze.project.web.entity.MyUser;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 用户表 Mapper 接口
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
@Mapper
public interface MyUserMapper extends BaseMapper<MyUser> {

}
