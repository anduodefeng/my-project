package com.maze.project.web.vo.portfolio;

import com.maze.project.web.vo.common.BasePageVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

@EqualsAndHashCode(callSuper = true)
@Data
public class PortfolioPageVO extends BasePageVO {

    @NotNull(message = "accountId不能为空")
    private Integer accountId;
}
