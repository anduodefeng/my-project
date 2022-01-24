package com.maze.project.web.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maze.project.web.dto.cash.CashChartDTO;
import com.maze.project.web.dto.common.BarValueDTO;
import com.maze.project.web.dto.common.PieDTO;
import com.maze.project.web.dto.credit_card.BankInfoDTO;
import com.maze.project.web.dto.credit_card.CreditCardDTO;
import com.maze.project.web.dto.credit_card.CreditCardPageDTO;
import com.maze.project.web.entity.MyCreditCard;
import com.maze.project.web.mapper.MyCreditCardMapper;
import com.maze.project.web.service.MyCreditCardService;
import com.maze.project.web.vo.common.BasePageVO;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
public class MyCreditCardServiceImpl extends ServiceImpl<MyCreditCardMapper, MyCreditCard> implements MyCreditCardService {


    @Override
    public CashChartDTO getChart() {
        List<PieDTO> pieList = new ArrayList<>();
        List<String> bankNameList = new ArrayList<>();
        List<BarValueDTO> bankValueList = new ArrayList<>();
//        List<MyCash> cashList = list();
//        for (MyCash cash : cashList){
//            PieItemColor pieItemColor = new PieItemColor();
//            String color = CashEnum.CashPieColorEnum.getColor(cash.getBankName());
//            pieItemColor.setColor(color);
//
//            PieDTO pieDTO = new PieDTO();
//            pieDTO.setName(cash.getBankName());
//            pieDTO.setValue(cash.getAmount().doubleValue());
//            pieDTO.setItemStyle(pieItemColor);
//            pieList.add(pieDTO);
//
//            BarValueDTO barValueDTO = new BarValueDTO();
//            barValueDTO.setValue(cash.getAmount().doubleValue());
//            barValueDTO.setColor(color);
//            bankValueList.add(barValueDTO);
//
//            bankNameList.add(cash.getBankName());
//        }
        CashChartDTO chartDTO = new CashChartDTO();
        chartDTO.setPieList(pieList);
        chartDTO.setBankNameList(bankNameList);
        chartDTO.setBankValueList(bankValueList);

        return chartDTO;
    }

    @Override
    public CreditCardPageDTO getCreditCardPage(BasePageVO basePageVO){
        CreditCardPageDTO creditCardPageDTO = new CreditCardPageDTO();
        List<CreditCardDTO> creditCardList = new ArrayList<>();
        Page<MyCreditCard> page = new Page<>(basePageVO.getPage(), basePageVO.getPageSize());
        IPage<MyCreditCard> iPage = page(page, Wrappers.<MyCreditCard>lambdaQuery().orderByDesc(MyCreditCard::getLeftAmount));
        if (CollectionUtil.isNotEmpty(iPage.getRecords())){
            creditCardList = iPage.getRecords().stream().map(creditCard -> {
                CreditCardDTO creditCardDTO = new CreditCardDTO();
                creditCardDTO.setBankName(creditCard.getName());
                creditCardDTO.setLimit(String.valueOf(creditCard.getLimitAmount()));
                creditCardDTO.setLeftAmount(String.valueOf(creditCard.getLeftAmount()));
                Map<String, String> map = calculateDays(creditCard.getRepaymentDate(), creditCard.getBillDate());
                creditCardDTO.setBillDate(map.get("billDay"));
                creditCardDTO.setRepayDate(map.get("repayDay"));
                creditCardDTO.setLeftBillDay(map.get("leftDay"));
                return creditCardDTO;
            }).collect(Collectors.toList());
        }
        creditCardPageDTO.setCurrentPage(basePageVO.getPage());
        creditCardPageDTO.setTotalNum(iPage.getTotal());
        creditCardPageDTO.setCreditCardList(creditCardList);

        return creditCardPageDTO;
    }

    @Override
    public boolean updateCreditCard(String bankName, String changeMoney, String limit, String billDay, String repayDay) {

        MyCreditCard creditCard = getOne(Wrappers.<MyCreditCard>lambdaQuery().eq(MyCreditCard::getName, bankName));
        if (null != creditCard){
            BigDecimal change = new BigDecimal(changeMoney);
            BigDecimal result = creditCard.getLeftAmount().subtract(change);
            creditCard.setLeftAmount(result);
            creditCard.setUpdateTime(LocalDateTime.now());
        }else {
            creditCard = new MyCreditCard();
            creditCard.setName(bankName);
            creditCard.setLimitAmount(Integer.parseInt(limit));
            BigDecimal left = new BigDecimal(limit).subtract(new BigDecimal(changeMoney));
            creditCard.setLeftAmount(left);
            creditCard.setBillDate(Integer.parseInt(billDay));
            creditCard.setRepaymentDate(Integer.parseInt(repayDay));
            creditCard.setCreateTime(LocalDateTime.now());
            creditCard.setUpdateTime(LocalDateTime.now());
        }

        return saveOrUpdate(creditCard);
    }

    @Override
    public List<String> getBanksName() {
        List<MyCreditCard> myCashes = list(Wrappers.<MyCreditCard>lambdaQuery().select(MyCreditCard::getName).groupBy(MyCreditCard::getName));
        return myCashes.stream().map(MyCreditCard::getName).collect(Collectors.toList());
    }

    @Override
    public BankInfoDTO getBankInfo(String bankName) {
        BankInfoDTO bankInfoDTO = new BankInfoDTO();
        MyCreditCard creditCard = getOne(Wrappers.<MyCreditCard>lambdaQuery().eq(MyCreditCard::getName, bankName));
        if (null != creditCard){
            bankInfoDTO.setBankName(creditCard.getName());
            bankInfoDTO.setLimit(String.valueOf(creditCard.getLimitAmount()));
            bankInfoDTO.setBillDay(String.valueOf(creditCard.getBillDate()));
            bankInfoDTO.setRepayDay(String.valueOf(creditCard.getRepaymentDate()));
        }
        return bankInfoDTO;
    }

    private Map<String, String> calculateDays(int repayDate, int billDate){
        Map<String, String> map =  new HashMap<>();
        String repayDay = "";
        String billDay = "";
        long leftDay;
        if (DateTime.now().dayOfMonth() < repayDate){
            repayDay = DateTime.now().year() + "-" + DateTime.now().monthBaseOne() + "-" + String.format("%02d",repayDate);
            DateTime repay = DateUtil.parse(repayDay, "yyyy-MM-dd");
            leftDay = DateUtil.between(DateTime.now(), repay, DateUnit.DAY);
        }else {
            repayDay = DateTime.now().year() + "-" + (DateTime.now().monthBaseOne()+1) + "-" + String.format("%02d",repayDate);
            DateTime repay = DateUtil.parse(repayDay, "yyyy-MM-dd");
            leftDay = DateUtil.between(DateTime.now(), repay, DateUnit.DAY);
        }
        if (DateTime.now().dayOfMonth() < billDate){
            billDay = DateTime.now().year() + "-" + DateTime.now().monthBaseOne() + "-" + String.format("%02d", billDate);
        }else {
            billDay = DateTime.now().year() + "-" + (DateTime.now().monthBaseOne()+1) + "-" + String.format("%02d", billDate);
        }
        map.put("repayDay", repayDay);
        map.put("billDay", billDay);
        map.put("leftDay", String.valueOf(leftDay));

        return map;
    }
}
