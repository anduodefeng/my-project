package com.maze.project.web.dto.credit_card;

import lombok.Data;

import java.util.List;

@Data
public class CreditChartDTO {

    private List<String> monthList;

    private List<Double> cmbList;

    private List<Double> pabList;
}
