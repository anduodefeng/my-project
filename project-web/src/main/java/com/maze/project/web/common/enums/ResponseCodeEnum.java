package com.maze.project.web.common.enums;

public enum ResponseCodeEnum {

    SUCCESS(1000, "成功"),
    LOGIN_ERROR(2000, "用户名&密码输出错误"),
    FIND_CASH_PAGE_ERROR(2001, "分页查询现金异常"),
    ADD_CASH_DETAIL_ERROR(2002, "增加现金明细失败"),
    UPDATE_CASH_ERROR(2003, "更新现金余额失败"),
    RECORD_CASH_CHANGE_EXCEPTION(2004, "记录现金明细异常"),
    ERROR(9999, "系统错误");

    //2开头的，系统错误
    //3开头的，业务逻辑错误

    private int code;
    private String description;

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

    ResponseCodeEnum(int code, String description) {
        this.code = code;
        this.description = description;
    }
}
