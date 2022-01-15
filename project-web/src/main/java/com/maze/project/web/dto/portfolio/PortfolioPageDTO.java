package com.maze.project.web.dto.portfolio;

import com.maze.project.web.dto.common.BasePageDTO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
public class PortfolioPageDTO extends BasePageDTO {

    List<PortfolioDTO> portfolioList;
}
