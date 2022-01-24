package com.maze.project.web.common.constant;

import cn.hutool.core.util.RandomUtil;

import java.text.DecimalFormat;

public class CommonConstant {
    /** 头像路径 */
    public static final String AVATAR = "http://localhost:8000/my-project/api/avatar.jpeg";
    /** 小数格式化 */
    public static final DecimalFormat DECIMAL_FORMAT = new DecimalFormat("0.00");

    public static final String[] FUND_CHART_COLOR = new String[]{
        "","#61c0bf", "#bbded6", "#fae3d9", "#ffb6b9",
        "#a5dee5","#e0f9b5","#fefdca","#ffcfdf",
        "#ff165d","#ff9a00","#f6f7d7","#3ec1d3",
        "#edb1f1","#d59bf6","#9896f1","#8ef6e4",
        "#cabbe9","#ffcef3","#fdfdfd","#a1eafb",
        "#e8ffe8","#a6fff2","#74f9ff","#00e0ff",
        "#ff9de2","#8c82fc","#b693fe","#7effdb",
        "#9df3c4","#1fab89","#62d2a2","#d7fbe8",
        "#fbafaf","#f2c6b4","#f3e8cb","#99e1e5",
        "#ffc93c","#ff6f3c","#ff9a3c","#155263",
        "#bfcfff","#c8e7ed","#ffffc2","#ffa5a5",
        "#f76b8a","#c8e7ed","#ffa5a5","#ffdcf5",
        "#1891ac","#66c6ba","#a82ffc","#d988bc"
    };

    public static String randomColor(){
        int index = RandomUtil.randomInt(52);
        return CommonConstant.FUND_CHART_COLOR[index];
    }
}
