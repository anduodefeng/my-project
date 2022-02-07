package com.maze.project.web.dto.credit_card;

import lombok.Data;

@Data
public class CreditCardDTO {

    /** 银行名称 */
    private String bankName;
    /** 总额度 */
    private String limit;
    /** 剩余额度 */
    private String customAmount;
    /** 账单日 */
    private String billDate;
    /** 还款日 */
    private String repayDate;
    /** 距离还款日的天数 */
    private String leftBillDay;
}
