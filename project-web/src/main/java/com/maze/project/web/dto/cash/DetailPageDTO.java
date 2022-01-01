package com.maze.project.web.dto.cash;

import com.maze.project.web.dto.common.BasePageDTO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
public class DetailPageDTO extends BasePageDTO {

    private List<DetailDTO> detailList;
}
