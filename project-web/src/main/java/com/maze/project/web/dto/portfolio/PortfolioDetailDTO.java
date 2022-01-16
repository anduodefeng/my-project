package com.maze.project.web.dto.portfolio;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class PortfolioDetailDTO {

    private String name;

    private String changeMoney;

    private String changeType;

    private String profitRate;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private LocalDateTime createTime;
}
