package com.maze.project.web.controller;

import com.maze.project.web.common.constant.CommonConstant;
import com.maze.project.web.dto.BaseDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Slf4j
@CrossOrigin(maxAge = 3600)
@RestController
@RequestMapping(value = "/user")
public class UserController {

    @GetMapping("login")
    public BaseDTO login(){
        Map<String, String> map = new HashMap<>();
        map.put("token", "123456789");

        return BaseDTO.ok().data(map);
    }

    @GetMapping("info")
    public BaseDTO info(){
        Map<String, Object> map = new HashMap<>();
        List<String> list = new ArrayList<>();
        list.add("admin");
        map.put("roles", list);
        map.put("name", "maze");
        map.put("avatar", CommonConstant.AVATAR);
        return BaseDTO.ok().data(map);
    }
}
