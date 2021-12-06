package com.maze.project.projectweb.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.maze.project.projectweb.entity.Person;
import com.maze.project.projectweb.service.PersonService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@Slf4j
@RestController
@RequestMapping("hello")
public class HelloController {

    @Autowired
    private PersonService personService;

    @GetMapping("show")
    public String show(){


//        List<Person> personList = personService.getAllPerson();

        Page<Person> page = new Page<>(1,1);
        IPage<Person> ipage = personService.page(page, Wrappers.<Person>lambdaQuery().eq(Person::getName, "张三"));

        log.info("===========打印info日志==============");
        log.error("===========打印error日志=============");

        return "Hello Student!!"+ipage.getRecords();
    }
}
