package com.maze.project.web.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maze.project.web.common.constant.CommonConstant;
import com.maze.project.web.common.enums.FundEnum;
import com.maze.project.web.dto.fund.FundDetailDTO;
import com.maze.project.web.dto.fund.FundDetailPageDTO;
import com.maze.project.web.entity.MyFund;
import com.maze.project.web.entity.MyFundDetail;
import com.maze.project.web.mapper.MyFundDetailMapper;
import com.maze.project.web.service.MyFundDetailService;
import com.maze.project.web.service.MyFundService;
import com.maze.project.web.vo.fund.FundChangeVO;
import com.maze.project.web.vo.fund.FundDetailPageVO;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
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

    private final MyFundService myFundService;

    public MyFundDetailServiceImpl(MyFundService myFundService) {
        this.myFundService = myFundService;
    }

    @Override
    public boolean change(FundChangeVO fundChangeVO) {
        MyFund myFund = myFundService.getOne(Wrappers.<MyFund>lambdaQuery().eq(MyFund::getFundCode, fundChangeVO.getCode()));
        BigDecimal principal = null == myFund ? BigDecimal.ZERO : myFund.getPrincipal();
        BigDecimal profit = null == myFund ? BigDecimal.ZERO : myFund.getProfit();
        MyFundDetail lastDetail = getOne(Wrappers.<MyFundDetail>lambdaQuery()
                        .eq(MyFundDetail::getFundCode, fundChangeVO.getCode())
                        .orderByDesc(MyFundDetail::getCreateTime)
                        .last("limit 1"));
        MyFundDetail myFundDetail = new MyFundDetail();
        myFundDetail.setFundCode(fundChangeVO.getCode());
        myFundDetail.setFundName(fundChangeVO.getName());
        myFundDetail.setFundShares(new BigDecimal(fundChangeVO.getShares()));
        myFundDetail.setChangeMoney(new BigDecimal(fundChangeVO.getChangeMoney()));
        myFundDetail.setFundWorth(new BigDecimal(fundChangeVO.getWorth()));
        myFundDetail.setType(Integer.parseInt(fundChangeVO.getType()));
        myFundDetail.setRemark(fundChangeVO.getRemark());
        myFundDetail.setCreateTime(DateUtil.parseLocalDateTime(fundChangeVO.getCreateTime(), "yyyy-MM-dd"));
        if (null == lastDetail){
            myFundDetail.setNewMoney(new BigDecimal(fundChangeVO.getChangeMoney()));
            myFundDetail.setProfitRate(BigDecimal.ZERO);
        }else {
            myFundDetail.setNewMoney(lastDetail.getNewMoney().add(new BigDecimal(fundChangeVO.getChangeMoney())));
            //记录资产更新时，要同时变更盈利情况和收益率
            if (FundEnum.FundChangeEnum.AMOUNT_UPDATE.getCode() == Integer.parseInt(fundChangeVO.getType())){
                profit = profit.add(new BigDecimal(fundChangeVO.getChangeMoney()));
                BigDecimal profitRate = profit.divide(principal, 4, RoundingMode.HALF_UP);
                myFundDetail.setProfitRate(profitRate);
            }else {
                //如果是记录本金转入转出，就不用更新收益率了，还是上一次的收益率
                myFundDetail.setProfitRate(lastDetail.getProfitRate());
            }
        }

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
                fundDetailDTO.setCreateTime(myFundDetail.getCreateTime());
                fundDetailDTO.setMoney(CommonConstant.DECIMAL_FORMAT.format(myFundDetail.getNewMoney()));
                fundDetailDTO.setProfitRate(CommonConstant.DECIMAL_FORMAT.format(myFundDetail.getProfitRate().multiply(BigDecimal.valueOf(100))));
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
