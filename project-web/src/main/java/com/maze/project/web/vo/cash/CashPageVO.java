package com.maze.project.web.vo.cash;

import com.maze.project.web.vo.common.BasePageVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class CashPageVO extends BasePageVO {

    private String bankName;

}
