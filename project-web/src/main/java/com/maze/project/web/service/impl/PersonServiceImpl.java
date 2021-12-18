package com.maze.project.web.service.impl;

import com.maze.project.web.entity.Person;
import com.maze.project.web.mapper.PersonMapper;
import com.maze.project.web.service.PersonService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author maze
 * @since 2021-12-05
 */
@Service
public class PersonServiceImpl extends ServiceImpl<PersonMapper, Person> implements PersonService {

    @Override
    public List<Person> getAllPerson() {
        return getBaseMapper().findAllPerson();
    }
}
