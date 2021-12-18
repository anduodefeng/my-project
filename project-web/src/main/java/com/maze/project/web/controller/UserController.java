package com.maze.project.web.controller;

import com.maze.project.web.dto.common.BaseDTO;
import com.maze.project.web.dto.common.UserInfoDTO;
import com.maze.project.web.service.UserInfoService;
import com.maze.project.web.vo.common.GetUserInfoVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


@Slf4j
@RestController
@RequestMapping(value = "/user")
public class UserController {

    private final UserInfoService userInfoService;

    public UserController(UserInfoService userInfoService) {
        this.userInfoService = userInfoService;
    }

    /** 
     * @description: 获取用户信息(头像+权限)
     * @param: getUserInfoVO 
     * @return: com.maze.project.web.dto.common.BaseDTO
     * @author maze
     * @date: 2021/12/18 21:43
     */
    @PostMapping("info")
    public BaseDTO info(@Validated @RequestBody GetUserInfoVO getUserInfoVO){
        UserInfoDTO userInfoDTO = userInfoService.getUserInfo(getUserInfoVO);
        return BaseDTO.ok().data(userInfoDTO);
    }
}
