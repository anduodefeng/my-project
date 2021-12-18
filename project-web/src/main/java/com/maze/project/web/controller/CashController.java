package com.maze.project.web.controller;

import com.maze.project.web.common.exception.GlobalException;
import com.maze.project.web.dto.cash.CashPageDTO;
import com.maze.project.web.dto.common.BaseDTO;
import com.maze.project.web.service.MyCashService;
import com.maze.project.web.vo.cash.CashPageVO;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "cash")
public class CashController {

    private final MyCashService myCashService;

    public CashController(MyCashService myCashService) {
        this.myCashService = myCashService;
    }

    /**
     * @description: 分页查询现金列表
     * @param: cashPageVO 
     * @return: com.maze.project.web.dto.common.BaseDTO 
     * @author maze
     * @date: 2021/12/18 22:11
     */
    @PostMapping(value = "page")
    public BaseDTO cashPage(@RequestBody CashPageVO cashPageVO){
        CashPageDTO cashPageDTO;
        try {
            cashPageDTO = myCashService.getCashPage(cashPageVO);
        }catch (Exception e){
            throw new GlobalException("分页查询现金异常");
        }

        return BaseDTO.ok().data(cashPageDTO);
    }
}
