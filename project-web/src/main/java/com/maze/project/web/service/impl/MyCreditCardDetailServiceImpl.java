package com.maze.project.web.service.impl;

import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maze.project.web.common.constant.CommonConstant;
import com.maze.project.web.dto.credit_card.DetailChartDTO;
import com.maze.project.web.dto.credit_card.DetailDTO;
import com.maze.project.web.dto.credit_card.DetailPageDTO;
import com.maze.project.web.entity.MyCreditCardDetail;
import com.maze.project.web.mapper.MyCreditCardDetailMapper;
import com.maze.project.web.service.MyCreditCardDetailService;
import com.maze.project.web.vo.credit_card.CreditCardChangeVO;
import com.maze.project.web.vo.credit_card.DetailPageVO;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
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
    public DetailChartDTO getDetailChart(String bankName) {
        List<String> dateList = new ArrayList<>();
        List<Double> moneyList = new ArrayList<>();
        DateTime end = DateUtil.yesterday().setField(DateField.HOUR_OF_DAY, 0).setField(DateField.MINUTE,0).setField(DateField.SECOND, 0);
        DateTime start = DateUtil.offsetDay(end, -90);
        DateTime myTime = DateUtil.parse("2022-01-01", "yyyy-MM-dd");
        if (start.isBefore(myTime)){
            start = myTime;
        }
        while (start.isBefore(end)){
            List<MyCreditCardDetail> creditCardDetailList = list(Wrappers.<MyCreditCardDetail>lambdaQuery()
                    .eq(MyCreditCardDetail::getCreditName, bankName)
                    .eq(MyCreditCardDetail::getCreateTime, start));
            BigDecimal spend = creditCardDetailList.stream().map(MyCreditCardDetail::getChangeAmount)
                    .reduce(BigDecimal.ZERO, BigDecimal::add);
            moneyList.add(spend.doubleValue());
            dateList.add(start.toString("yyyy-MM-dd"));
            start = DateUtil.offsetDay(start, 1);
        }
        DetailChartDTO detailChartDTO = new DetailChartDTO();
        detailChartDTO.setDateList(dateList);
        detailChartDTO.setMoneyList(moneyList);

        return detailChartDTO;
    }

    @Override
    public boolean change(CreditCardChangeVO creditCardChangeVO) {
        MyCreditCardDetail creditCardDetail = new MyCreditCardDetail();
        creditCardDetail.setCreditName(creditCardChangeVO.getBankName());
        creditCardDetail.setChangeAmount(new BigDecimal(creditCardChangeVO.getChangeMoney()));
        creditCardDetail.setRemark(creditCardChangeVO.getReason());
        creditCardDetail.setCreateTime(DateUtil.parseLocalDateTime(creditCardChangeVO.getCreateTime(), "yyyy-MM-dd"));

        return save(creditCardDetail);
    }



    @Override
    public DetailPageDTO getDetailPage(DetailPageVO detailPageVO) {
        List<DetailDTO> list = new ArrayList<>();
        Page<MyCreditCardDetail> page = new Page<>(detailPageVO.getPage(), detailPageVO.getPageSize());
        IPage<MyCreditCardDetail> detailIPage = page(page, Wrappers.<MyCreditCardDetail>lambdaQuery()
                .eq(MyCreditCardDetail::getCreditName, detailPageVO.getBankName()).orderByDesc(MyCreditCardDetail::getCreateTime));
        list = detailIPage.getRecords().stream().map(creditCardDetail -> {
            DetailDTO detailDTO = new DetailDTO();
            detailDTO.setBankName(creditCardDetail.getCreditName());
            detailDTO.setAmount(CommonConstant.DECIMAL_FORMAT.format(creditCardDetail.getChangeAmount()));
            detailDTO.setCreateTime(creditCardDetail.getCreateTime());
            detailDTO.setRemark(creditCardDetail.getRemark());
            return detailDTO;
        }).collect(Collectors.toList());
        DetailPageDTO detailPageDTO = new DetailPageDTO();
        detailPageDTO.setDetailList(list);
        detailPageDTO.setCurrentPage(detailPageVO.getPage());
        detailPageDTO.setTotalNum(detailIPage.getTotal());
        return detailPageDTO;
    }
}
