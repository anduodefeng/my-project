package com.maze.project.web.controller;

import cn.hutool.core.util.StrUtil;
import com.maze.project.web.common.enums.ResponseCodeEnum;
import com.maze.project.web.dto.common.BaseDTO;
import com.maze.project.web.dto.common.LoginDTO;
import com.maze.project.web.service.LoginService;
import com.maze.project.web.vo.common.LoginVO;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LoginController {

    private final LoginService loginService;

    public LoginController(LoginService loginService) {
        this.loginService = loginService;
    }

    /**
     * @description: 登录
     * @param: loginVO
     * @return: com.maze.project.web.dto.common.BaseDTO
     * @author maze
     * @date: 2021/12/18 21:42
     */
    @PostMapping(value = "login")
    public BaseDTO login(@Validated @RequestBody LoginVO loginVO){
        BaseDTO baseDTO = new BaseDTO();
        LoginDTO loginDTO = loginService.login(loginVO);
        if (StrUtil.isBlank(loginDTO.getToken())){
            baseDTO.setCode(ResponseCodeEnum.LOGIN_ERROR.getCode());
            baseDTO.setMessage(ResponseCodeEnum.LOGIN_ERROR.getDescription());
        }else {
            baseDTO = BaseDTO.ok().data(loginDTO);
        }
        return baseDTO;
    }
}

