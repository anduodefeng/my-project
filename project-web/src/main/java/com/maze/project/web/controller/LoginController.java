package com.maze.project.web.controller;

import cn.hutool.core.util.StrUtil;
import com.maze.project.web.common.enums.ResponseCodeEnum;
import com.maze.project.web.dto.BaseDTO;
import com.maze.project.web.dto.LoginDTO;
import com.maze.project.web.service.LoginService;
import com.maze.project.web.vo.LoginVO;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(maxAge = 3600)
public class LoginController {

    private final LoginService loginService;

    public LoginController(LoginService loginService) {
        this.loginService = loginService;
    }

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

