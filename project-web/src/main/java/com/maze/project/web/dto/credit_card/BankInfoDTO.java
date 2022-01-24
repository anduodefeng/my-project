package com.maze.project.web.dto.credit_card;

import lombok.Data;

@Data
public class BankInfoDTO {

    private String bankName;
    private String limit;
    private String billDay;
    private String repayDay;
}
