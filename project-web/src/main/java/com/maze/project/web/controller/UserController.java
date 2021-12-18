package com.maze.project.web.controller;

import com.maze.project.web.dto.BaseDTO;
import com.maze.project.web.dto.UserInfoDTO;
import com.maze.project.web.service.UserInfoService;
import com.maze.project.web.vo.GetUserInfoVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


@Slf4j
@CrossOrigin(maxAge = 3600)
@RestController
@RequestMapping(value = "/user")
public class UserController {

    private final UserInfoService userInfoService;

    public UserController(UserInfoService userInfoService) {
        this.userInfoService = userInfoService;
    }

    @PostMapping("info")
    public BaseDTO info(@Validated @RequestBody GetUserInfoVO getUserInfoVO){
        UserInfoDTO userInfoDTO = userInfoService.getUserInfo(getUserInfoVO);
        return BaseDTO.ok().data(userInfoDTO);
    }
}
