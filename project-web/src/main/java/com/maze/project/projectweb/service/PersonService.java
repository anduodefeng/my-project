package com.maze.project.projectweb.service;

import com.maze.project.projectweb.entity.Person;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author maze
 * @since 2021-12-05
 */
public interface PersonService extends IService<Person> {

    List<Person> getAllPerson();

}
