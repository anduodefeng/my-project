package com.maze.project.web.vo.cash;

import com.maze.project.web.vo.common.BasePageVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;

@EqualsAndHashCode(callSuper = true)
@Data
public class DetailPageVO extends BasePageVO {

    @NotBlank(message = "银行名称不能为空")
    private String bankName;

}
