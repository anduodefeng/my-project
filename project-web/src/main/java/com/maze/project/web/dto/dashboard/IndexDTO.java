package com.maze.project.web.dto.dashboard;

import com.maze.project.web.dto.common.ManyLineDTO;
import com.maze.project.web.dto.common.PieDTO;
import lombok.Data;

import java.util.List;

@Data
public class IndexDTO {

    private double totalAssets;

    private double totalProfit;

    private double yesterdayProfit;
    //饼图用数据
    List<PieDTO> pieList;

    //总资产每日折线图
    List<String> dateList;
    List<Double> moneyList;
    List<Double> principalList;
    //指数基金收益率图
    private List<String> indexFundNameList;
    private List<ManyLineDTO> indexFundLine;
    //主动基金收益率图
    private List<String> activeFundNameList;
    private List<ManyLineDTO> activeFundLine;
    //稳健组合收益率图
    private List<String> robustPortfolioNameList;
    private List<ManyLineDTO> robustPortfolioLine;
    //积极组合收益率图
    private List<String> aggressivePortfolioNameList;
    private List<ManyLineDTO> aggressivePortfolioLine;
}
