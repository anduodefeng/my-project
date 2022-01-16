package com.maze.project.web.common.enums;

public interface CashEnum {

    enum CashPieColorEnum implements CashEnum{
        CMB("#ff8c94", "招商银行"),
        ABC("#10ddc2", "农业银行"),
        CCB("#0245a3", "建设银行"),
        BOB("#f95959", "北京银行"),
        PABC("#ffaa64", "平安银行"),
        ICBC("#e84a5f", "工商银行");

        private String color;
        private String bankName;

        CashPieColorEnum(String color, String bankName) {
            this.color = color;
            this.bankName = bankName;
        }

        public static String getColor(String bankName){
            for (CashPieColorEnum cashPieColorEnum : CashPieColorEnum.values()){
                if (cashPieColorEnum.bankName.equals(bankName)){
                    return cashPieColorEnum.color;
                }
            }
            return "#282828";
        }
    }
}
