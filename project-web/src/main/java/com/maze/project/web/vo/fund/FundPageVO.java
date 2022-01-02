package com.maze.project.web.vo.fund;

import com.maze.project.web.vo.common.BasePageVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;

@EqualsAndHashCode(callSuper = true)
@Data
public class FundPageVO extends BasePageVO {

    @NotBlank(message = "基金类型不能为空")
    private String type;
}
