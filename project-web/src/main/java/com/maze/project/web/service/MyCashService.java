package com.maze.project.web.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.maze.project.web.dto.cash.CashPageDTO;
import com.maze.project.web.entity.MyCash;
import com.maze.project.web.vo.cash.CashPageVO;

/**
 * <p>
 * 现金表 服务类
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
public interface MyCashService extends IService<MyCash> {

    CashPageDTO getCashPage(CashPageVO cashPageVO);
}
