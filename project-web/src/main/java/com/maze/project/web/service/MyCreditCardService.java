package com.maze.project.web.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.maze.project.web.dto.credit_card.BankInfoDTO;
import com.maze.project.web.dto.credit_card.CreditCardPageDTO;
import com.maze.project.web.dto.credit_card.CreditChartDTO;
import com.maze.project.web.entity.MyCreditCard;
import com.maze.project.web.vo.common.BasePageVO;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author maze
 * @since 2022-01-24
 */
public interface MyCreditCardService extends IService<MyCreditCard> {

    CreditChartDTO getChart();

    CreditCardPageDTO getCreditCardPage(BasePageVO basePageVO);

    boolean updateCreditCard(String bankName, String changeMoney, String limit, String billDay, String repayDay);

    List<String> getBanksName();

    BankInfoDTO getBankInfo(String bankName);
}
