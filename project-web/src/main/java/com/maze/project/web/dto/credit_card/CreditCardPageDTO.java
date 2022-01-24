package com.maze.project.web.dto.credit_card;

import com.maze.project.web.dto.common.BasePageDTO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
public class CreditCardPageDTO extends BasePageDTO {

    private List<CreditCardDTO> creditCardList;
}
