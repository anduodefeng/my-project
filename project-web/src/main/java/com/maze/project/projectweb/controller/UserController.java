package com.maze.project.projectweb.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.maze.project.projectweb.dto.BaseDTO;
import com.maze.project.projectweb.entity.Person;
import com.maze.project.projectweb.service.PersonService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;


@Slf4j
@CrossOrigin(maxAge = 3600)
@RestController
@RequestMapping(value = "/user")
public class UserController {

    @GetMapping("login")
    public BaseDTO login(){

        BaseDTO baseDTO = new BaseDTO();
        baseDTO.setCode(200);
        baseDTO.setMessage("success");
        Map<String, String> map = new HashMap<>();
        map.put("token", "123456789");
        baseDTO.setData(map);

        return baseDTO;
    }
}
