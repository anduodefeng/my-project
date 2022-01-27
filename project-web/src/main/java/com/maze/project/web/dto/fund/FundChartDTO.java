package com.maze.project.web.dto.fund;

import com.maze.project.web.dto.common.PieDTO;
import lombok.Data;

import java.util.List;

@Data
public class FundChartDTO {

    //饼图用数据
    List<PieDTO> pieList;

    //基金收益率数据
    List<String> fundNameList;
    //基金总金额
    List<String> dateList;

    //总金额
    List<Double> totalAmount;
}
