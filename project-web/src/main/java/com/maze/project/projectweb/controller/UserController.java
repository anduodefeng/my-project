package com.maze.project.projectweb.controller;

import com.maze.project.projectweb.dto.BaseDTO;
import com.maze.project.projectweb.vo.LoginVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;


@Slf4j
@CrossOrigin(maxAge = 3600)
@RestController
@RequestMapping(value = "/user")
public class UserController {

    @GetMapping("login")
    public BaseDTO login(@Validated @RequestBody LoginVO loginVO){

        BaseDTO baseDTO = new BaseDTO();
        baseDTO.setCode(200);
        baseDTO.setMessage("success");
        Map<String, String> map = new HashMap<>();
        map.put("token", "123456789");
        baseDTO.setData(map);

        return baseDTO;
    }
}
