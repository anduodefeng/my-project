package com.maze.project.projectweb.mapper;

import com.maze.project.projectweb.entity.Person;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author maze
 * @since 2021-12-05
 */
@Mapper
public interface PersonMapper extends BaseMapper<Person> {

    List<Person> findAllPerson();
}
