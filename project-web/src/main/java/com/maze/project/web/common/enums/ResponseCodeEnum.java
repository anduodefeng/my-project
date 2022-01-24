package com.maze.project.web.common.enums;

public enum ResponseCodeEnum {

    SUCCESS(1000, "成功"),
    LOGIN_ERROR(2000, "用户名&密码输出错误"),
    FIND_CASH_PAGE_ERROR(2001, "分页查询现金异常"),
    ADD_CASH_DETAIL_ERROR(2002, "增加现金明细异常"),
    UPDATE_CASH_ERROR(2003, "更新现金余额异常"),
    RECORD_CASH_CHANGE_ERROR(2004, "记录现金明细异常"),
    GET_CASH_BANK_NAMES_ERROR(2005, "查询现金银行卡异常"),
    GET_FUND_PAGE_ERROR(2006, "分页查询基金异常"),
    UPDATE_FUND_ERROR(2007, "更新基金异常"),
    UPDATE_FUND_DETAIL_ERROOR(2008, "更新基金详情异常"),
    GET_FUNDS_INFO_ERROR(2009, "查询基金分类信息异常"),
    GET_FUND_INFO_ERROR(2009, "查询单个基金信息异常"),
    RECORD_FUND_CHANGE_EXCEPTION(2010, "记录基金明细异常"),
    GET_PORTFOLIO_PAGE_ERROR(2011, "分页查询投顾组合异常"),
    GET_PORTFOLIOS_INFO_ERROR(2012, "查询组合分类异常"),
    GET_PORTFOLIO_INFO_ERROR(2012, "查询单个组合信息异常"),
    GET_PORTFOLIO_CHANGE_ERROR(2013, "查询组合变动异常"),
    FIND_CASH_CHART_ERROR(2014, "查询现金图表异常"),
    FIND_FUND_CHART_ERROR(2015, "查询基金图表异常"),
    FIND_PORTFOLIO_CHART_ERROR(2016, "查询基金组合图表异常"),
    GET_CREDIT_CARD_PAGE_ERROR(2017, "分页查询信用卡信息异常"),
    RECORD_CREDIT_CARD_CHANGE_ERROR(2018, "记录现金明细异常"),
    GET_CREDIT_CARD_BANK_NAME_ERROR(2019, "查询信用卡银行名称"),
    ADD_CARDIT_CARD_DETAIL_ERROR(2020, "增加信用卡明细异常"),
    UPDATE_CREDIT_CARD_ERROR(2021, "更新信用卡额度异常"),
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
