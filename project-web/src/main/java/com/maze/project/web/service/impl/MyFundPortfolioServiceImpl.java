package com.maze.project.web.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.maze.project.web.common.constant.CommonConstant;
import com.maze.project.web.common.enums.FundEnum;
import com.maze.project.web.dto.portfolio.PortfolioDTO;
import com.maze.project.web.dto.portfolio.PortfolioInfoDTO;
import com.maze.project.web.dto.portfolio.PortfolioInfoListDTO;
import com.maze.project.web.dto.portfolio.PortfolioPageDTO;
import com.maze.project.web.entity.MyFundPortfolio;
import com.maze.project.web.mapper.MyFundPortfolioMapper;
import com.maze.project.web.service.MyFundPortfolioService;
import com.maze.project.web.vo.portfolio.PortfolioChangeVO;
import com.maze.project.web.vo.portfolio.PortfolioPageVO;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 基金组合表 服务实现类
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
@Service
public class MyFundPortfolioServiceImpl extends ServiceImpl<MyFundPortfolioMapper, MyFundPortfolio>
        implements MyFundPortfolioService {

    @Override
    public PortfolioPageDTO getPortfolioPage(PortfolioPageVO portfolioPageVO) {
        List<PortfolioDTO> list = new ArrayList<>();
        Page<MyFundPortfolio> page = new Page<>(portfolioPageVO.getPage(), portfolioPageVO.getPageSize());
        IPage<MyFundPortfolio> iPage = page(page, Wrappers.<MyFundPortfolio>lambdaQuery()
                .eq(MyFundPortfolio::getType, portfolioPageVO.getType())
                .orderByDesc(MyFundPortfolio::getProfitRate));
        for (MyFundPortfolio fundPortfolio : iPage.getRecords()){
            PortfolioDTO portfolioDTO = new PortfolioDTO();
            portfolioDTO.setName(fundPortfolio.getName());
            portfolioDTO.setMoney(CommonConstant.DECIMAL_FORMAT.format(fundPortfolio.getMoney()));
            portfolioDTO.setPrincipal(CommonConstant.DECIMAL_FORMAT.format(fundPortfolio.getPrincipal()));
            portfolioDTO.setProfit(CommonConstant.DECIMAL_FORMAT.format(fundPortfolio.getProfit()));
            portfolioDTO.setProfitRate(CommonConstant.DECIMAL_FORMAT.format(fundPortfolio.getProfitRate().multiply(BigDecimal.valueOf(100))));
            list.add(portfolioDTO);
        }
        PortfolioPageDTO portfolioPageDTO = new PortfolioPageDTO();
        portfolioPageDTO.setPortfolioList(list);
        portfolioPageDTO.setCurrentPage(portfolioPageVO.getPage());
        portfolioPageDTO.setTotalNum(iPage.getTotal());
        return portfolioPageDTO;
    }

    @Override
    public boolean updatePortfolio(PortfolioChangeVO portfolioChangeVO) {
        MyFundPortfolio portfolio = getById(portfolioChangeVO.getPortfolioId());
        if (null != portfolio){
            portfolio.setMoney(portfolio.getMoney().add(new BigDecimal(portfolioChangeVO.getChangeMoney())));
            if (FundEnum.FundChangeEnum.AMOUNT_UPDATE.getCode() == Integer.parseInt(portfolioChangeVO.getType())){
                portfolio.setProfit(portfolio.getProfit().add(new BigDecimal(portfolioChangeVO.getChangeMoney())));
            }else {
                portfolio.setPrincipal(portfolio.getPrincipal().add(new BigDecimal(portfolioChangeVO.getChangeMoney())));
            }
        }else {
            portfolio = new MyFundPortfolio();
            portfolio.setName(portfolioChangeVO.getName());
            portfolio.setMoney(new BigDecimal(portfolioChangeVO.getChangeMoney()));
            portfolio.setPrincipal(new BigDecimal(portfolioChangeVO.getChangeMoney()));
            portfolio.setCreateTime(LocalDateTime.now());
            portfolio.setProfit(BigDecimal.ZERO);
            portfolio.setProfitRate(BigDecimal.ZERO);
        }
        portfolio.setType(Integer.parseInt(portfolioChangeVO.getType()));
        portfolio.setUpdateTime(LocalDateTime.now());
        return saveOrUpdate(portfolio);
    }

    @Override
    public PortfolioInfoListDTO getPortfolioInfos(String accountId) {
        PortfolioInfoListDTO portfolioInfoListDTO = new PortfolioInfoListDTO();
        List<PortfolioInfoDTO> portfolioInfoDTOS = new ArrayList<>();
        List<MyFundPortfolio> myPortfolios = list(Wrappers.<MyFundPortfolio>lambdaQuery()
                .eq(MyFundPortfolio::getAccountId, Integer.parseInt(accountId)));
        for (MyFundPortfolio portfolio : myPortfolios){
            PortfolioInfoDTO portfolioInfoDTO = new PortfolioInfoDTO();
            portfolioInfoDTO.setId(String.valueOf(portfolio.getId()));
            portfolioInfoDTO.setName(portfolio.getName());
            portfolioInfoDTOS.add(portfolioInfoDTO);
        }
        portfolioInfoListDTO.setPortfolioInfoDTOS(portfolioInfoDTOS);
        return portfolioInfoListDTO;
    }

    @Override
    public PortfolioDTO getPortfolioInfo(String id) {
        MyFundPortfolio myFundPortfolio = getById(id);
        PortfolioDTO portfolioDTO = new PortfolioDTO();
        if (null != myFundPortfolio){
            portfolioDTO.setName(myFundPortfolio.getName());
            portfolioDTO.setMoney(CommonConstant.DECIMAL_FORMAT.format(myFundPortfolio.getMoney()));
            portfolioDTO.setPrincipal(CommonConstant.DECIMAL_FORMAT.format(myFundPortfolio.getPrincipal()));
            portfolioDTO.setProfit(CommonConstant.DECIMAL_FORMAT.format(myFundPortfolio.getProfit()));
            portfolioDTO.setProfitRate(CommonConstant.DECIMAL_FORMAT.format(myFundPortfolio.getProfitRate()));
            portfolioDTO.setUpdateTime(myFundPortfolio.getUpdateTime());
        }
        return portfolioDTO;
    }
}
