package com.maze.project.web.service;

import cn.hutool.core.lang.UUID;
import cn.hutool.crypto.digest.MD5;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.maze.project.web.dto.LoginDTO;
import com.maze.project.web.entity.MyUser;
import com.maze.project.web.vo.LoginVO;
import org.springframework.stereotype.Service;

import java.nio.charset.StandardCharsets;

@Service
public class LoginService {

    private final MyUserService userService;

    public LoginService(MyUserService userService) {
        this.userService = userService;
    }

    public LoginDTO login(LoginVO loginVO){
        LoginDTO loginDTO = new LoginDTO();
        String token = "";
        MyUser myUser = userService.getOne(Wrappers.<MyUser>lambdaQuery().eq(MyUser::getUsername, loginVO.getName()));
        if (null != myUser){
            String password = MD5.create().digestHex(loginVO.getPassword(), StandardCharsets.UTF_8);
            if (password.equals(myUser.getPassword())){
                token = UUID.randomUUID().toString();
            }
        }
        loginDTO.setToken(token);
        return loginDTO;
    }
}
