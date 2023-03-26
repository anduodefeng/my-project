package com.maze.project.web.dto.common;

import lombok.Data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Data
public class ManyLineDTO {

    private String name;
    private String type = "line";
    private String symbol = "none";
    private List<Double> data;
    private Map<String, String> emphasis = new HashMap<>(){{
        put("focus", "self");
    }};
    private Map<String, Integer> lineStyle = new HashMap<>(){{
        put("width", 1);
    }};
}
