package com.maze.project.web.dto.fund;

import com.maze.project.web.dto.common.BasePageDTO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
public class FundDetailPageDTO extends BasePageDTO {

    List<FundDetailDTO> fundDetailList;
}
