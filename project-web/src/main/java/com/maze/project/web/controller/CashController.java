package com.maze.project.web.controller;

import com.maze.project.web.common.enums.ResponseCodeEnum;
import com.maze.project.web.common.exception.GlobalException;
import com.maze.project.web.common.util.ExceptionUtil;
import com.maze.project.web.dto.cash.BankNamesDTO;
import com.maze.project.web.dto.cash.CashPageDTO;
import com.maze.project.web.dto.cash.DetailPageDTO;
import com.maze.project.web.dto.common.BaseDTO;
import com.maze.project.web.service.MyCashDetailService;
import com.maze.project.web.service.MyCashService;
import com.maze.project.web.vo.cash.CashChangeVO;
import com.maze.project.web.vo.cash.CashPageVO;
import com.maze.project.web.vo.cash.DetailPageVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(value = "cash")
@Slf4j
public class CashController {

    private final MyCashService cashService;
    private final MyCashDetailService cashDetailService;

    public CashController(MyCashService cashService, MyCashDetailService cashDetailService) {
        this.cashService = cashService;
        this.cashDetailService = cashDetailService;
    }

    /**
     * @description: 分页查询现金列表
     * @param: cashPageVO 
     * @return: com.maze.project.web.dto.common.BaseDTO 
     * @author maze
     * @date: 2021/12/18 22:11
     */
    @PostMapping(value = "page")
    public BaseDTO cashPage(@Validated @RequestBody CashPageVO cashPageVO){
        CashPageDTO cashPageDTO;
        try {
            cashPageDTO = cashService.getCashPage(cashPageVO);
        }catch (Exception e){
            log.error("============分页查询现金列表异常==========={}", ExceptionUtil.getMessage(e));
            throw new GlobalException(ResponseCodeEnum.FIND_CASH_PAGE_ERROR);
        }

        return BaseDTO.ok().data(cashPageDTO);
    }

    /**
     * @description: 记录现金变动情况
     * @param: cashChangeVO
     * @return: com.maze.project.web.dto.common.BaseDTO
     * @author maze
     * @date: 2021/12/19 16:20
     */
    @PostMapping(value = "change")
    @Transactional(rollbackFor = Exception.class)
    public BaseDTO recordCashChange(@Validated @RequestBody CashChangeVO cashChangeVO){
        try {
            boolean result = cashDetailService.change(cashChangeVO);
            if (result){
                result = cashService.updateCash(cashChangeVO.getBankName(), cashChangeVO.getChangeMoney());
                if (!result){
                    throw new GlobalException(ResponseCodeEnum.UPDATE_CASH_ERROR);
                }
            }else {
                throw new GlobalException(ResponseCodeEnum.ADD_CASH_DETAIL_ERROR);
            }
        }catch (Exception e){
            log.error("============记录现金明细异常==========={}", ExceptionUtil.getMessage(e));
            throw new GlobalException(ResponseCodeEnum.RECORD_CASH_CHANGE_EXCEPTION);
        }
        return BaseDTO.ok();
    }

    /**
     * @description: 记录现金变动情况
     * @param: cashChangeVO
     * @return: com.maze.project.web.dto.common.BaseDTO
     * @author maze
     * @date: 2021/12/19 16:20
     */
    @PostMapping(value = "bankNames")
    @Transactional(rollbackFor = Exception.class)
    public BaseDTO getBankNames(){
        List<String> bankNames = new ArrayList<>();
        try {
            bankNames = cashService.getBanksName();
        }catch (Exception e){
            log.error("============查询现金银行卡异常==========={}", ExceptionUtil.getMessage(e));
            throw new GlobalException(ResponseCodeEnum.RECORD_CASH_CHANGE_EXCEPTION);
        }
        BankNamesDTO bankNamesDTO = new BankNamesDTO();
        bankNamesDTO.setBankNames(bankNames);
        return BaseDTO.ok().data(bankNamesDTO);
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
            detailPageDTO = cashDetailService.getDetailPage(detailPageVO);
        }catch (Exception e){
            log.error("============查询现金银行卡异常==========={}", ExceptionUtil.getMessage(e));
            throw new GlobalException(ResponseCodeEnum.GET_CASH_BANK_NAMES_ERROR);
        }
        return BaseDTO.ok().data(detailPageDTO);
    }
}
