package com.maze.project.web.controller;

import com.maze.project.web.common.enums.ResponseCodeEnum;
import com.maze.project.web.common.exception.GlobalException;
import com.maze.project.web.common.util.ExceptionUtil;
import com.maze.project.web.dto.common.BaseDTO;
import com.maze.project.web.dto.fund.FundDTO;
import com.maze.project.web.dto.fund.FundDetailPageDTO;
import com.maze.project.web.dto.fund.FundInfoListDTO;
import com.maze.project.web.dto.fund.FundPageDTO;
import com.maze.project.web.service.MyFundDetailService;
import com.maze.project.web.service.MyFundService;
import com.maze.project.web.vo.fund.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "fund")
@Slf4j
public class FundController {

    private final MyFundService fundService;
    private final MyFundDetailService fundDetailService;

    public FundController(MyFundService fundService, MyFundDetailService fundDetailService) {
        this.fundService = fundService;
        this.fundDetailService = fundDetailService;
    }

    /**
     * @description: 分页查询基金列表
     * @param: cashPageVO 
     * @return: com.maze.project.web.dto.common.BaseDTO 
     * @author maze
     * @date: 2021/12/18 22:11
     */
    @PostMapping(value = "page")
    public BaseDTO fundPage(@Validated @RequestBody FundPageVO fundPageVO){
        FundPageDTO fundPageDTO;
        try {
            fundPageDTO = fundService.getFundPage(fundPageVO);
        }catch (Exception e){
            log.error("============分页查询基金列表异常==========={}",ExceptionUtil.getMessage(e));
            throw new GlobalException(ResponseCodeEnum.GET_FUND_PAGE_ERROR);
        }

        return BaseDTO.ok().data(fundPageDTO);
    }

    /**
     * @description: 记录基金变动情况
     * @param: cashChangeVO
     * @return: com.maze.project.web.dto.common.BaseDTO
     * @author maze
     * @date: 2021/12/19 16:20
     */
    @PostMapping(value = "change")
    @Transactional(rollbackFor = Exception.class)
    public BaseDTO recordFundChange(@Validated @RequestBody FundChangeVO fundChangeVO){
        try {
            boolean result = fundDetailService.change(fundChangeVO);
            if (result){
                result = fundService.updateFund(fundChangeVO);
                if (!result){
                    throw new GlobalException(ResponseCodeEnum.UPDATE_FUND_ERROR);
                }
            }else {
                throw new GlobalException(ResponseCodeEnum.UPDATE_FUND_DETAIL_ERROOR);
            }
        }catch (Exception e){
            log.error("============记录现金明细异常==========={}", ExceptionUtil.getMessage(e));
            throw new GlobalException(ResponseCodeEnum.RECORD_FUND_CHANGE_EXCEPTION);
        }
        return BaseDTO.ok();
    }

    /**
     * @description: 获取基金分类情况
     * @param: cashChangeVO
     * @return: com.maze.project.web.dto.common.BaseDTO
     * @author maze
     * @date: 2021/12/19 16:20
     */
    @PostMapping(value = "fundInfos")
    public BaseDTO getFundInfos(@RequestBody FundInfosVO fundInfosVO){
        FundInfoListDTO fundInfoListDTO = new FundInfoListDTO();
        try {
            fundInfoListDTO = fundService.getFundInfos(fundInfosVO.getFundType());
        }catch (Exception e){
            log.error("============查询基金分类异常==========={}", ExceptionUtil.getMessage(e));
            throw new GlobalException(ResponseCodeEnum.GET_FUNDS_INFO_ERROR);
        }
        return BaseDTO.ok().data(fundInfoListDTO);
    }
    /** 
     * @description: 获取单个基金信息
     * @param: code 
     * @return: com.maze.project.web.dto.common.BaseDTO 
     * @author maze
     * @date: 2022/1/2 16:26
     */
    @PostMapping(value = "getFundInfo")
    public BaseDTO getFundInfo(@RequestBody FundInfoVO fundInfoVO){
        FundDTO fundDTO = new FundDTO();
        try {
            fundDTO = fundService.getFundInfo(fundInfoVO.getCode());
        }catch (Exception e){
            log.error("============查询基金信息异常==========={}", ExceptionUtil.getMessage(e));
            throw new GlobalException(ResponseCodeEnum.GET_FUND_INFO_ERROR);
        }
        return BaseDTO.ok().data(fundDTO);
    }

    /**
     * 查询某基金的变动情况
     * @param fundDetailPageVO 详情分页请求VO
     * @return  详情
     */
    @PostMapping(value = "detailPage")
    public BaseDTO getDetailPage(@Validated @RequestBody FundDetailPageVO fundDetailPageVO){
        FundDetailPageDTO fundDetailPageDTO = new FundDetailPageDTO();
        try {
            fundDetailPageDTO = fundDetailService.getFundDetail(fundDetailPageVO);
        }catch (Exception e){
            log.error("============查询基金变动异常==========={}", ExceptionUtil.getMessage(e));
            throw new GlobalException(ResponseCodeEnum.RECORD_FUND_CHANGE_EXCEPTION);
        }
        return BaseDTO.ok().data(fundDetailPageDTO);
    }
}
