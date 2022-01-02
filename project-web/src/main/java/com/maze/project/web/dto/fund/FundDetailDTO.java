package com.maze.project.web.dto.fund;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class FundDetailDTO {

    private String code;

    private String name;

    private String worth;

    private String shares;

    private String changeMoney;

    private String type;

    private String remark;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private LocalDateTime createTime;
}
