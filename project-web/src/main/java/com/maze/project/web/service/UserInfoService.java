package com.maze.project.web.service;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.maze.project.web.common.constant.CommonConstant;
import com.maze.project.web.dto.UserInfoDTO;
import com.maze.project.web.entity.MyRoles;
import com.maze.project.web.entity.MyUserRoles;
import com.maze.project.web.vo.GetUserInfoVO;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserInfoService {

    MyUserRolesService rolesService;
    MyRolesService myRolesService;

    public UserInfoService(MyUserRolesService rolesService, MyRolesService myRolesService) {
        this.rolesService = rolesService;
        this.myRolesService = myRolesService;
    }

    public UserInfoDTO getUserInfo(GetUserInfoVO getUserInfoVO){
        UserInfoDTO userInfoDTO = new UserInfoDTO();

        List<MyUserRoles> userRoles = rolesService.list(Wrappers.<MyUserRoles>lambdaQuery()
                .eq(MyUserRoles::getUserName, getUserInfoVO.getName()));
        List<String> roles = new ArrayList<>();
        if (CollectionUtil.isNotEmpty(userRoles)){
            List<MyRoles> myRoles = myRolesService.listByIds(userRoles.stream().map(MyUserRoles::getRoleId).toList());
            roles = myRoles.stream().map(MyRoles::getCode).toList();
        }

        userInfoDTO.setAvatar(CommonConstant.AVATAR);
        userInfoDTO.setRoles(roles);

        return userInfoDTO;
    }
}
