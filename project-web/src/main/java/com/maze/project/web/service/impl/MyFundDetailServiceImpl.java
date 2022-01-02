package com.maze.project.web.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maze.project.web.common.constant.CommonConstant;
import com.maze.project.web.common.enums.FundEnum;
import com.maze.project.web.dto.fund.FundDetailDTO;
import com.maze.project.web.dto.fund.FundDetailPageDTO;
import com.maze.project.web.entity.MyFundDetail;
import com.maze.project.web.mapper.MyFundDetailMapper;
import com.maze.project.web.service.MyFundDetailService;
import com.maze.project.web.vo.fund.FundChangeVO;
import com.maze.project.web.vo.fund.FundDetailPageVO;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 我的基金明细 服务实现类
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
@Service
public class MyFundDetailServiceImpl extends ServiceImpl<MyFundDetailMapper, MyFundDetail> implements MyFundDetailService {

    @Override
    public boolean change(FundChangeVO fundChangeVO) {

        MyFundDetail myFundDetail = new MyFundDetail();
        myFundDetail.setFundCode(fundChangeVO.getCode());
        myFundDetail.setFundName(fundChangeVO.getName());
        myFundDetail.setFundShares(new BigDecimal(fundChangeVO.getShares()));
        myFundDetail.setChangeMoney(new BigDecimal(fundChangeVO.getChangeMoney()));
        myFundDetail.setFundWorth(new BigDecimal(fundChangeVO.getWorth()));
        myFundDetail.setType(Integer.parseInt(fundChangeVO.getType()));
        myFundDetail.setRemark(fundChangeVO.getRemark());
        myFundDetail.setCreateTime(LocalDateTime.now());

        return save(myFundDetail);
    }

    @Override
    public FundDetailPageDTO getFundDetail(FundDetailPageVO fundDetailPageVO) {
        List<FundDetailDTO> list = new ArrayList<>();
        Page<MyFundDetail> page = new Page<>(fundDetailPageVO.getPage(), fundDetailPageVO.getPageSize());
        IPage<MyFundDetail> fundDetailIPage = page(page, Wrappers.<MyFundDetail>lambdaQuery()
                .eq(MyFundDetail::getFundCode, fundDetailPageVO.getCode()).orderByDesc(MyFundDetail::getCreateTime));
        if (CollectionUtil.isNotEmpty(fundDetailIPage.getRecords())){
            list = fundDetailIPage.getRecords().stream().map(myFundDetail -> {
                FundDetailDTO fundDetailDTO = new FundDetailDTO();
                fundDetailDTO.setCode(myFundDetail.getFundCode());
                fundDetailDTO.setName(myFundDetail.getFundName());
                fundDetailDTO.setWorth(String.valueOf(myFundDetail.getFundWorth()));
                fundDetailDTO.setShares(String.valueOf(myFundDetail.getFundShares()));
                fundDetailDTO.setChangeMoney(CommonConstant.DECIMAL_FORMAT.format(myFundDetail.getChangeMoney()));
                fundDetailDTO.setType(FundEnum.FundChangeEnum.COST_CHANGE.getCode() == myFundDetail.getType() ?
                        FundEnum.FundChangeEnum.COST_CHANGE.getDescription() : FundEnum.FundChangeEnum.AMOUNT_UPDATE.getDescription());
                fundDetailDTO.setRemark(myFundDetail.getRemark());
                fundDetailDTO.setCreateTime(myFundDetail.getCreateTime());
                return fundDetailDTO;
            }).collect(Collectors.toList());
        }
        FundDetailPageDTO fundDetailPageDTO = new FundDetailPageDTO();
        fundDetailPageDTO.setCurrentPage(fundDetailPageVO.getPage());
        fundDetailPageDTO.setTotalNum(fundDetailIPage.getTotal());
        fundDetailPageDTO.setFundDetailList(list);
        return fundDetailPageDTO;
    }
}
