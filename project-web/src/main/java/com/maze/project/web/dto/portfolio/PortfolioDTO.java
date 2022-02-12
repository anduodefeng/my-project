package com.maze.project.web.dto.portfolio;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class PortfolioDTO {

    private String id;

    private String name;

    private String money;

    private String principal;

    private String profit;

    private String profitRate;

//    private String type;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private LocalDateTime createTime;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private LocalDateTime updateTime;
}
