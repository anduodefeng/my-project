package com.maze.project.web.common.enums;

public interface FundEnum {

    enum FundTypeEnum implements FundEnum{
        INDEX_FUND(0, "指数基金"),
        ACTIVE_FUND(1, "主动基金"),
        MONETARY_FUND(2, "货币基金"),
        ETF_FUND(3, "ETF基金");

        private int code;
        private String description;

        FundTypeEnum(int code, String description) {
            this.code = code;
            this.description = description;
        }

        public int getCode() {
            return code;
        }

        public void setCode(int code) {
            this.code = code;
        }

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }
    }

    enum FundChangeEnum implements FundEnum{
        COST_CHANGE(0, "本金变动（转入或转出）"),
        AMOUNT_UPDATE(1, "日常更新");

        private int code;
        private String description;

        FundChangeEnum(int code, String description) {
            this.code = code;
            this.description = description;
        }

        public int getCode() {
            return code;
        }

        public void setCode(int code) {
            this.code = code;
        }

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }
    }
}
