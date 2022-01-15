package com.maze.project.web.common.enums;

public enum ResponseCodeEnum {

    SUCCESS(1000, "成功"),
    LOGIN_ERROR(2000, "用户名&密码输出错误"),
    FIND_CASH_PAGE_ERROR(2001, "分页查询现金失败"),
    ADD_CASH_DETAIL_ERROR(2002, "增加现金明细失败"),
    UPDATE_CASH_ERROR(2003, "更新现金余额失败"),
    RECORD_CASH_CHANGE_EXCEPTION(2004, "记录现金明细失败"),
    GET_CASH_BANK_NAMES_ERROR(2005, "查询现金银行卡失败"),
    GET_FUND_PAGE_ERROR(2006, "分页查询基金失败"),
    UPDATE_FUND_ERROR(2007, "更新基金失败"),
    UPDATE_FUND_DETAIL_ERROOR(2008, "更新基金详情失败"),
    GET_FUNDS_INFO_ERROR(2009, "查询基金分类信息失败"),
    GET_FUND_INFO_ERROR(2009, "查询单个基金信息失败"),
    RECORD_FUND_CHANGE_EXCEPTION(2010, "记录基金明细失败"),
    GET_PORTFOLIO_PAGE_ERROR(2011, "分页查询投顾组合失败"),
    GET_PORTFOLIOS_INFO_ERROR(2012, "查询组合分类异常"),
    GET_PORTFOLIO_INFO_ERROR(2012, "查询单个组合信息异常"),
    GET_PORTFOLIO_CHANGE_ERROR(2013, "查询组合变动异常"),
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
