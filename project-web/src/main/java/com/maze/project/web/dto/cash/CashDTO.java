package com.maze.project.web.dto.cash;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class CashDTO {

    /** 银行名称 */
    private String bankName;
    /** 余额 */
    private String amount;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime latestTime;
}
