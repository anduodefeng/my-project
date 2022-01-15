package com.maze.project.web.vo.portfolio;

import com.maze.project.web.vo.common.BasePageVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;

@EqualsAndHashCode(callSuper = true)
@Data
public class PortfolioDetailPageVO extends BasePageVO {

    @NotBlank(message = "组合id不能为空")
    private String id;
}
