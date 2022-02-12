package com.maze.project.web.dto.fund;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class FundDetailDTO {

    private String code;

    private String name;

    private String newAssets;

    private String profit;

    private String profitRate;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private LocalDateTime createTime;
}
