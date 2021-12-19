package com.maze.project.web.service;

import com.maze.project.web.entity.MyCashDetail;
import com.baomidou.mybatisplus.extension.service.IService;
import com.maze.project.web.vo.cash.CashChangeVO;

/**
 * <p>
 * 现金明细表 服务类
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
public interface MyCashDetailService extends IService<MyCashDetail> {

    boolean change(CashChangeVO cashChangeVO);
}
