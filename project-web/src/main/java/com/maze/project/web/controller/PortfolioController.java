package com.maze.project.web.controller;

import com.maze.project.web.common.enums.ResponseCodeEnum;
import com.maze.project.web.common.exception.GlobalException;
import com.maze.project.web.common.util.ExceptionUtil;
import com.maze.project.web.dto.common.BaseDTO;
import com.maze.project.web.dto.portfolio.PortfolioDTO;
import com.maze.project.web.dto.portfolio.PortfolioDetailPageDTO;
import com.maze.project.web.dto.portfolio.PortfolioInfoListDTO;
import com.maze.project.web.dto.portfolio.PortfolioPageDTO;
import com.maze.project.web.service.MyFundPortfolioDetailService;
import com.maze.project.web.service.MyFundPortfolioService;
import com.maze.project.web.vo.portfolio.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("portfolio")
public class PortfolioController {

    private final MyFundPortfolioService portfolioService;
    private final MyFundPortfolioDetailService portfolioDetailService;

    public PortfolioController(MyFundPortfolioService portfolioService, MyFundPortfolioDetailService portfolioDetailService) {
        this.portfolioService = portfolioService;
        this.portfolioDetailService = portfolioDetailService;
    }

    /**
     * @description: 分页查询组合列表
     * @param: portfolioPageVO
     * @return: com.maze.project.web.dto.common.BaseDTO
     * @author maze
     * @date: 2021/12/18 22:11
     */
    @PostMapping(value = "page")
    public BaseDTO portfolioPage(@Validated @RequestBody PortfolioPageVO portfolioPageVO){
        PortfolioPageDTO portfolioPageDTO;
        try {
            portfolioPageDTO = portfolioService.getPortfolioPage(portfolioPageVO);
        }catch (Exception e){
            log.error("============分页查询投顾组合列表异常==========={}", ExceptionUtil.getMessage(e));
            throw new GlobalException(ResponseCodeEnum.GET_PORTFOLIO_PAGE_ERROR);
        }

        return BaseDTO.ok().data(portfolioPageDTO);
    }

    /**
     * @description: 记录投顾组合变动情况
     * @param: portfolioChangeVO
     * @return: com.maze.project.web.dto.common.BaseDTO
     * @author maze
     * @date: 2021/12/19 16:20
     */
    @PostMapping(value = "change")
    @Transactional(rollbackFor = Exception.class)
    public BaseDTO recordPortfolioChange(@Validated @RequestBody PortfolioChangeVO portfolioChangeVO){
        try {
            boolean result = portfolioDetailService.change(portfolioChangeVO);
            if (result){
                result = portfolioService.updatePortfolio(portfolioChangeVO);
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
     * @description: 获取组合分类情况
     * @param: cashChangeVO
     * @return: com.maze.project.web.dto.common.BaseDTO
     * @author maze
     * @date: 2021/12/19 16:20
     */
    @PostMapping(value = "infos")
    public BaseDTO getPortfolioInfos(@Validated @RequestBody PortfolioInfosVO portfolioInfosVO){
        PortfolioInfoListDTO portfolioInfoListDTO = new PortfolioInfoListDTO();
        try {
            portfolioInfoListDTO = portfolioService.getPortfolioInfos(portfolioInfosVO.getAccountId());
        }catch (Exception e){
            log.error("============查询组合分类异常==========={}", ExceptionUtil.getMessage(e));
            throw new GlobalException(ResponseCodeEnum.GET_PORTFOLIOS_INFO_ERROR);
        }
        return BaseDTO.ok().data(portfolioInfoListDTO);
    }
    /**
     * @description: 获取单个基金组合信息
     * @param: portfolioInfoVO
     * @return: com.maze.project.web.dto.common.BaseDTO
     * @author maze
     * @date: 2022/1/2 16:26
     */
    @PostMapping(value = "info")
    public BaseDTO getPortfolioInfo(@Validated @RequestBody PortfolioInfoVO portfolioInfoVO){
        PortfolioDTO portfolioDTO = new PortfolioDTO();
        try {
            portfolioDTO = portfolioService.getPortfolioInfo(portfolioInfoVO.getId());
        }catch (Exception e){
            log.error("============查询基金组合信息异常==========={}", ExceptionUtil.getMessage(e));
            throw new GlobalException(ResponseCodeEnum.GET_PORTFOLIO_INFO_ERROR);
        }
        return BaseDTO.ok().data(portfolioDTO);
    }

    /**
     * 查询某基金的变动情况
     * @param portfolioDetailPageVO 详情分页请求VO
     * @return  详情
     */
    @PostMapping(value = "detailPage")
    public BaseDTO getDetailPage(@Validated @RequestBody PortfolioDetailPageVO portfolioDetailPageVO){
        PortfolioDetailPageDTO portfolioDetailPageDTO = new PortfolioDetailPageDTO();
        try {
            portfolioDetailPageDTO = portfolioDetailService.getPortfolioDetail(portfolioDetailPageVO);
        }catch (Exception e){
            log.error("============查询组合变动异常==========={}", ExceptionUtil.getMessage(e));
            throw new GlobalException(ResponseCodeEnum.GET_PORTFOLIO_CHANGE_ERROR);
        }
        return BaseDTO.ok().data(portfolioDetailPageDTO);
    }
}