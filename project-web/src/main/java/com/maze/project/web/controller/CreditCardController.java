package com.maze.project.web.controller;

import com.maze.project.web.common.enums.ResponseCodeEnum;
import com.maze.project.web.common.exception.GlobalException;
import com.maze.project.web.common.util.ExceptionUtil;
import com.maze.project.web.dto.common.BaseDTO;
import com.maze.project.web.dto.credit_card.BankInfoDTO;
import com.maze.project.web.dto.credit_card.BankNamesDTO;
import com.maze.project.web.dto.credit_card.CreditCardPageDTO;
import com.maze.project.web.dto.credit_card.DetailPageDTO;
import com.maze.project.web.service.MyCreditCardDetailService;
import com.maze.project.web.service.MyCreditCardService;
import com.maze.project.web.vo.common.BasePageVO;
import com.maze.project.web.vo.credit_card.CreditCardChangeVO;
import com.maze.project.web.vo.credit_card.DetailPageVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(value = "creditCard")
@Slf4j
public class CreditCardController {

    private final MyCreditCardService creditCardService;
    private final MyCreditCardDetailService creditCardDetailService;

    public CreditCardController(MyCreditCardService creditCardService, MyCreditCardDetailService creditCardDetailService) {
        this.creditCardService = creditCardService;
        this.creditCardDetailService = creditCardDetailService;
    }

//    @GetMapping("chart")
//    public BaseDTO cashChart(){
//        CashChartDTO chartDTO = new CashChartDTO();
//        try {
//            chartDTO = cashService.getChart();
//        }catch (Exception e){
//            log.error("=========查询现金图表异常==========");
//            throw new GlobalException(ResponseCodeEnum.FIND_CASH_CHART_ERROR);
//        }
//
//        return BaseDTO.ok().data(chartDTO);
//    }

    /**
     * @description: 分页查询信用卡列表
     * @param: basePageVO
     * @return: com.maze.project.web.dto.common.BaseDTO 
     * @author maze
     * @date: 2021/12/18 22:11
     */
    @PostMapping(value = "page")
    public BaseDTO creditCardPage(@Validated @RequestBody BasePageVO basePageVO){
        CreditCardPageDTO creditCardPageDTO;
        try {
            creditCardPageDTO = creditCardService.getCreditCardPage(basePageVO);
        }catch (Exception e){
            log.error("============分页查询信用卡列表异常==========={}", ExceptionUtil.getMessage(e));
            throw new GlobalException(ResponseCodeEnum.GET_CREDIT_CARD_PAGE_ERROR);
        }

        return BaseDTO.ok().data(creditCardPageDTO);
    }

    /**
     * @description: 记录信用卡变动情况
     * @param: creditCardChangeVO
     * @return: com.maze.project.web.dto.common.BaseDTO
     * @author maze
     * @date: 2021/12/19 16:20
     */
    @PostMapping(value = "change")
    @Transactional(rollbackFor = Exception.class)
    public BaseDTO recordCreditCardChange(@Validated @RequestBody CreditCardChangeVO creditCardChangeVO){
        try {
            boolean result = creditCardDetailService.change(creditCardChangeVO);
            if (result){
                result = creditCardService.updateCreditCard(creditCardChangeVO.getBankName(),
                        creditCardChangeVO.getChangeMoney(), creditCardChangeVO.getLimit(),
                        creditCardChangeVO.getBillDay(), creditCardChangeVO.getRepayDay());
                if (!result){
                    throw new GlobalException(ResponseCodeEnum.UPDATE_CREDIT_CARD_ERROR);
                }
            }else {
                throw new GlobalException(ResponseCodeEnum.ADD_CARDIT_CARD_DETAIL_ERROR);
            }
        }catch (Exception e){
            log.error("============记录信用卡明细异常==========={}", ExceptionUtil.getMessage(e));
            throw new GlobalException(ResponseCodeEnum.RECORD_CREDIT_CARD_CHANGE_ERROR);
        }
        return BaseDTO.ok();
    }

    /**
     * @description: 记录信用卡银行列表
     * @return: com.maze.project.web.dto.common.BaseDTO
     * @author maze
     * @date: 2021/12/19 16:20
     */
    @GetMapping(value = "bankNames")
    @Transactional(rollbackFor = Exception.class)
    public BaseDTO getBankNames(){
        List<String> bankNames = new ArrayList<>();
        try {
            bankNames = creditCardService.getBanksName();
        }catch (Exception e){
            log.error("============查询现金银行卡异常==========={}", ExceptionUtil.getMessage(e));
            throw new GlobalException(ResponseCodeEnum.GET_CREDIT_CARD_BANK_NAME_ERROR);
        }
        BankNamesDTO bankNamesDTO = new BankNamesDTO();
        bankNamesDTO.setBankNames(bankNames);
        return BaseDTO.ok().data(bankNamesDTO);
    }

    /**
     * @description: 记录信用卡银行列表
     * @return: com.maze.project.web.dto.common.BaseDTO
     * @author maze
     * @date: 2021/12/19 16:20
     */
    @GetMapping(value = "bankInfo/{bankName}")
    @Transactional(rollbackFor = Exception.class)
    public BaseDTO getBankInfo(@PathVariable String bankName){
        BankInfoDTO bankInfoDTO = new BankInfoDTO();
        try {
            bankInfoDTO = creditCardService.getBankInfo(bankName);
        }catch (Exception e){
            log.error("============查询现金银行卡异常==========={}", ExceptionUtil.getMessage(e));
            throw new GlobalException(ResponseCodeEnum.GET_CREDIT_CARD_BANK_NAME_ERROR);
        }
        return BaseDTO.ok().data(bankInfoDTO);
    }

    /**
     * 查询某银行卡的变动情况
     * @param detailPageVO 详情分页请求VO
     * @return  详情
     */
    @PostMapping(value = "detailPage")
    public BaseDTO getDetailPage(@Validated @RequestBody DetailPageVO detailPageVO){
        DetailPageDTO detailPageDTO = new DetailPageDTO();
        try {
            detailPageDTO = creditCardDetailService.getDetailPage(detailPageVO);
        }catch (Exception e){
            log.error("============查询现金银行卡异常==========={}", ExceptionUtil.getMessage(e));
            throw new GlobalException(ResponseCodeEnum.GET_CASH_BANK_NAMES_ERROR);
        }
        return BaseDTO.ok().data(detailPageDTO);
    }
}
