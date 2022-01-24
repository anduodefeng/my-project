package com.maze.project.web.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maze.project.web.common.constant.CommonConstant;
import com.maze.project.web.dto.credit_card.DetailDTO;
import com.maze.project.web.dto.credit_card.DetailPageDTO;
import com.maze.project.web.entity.MyCreditCardDetail;
import com.maze.project.web.mapper.MyCreditCardDetailMapper;
import com.maze.project.web.service.MyCreditCardDetailService;
import com.maze.project.web.vo.credit_card.CreditCardChangeVO;
import com.maze.project.web.vo.credit_card.DetailPageVO;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author maze
 * @since 2022-01-24
 */
@Service
public class MyCreditCardDetailServiceImpl extends ServiceImpl<MyCreditCardDetailMapper, MyCreditCardDetail> implements MyCreditCardDetailService {

    @Override
    public boolean change(CreditCardChangeVO creditCardChangeVO) {
        MyCreditCardDetail creditCardDetail = new MyCreditCardDetail();
        creditCardDetail.setCreditName(creditCardChangeVO.getBankName());
        creditCardDetail.setChangeAmount(new BigDecimal(creditCardChangeVO.getChangeMoney()));
        creditCardDetail.setRemark(creditCardChangeVO.getReason());
        creditCardDetail.setCreateTime(LocalDateTime.now());

        return save(creditCardDetail);
    }



    @Override
    public DetailPageDTO getDetailPage(DetailPageVO detailPageVO) {
        List<DetailDTO> list = new ArrayList<>();
        Page<MyCreditCardDetail> page = new Page<>(detailPageVO.getPage(), detailPageVO.getPageSize());
        IPage<MyCreditCardDetail> detailIPage = page(page, Wrappers.<MyCreditCardDetail>lambdaQuery()
                .eq(MyCreditCardDetail::getCreditName, detailPageVO.getBankName()).orderByDesc(MyCreditCardDetail::getCreditName));
        list = detailIPage.getRecords().stream().map(creditCardDetail -> {
            DetailDTO detailDTO = new DetailDTO();
            detailDTO.setBankName(creditCardDetail.getCreditName());
            detailDTO.setAmount(CommonConstant.DECIMAL_FORMAT.format(creditCardDetail.getChangeAmount()));
            detailDTO.setCreateTime(creditCardDetail.getCreateTime());
            return detailDTO;
        }).collect(Collectors.toList());
        DetailPageDTO detailPageDTO = new DetailPageDTO();
        detailPageDTO.setDetailList(list);
        detailPageDTO.setCurrentPage(detailPageVO.getPage());
        detailPageDTO.setTotalNum(detailIPage.getTotal());
        return detailPageDTO;
    }
}
