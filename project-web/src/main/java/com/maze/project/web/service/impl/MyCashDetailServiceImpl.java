package com.maze.project.web.service.impl;

import com.maze.project.web.entity.MyCashDetail;
import com.maze.project.web.mapper.MyCashDetailMapper;
import com.maze.project.web.service.MyCashDetailService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maze.project.web.vo.cash.CashChangeVO;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * <p>
 * 现金明细表 服务实现类
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
@Service
public class MyCashDetailServiceImpl extends ServiceImpl<MyCashDetailMapper, MyCashDetail> implements MyCashDetailService {

    @Override
    public boolean change(CashChangeVO cashChangeVO) {
        MyCashDetail myCashDetail = new MyCashDetail();
        myCashDetail.setBankName(cashChangeVO.getBankName());
        myCashDetail.setChangeAmount(new BigDecimal(cashChangeVO.getChangeMoney()));
        myCashDetail.setReason(cashChangeVO.getReason());
        myCashDetail.setCreateTime(LocalDateTime.now());

        return save(myCashDetail);
    }
}
