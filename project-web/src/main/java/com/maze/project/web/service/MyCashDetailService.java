package com.maze.project.web.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.maze.project.web.dto.cash.DetailPageDTO;
import com.maze.project.web.entity.MyCashDetail;
import com.maze.project.web.vo.cash.CashChangeVO;
import com.maze.project.web.vo.cash.DetailPageVO;

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

    DetailPageDTO getDetailPage(DetailPageVO detailPageVO);
}
