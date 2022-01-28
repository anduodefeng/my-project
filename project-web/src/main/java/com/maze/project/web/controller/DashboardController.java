package com.maze.project.web.controller;

import com.maze.project.web.common.enums.ResponseCodeEnum;
import com.maze.project.web.common.exception.GlobalException;
import com.maze.project.web.common.util.ExceptionUtil;
import com.maze.project.web.dto.common.BaseDTO;
import com.maze.project.web.dto.dashboard.IndexDTO;
import com.maze.project.web.service.DashboardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("dashboard")
public class DashboardController {

    private final DashboardService dashboardService;

    public DashboardController(DashboardService dashboardService) {
        this.dashboardService = dashboardService;
    }
    @RequestMapping("index")
    public BaseDTO index(){
        IndexDTO indexDTO = new IndexDTO();
        try {
            indexDTO = dashboardService.index();
        }catch (Exception e){
            log.error("==========首页查询异常=========={}", ExceptionUtil.getMessage(e));
            throw new GlobalException(ResponseCodeEnum.FIND_INDEX_ERROR);
        }

        return BaseDTO.ok().data(indexDTO);
    }

}
