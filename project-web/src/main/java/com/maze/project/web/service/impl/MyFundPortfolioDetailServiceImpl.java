package com.maze.project.web.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maze.project.web.common.constant.CommonConstant;
import com.maze.project.web.common.enums.FundEnum;
import com.maze.project.web.dto.portfolio.PortfolioDetailDTO;
import com.maze.project.web.dto.portfolio.PortfolioDetailPageDTO;
import com.maze.project.web.entity.MyFundPortfolio;
import com.maze.project.web.entity.MyFundPortfolioDetail;
import com.maze.project.web.mapper.MyFundPortfolioDetailMapper;
import com.maze.project.web.service.MyFundPortfolioDetailService;
import com.maze.project.web.service.MyFundPortfolioService;
import com.maze.project.web.vo.portfolio.PortfolioChangeVO;
import com.maze.project.web.vo.portfolio.PortfolioDetailPageVO;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 组合变动明细 服务实现类
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
@Service
public class MyFundPortfolioDetailServiceImpl extends ServiceImpl<MyFundPortfolioDetailMapper, MyFundPortfolioDetail>
        implements MyFundPortfolioDetailService {

    private final MyFundPortfolioService portfolioService;

    public MyFundPortfolioDetailServiceImpl(MyFundPortfolioService portfolioService) {
        this.portfolioService = portfolioService;
    }

    @Override
    public boolean change(PortfolioChangeVO portfolioChangeVO) {
        MyFundPortfolio portfolio = portfolioService.getOne(Wrappers.<MyFundPortfolio>lambdaQuery().eq(MyFundPortfolio::getName, portfolioChangeVO.getName()));
        BigDecimal principal = null == portfolio ? BigDecimal.ZERO : portfolio.getPrincipal();
        BigDecimal profit = null == portfolio ? BigDecimal.ZERO : portfolio.getProfit();
        MyFundPortfolioDetail lastDetail = getOne(Wrappers.<MyFundPortfolioDetail>lambdaQuery()
                .eq(MyFundPortfolioDetail::getFundPortfolioId, portfolioChangeVO.getPortfolioId())
                .orderByDesc(MyFundPortfolioDetail::getCreateTime)
                .last("limit 1"));
        MyFundPortfolioDetail portfolioDetail = new MyFundPortfolioDetail();
        portfolioDetail.setFundPortfolioId(Integer.parseInt(portfolioChangeVO.getPortfolioId()));
        portfolioDetail.setFundPortfolioName(portfolioChangeVO.getName());
        portfolioDetail.setChangeMoney(new BigDecimal(portfolioChangeVO.getChangeMoney()));
        portfolioDetail.setType(Integer.parseInt(portfolioChangeVO.getChangeType()));
        portfolioDetail.setRemark(portfolioChangeVO.getRemark());
        portfolioDetail.setCreateTime(LocalDateTime.now());
        if (null == lastDetail){
            portfolioDetail.setNewAssets(new BigDecimal(portfolioChangeVO.getChangeMoney()));
            portfolioDetail.setProfitRate(BigDecimal.ZERO);
        }else {
            portfolioDetail.setNewAssets(lastDetail.getNewAssets().add(new BigDecimal(portfolioChangeVO.getChangeMoney())));
            //记录资产更新时，要同时变更盈利情况和收益率
            if (FundEnum.FundChangeEnum.AMOUNT_UPDATE.getCode() == Integer.parseInt(portfolioChangeVO.getChangeMoney())){
                profit = profit.add(new BigDecimal(portfolioChangeVO.getChangeMoney()));
                BigDecimal profitRate = profit.divide(principal, 4, RoundingMode.HALF_UP);
                portfolioDetail.setProfitRate(profitRate);
            }else {
                //如果是记录本金转入转出，就不用更新收益率了，还是上一次的收益率
                portfolioDetail.setProfitRate(lastDetail.getProfitRate());
            }
        }

        return save(portfolioDetail);
    }

    @Override
    public PortfolioDetailPageDTO getPortfolioDetail(PortfolioDetailPageVO portfolioDetailPageVO) {
        List<PortfolioDetailDTO> list = new ArrayList<>();
        Page<MyFundPortfolioDetail> page = new Page<>(portfolioDetailPageVO.getPage(), portfolioDetailPageVO.getPageSize());
        IPage<MyFundPortfolioDetail> portfolioDetailIPage = page(page, Wrappers.<MyFundPortfolioDetail>lambdaQuery()
                .eq(MyFundPortfolioDetail::getFundPortfolioId, portfolioDetailPageVO.getId())
                .orderByDesc(MyFundPortfolioDetail::getCreateTime));
        for (MyFundPortfolioDetail myFundPortfolioDetail : portfolioDetailIPage.getRecords()){
            PortfolioDetailDTO portfolioDetailDTO = new PortfolioDetailDTO();
            portfolioDetailDTO.setName(myFundPortfolioDetail.getFundPortfolioName());
            portfolioDetailDTO.setChangeType(String.valueOf(myFundPortfolioDetail.getType()));
            portfolioDetailDTO.setChangeMoney(CommonConstant.DECIMAL_FORMAT.format(myFundPortfolioDetail.getChangeMoney()));
            portfolioDetailDTO.setCreateTime(myFundPortfolioDetail.getCreateTime());
            portfolioDetailDTO.setProfitRate(CommonConstant.DECIMAL_FORMAT.format(myFundPortfolioDetail.getProfitRate()));
            list.add(portfolioDetailDTO);
        }
        PortfolioDetailPageDTO portfolioDetailPageDTO = new PortfolioDetailPageDTO();
        portfolioDetailPageDTO.setCurrentPage(portfolioDetailPageVO.getPage());
        portfolioDetailPageDTO.setTotalNum(portfolioDetailIPage.getTotal());
        portfolioDetailPageDTO.setDetailList(list);
        return portfolioDetailPageDTO;
    }
}
