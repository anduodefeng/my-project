package com.maze.project.projectweb.common.enums;

public enum ResponseCodeEnum {

    SUCCESS(1000, "成功"),
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
