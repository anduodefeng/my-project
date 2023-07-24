package com.maze.project.web.controller;

import com.maze.project.web.service.MyFundInfoService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("demo")
@AllArgsConstructor
@Slf4j
public class DemoController {

    private final MyFundInfoService myFundInfoService;

    @RequestMapping("saveIndex")
    public String saveIndexFund(String name){

        return null;
    }
}
