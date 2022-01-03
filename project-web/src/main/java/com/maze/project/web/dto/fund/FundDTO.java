package com.maze.project.web.dto.fund;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class FundDTO {

    private String code;

    private String name;

    private String worth;

    private String shares;

    private String money;

    private String principal;

    private String profit;

    private String profitRate;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private LocalDateTime createTime;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private LocalDateTime updateTime;
}
