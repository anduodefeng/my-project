package com.maze.project.web.controller;

import com.maze.project.web.common.enums.ResponseCodeEnum;
import com.maze.project.web.common.exception.GlobalException;
import com.maze.project.web.common.util.ExceptionUtil;
import com.maze.project.web.dto.PortfolioDetailChartDTO;
import com.maze.project.web.dto.common.BaseDTO;
import com.maze.project.web.dto.portfolio.*;
import com.maze.project.web.service.MyFundPortfolioDetailService;
import com.maze.project.web.service.MyFundPortfolioService;
import com.maze.project.web.vo.portfolio.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("chart/{accountId}")
    public BaseDTO fundChart(@PathVariable String accountId){
        PortfolioChartDTO chartDTO = new PortfolioChartDTO();
        try {
            chartDTO = portfolioService.getChart(accountId);
        }catch (Exception e){
            log.error("=========查询基金组合图表异常==========");
            throw new GlobalException(ResponseCodeEnum.FIND_PORTFOLIO_CHART_ERROR);
        }

        return BaseDTO.ok().data(chartDTO);
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
            Integer id = portfolioService.updatePortfolio(portfolioChangeVO);
            if (null != id){
                boolean result = portfolioDetailService.change(portfolioChangeVO, id);
                if (!result){
                    throw new GlobalException(ResponseCodeEnum.UPDATE_PORTFOLIO_DETAIL_ERROR);
                }
            }else {
                throw new GlobalException(ResponseCodeEnum.UPDATE_PORTFOLIOS_INFO_ERROR);
            }
        }catch (Exception e){
            log.error("============记录基金组合明细异常==========={}", ExceptionUtil.getMessage(e));
            throw new GlobalException(ResponseCodeEnum.RECORD_PORTFOLIO_CHANGE_EXCEPTION);
        }
        return BaseDTO.ok();
    }


    @GetMapping("detail/chart/{id}")
    public BaseDTO portfolioDetailChart(@PathVariable String id){
        PortfolioDetailChartDTO chartDTO = new PortfolioDetailChartDTO();
        try {
            chartDTO = portfolioDetailService.getChart(id);
        }catch (Exception e){
            log.error("=========查询基金变动图表异常==========");
            throw new GlobalException(ResponseCodeEnum.FIND_FUND_DETAIL_CHART_ERROR);
        }

        return BaseDTO.ok().data(chartDTO);
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
