package com.maze.project.web.controller;

import com.maze.project.web.dto.common.BaseDTO;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("dashboard")
public class DashboardController {

    public BaseDTO index(){


        return BaseDTO.ok();
    }

}
