package com.maze.project.web.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.maze.project.web.dto.credit_card.DetailChartDTO;
import com.maze.project.web.dto.credit_card.DetailPageDTO;
import com.maze.project.web.entity.MyCreditCardDetail;
import com.maze.project.web.vo.credit_card.CreditCardChangeVO;
import com.maze.project.web.vo.credit_card.DetailPageVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author maze
 * @since 2022-01-24
 */
public interface MyCreditCardDetailService extends IService<MyCreditCardDetail> {

    DetailChartDTO getDetailChart(String bankName);

    boolean change(CreditCardChangeVO creditCardChangeVO);

    DetailPageDTO getDetailPage(DetailPageVO detailPageVO);
}
