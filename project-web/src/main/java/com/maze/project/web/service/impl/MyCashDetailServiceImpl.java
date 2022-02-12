package com.maze.project.web.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.maze.project.web.common.constant.CommonConstant;
import com.maze.project.web.dto.cash.DetailDTO;
import com.maze.project.web.dto.cash.DetailPageDTO;
import com.maze.project.web.entity.MyCashDetail;
import com.maze.project.web.mapper.MyCashDetailMapper;
import com.maze.project.web.service.MyCashDetailService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maze.project.web.vo.cash.CashChangeVO;
import com.maze.project.web.vo.cash.DetailPageVO;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

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
        myCashDetail.setNewAmount(new BigDecimal(cashChangeVO.getChangeMoney()));
        myCashDetail.setReason(cashChangeVO.getReason());
        myCashDetail.setCreateTime(LocalDateTime.now());

        return save(myCashDetail);
    }

    @Override
    public DetailPageDTO getDetailPage(DetailPageVO detailPageVO) {
        List<DetailDTO> list = new ArrayList<>();
        Page<MyCashDetail> page = new Page<>(detailPageVO.getPage(), detailPageVO.getPageSize());
        IPage<MyCashDetail> detailIPage = page(page, Wrappers.<MyCashDetail>lambdaQuery()
                .eq(MyCashDetail::getBankName, detailPageVO.getBankName()).orderByDesc(MyCashDetail::getCreateTime));
        list = detailIPage.getRecords().stream().map(myCashDetail -> {
            DetailDTO detailDTO = new DetailDTO();
            detailDTO.setBankName(myCashDetail.getBankName());
            detailDTO.setAmount(CommonConstant.DECIMAL_FORMAT.format(myCashDetail.getNewAmount()));
            detailDTO.setReason(myCashDetail.getReason());
            detailDTO.setCreateTime(myCashDetail.getCreateTime());
            return detailDTO;
        }).collect(Collectors.toList());
        DetailPageDTO detailPageDTO = new DetailPageDTO();
        detailPageDTO.setDetailList(list);
        detailPageDTO.setCurrentPage(detailPageVO.getPage());
        detailPageDTO.setTotalNum(detailIPage.getTotal());
        return detailPageDTO;
    }
}
