package com.maze.project.web.common.enums;

public interface PortfolioEnum {

    enum PortfolioTypeEnum implements PortfolioEnum{
        ROBUST(0, "稳健"),
        AGGRESSIVE(1, "积极"),
        FIXED_CASTING(2, "定投");

        private int code;
        private String message;

        PortfolioTypeEnum(int code, String message) {
            this.code = code;
            this.message = message;
        }

        public int getCode() {
            return code;
        }

        public void setCode(int code) {
            this.code = code;
        }

        public String getMessage() {
            return message;
        }

        public void setMessage(String message) {
            this.message = message;
        }
    }
}
