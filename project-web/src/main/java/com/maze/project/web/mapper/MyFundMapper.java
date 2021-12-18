package com.maze.project.web.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.maze.project.web.entity.MyFund;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 我的基金 Mapper 接口
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
@Mapper
public interface MyFundMapper extends BaseMapper<MyFund> {

}
