package com.maze.project.web.controller;

import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.map.MapUtil;
import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.maze.project.web.common.constant.CommonConstant;
import com.maze.project.web.dto.common.BaseDTO;
import com.maze.project.web.dto.data.DataDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/data")
@Slf4j
public class DataController {

    @RequestMapping("/get/{fundCode}/{type}")
    public BaseDTO getData(@PathVariable String fundCode, @PathVariable String type){
        String method = "fund_open_fund_info_em";
        String url = MessageFormat.format(CommonConstant.PREFIX_URL, method);
        Map<String, Object> map = MapUtil.newHashMap();
        map.put("fund", fundCode);
        map.put("indicator", "单位净值走势");
        String result = HttpUtil.get(url, map);
        DataDTO dataDTO = handleData(result, type);
        addPercent(dataDTO);
        return BaseDTO.ok().data(dataDTO);
    }

    /**
     * 获取指数字典 后面不用了
     * @return 指数字典excel
     */
    @RequestMapping("/getIndex")
    public BaseDTO getIndexData(){
        // stock_zh_index_daily  指数历史数据 symbol： 参数
        String method = "stock_zh_index_spot";
        String url = MessageFormat.format(CommonConstant.PREFIX_URL, method);
        String result = HttpUtil.get(url);
        JSONArray jsonArray = JSONUtil.parseArray(result);
        List<Map<String, String>> list = new ArrayList<>();
        jsonArray.forEach(obj -> {
            Map<String, String> map = MapUtil.newHashMap();
            String code = JSONUtil.parseObj(obj).getStr("代码");
            String name = JSONUtil.parseObj(obj).getStr("名称");
            map.put("基金编码", code);
            map.put("基金名称", name);
            list.add(map);
        });

        ExcelWriter writer = ExcelUtil.getWriter("/Users/maze/Project/my-project/idea-workspace/my-project/fund.xlsx");
        writer.write(list, true);
        writer.close();
        return BaseDTO.ok();
    }



    private DataDTO handleData(String result, String type){
        DateTime before = handleDate(type);
        List<String> dateList = new ArrayList<>();
        List<Double> worthList = new ArrayList<>();
        JSONArray jsonArray = JSONUtil.parseArray(result);
        for (Object obj : jsonArray){
            JSONObject jsonObject = JSONUtil.parseObj(obj);
            String date = jsonObject.get("净值日期").toString();
            Double worth = jsonObject.getDouble("单位净值");
            date = date.split("T")[0];
            //只要3年之内的数据
            DateTime dateTime = DateUtil.parse(date, DatePattern.NORM_DATE_PATTERN);
            if (dateTime.before(before)) continue;
            dateList.add(date);
            worthList.add(worth);
        }
        DataDTO dataDTO = new DataDTO();
        dataDTO.setDate(dateList);
        dataDTO.setWorth(worthList);
        return dataDTO;
    }

    private void addPercent(DataDTO dataDTO){
        List<Double> worthList = dataDTO.getWorth();
        Double max = worthList.stream().max(Double::compareTo).get();
        double min = worthList.stream().min(Double::compareTo).get();
        BigDecimal maxDecimal = BigDecimal.valueOf(max);
        BigDecimal minDecimal = BigDecimal.valueOf(min);
        BigDecimal diff = maxDecimal.subtract(minDecimal);
        BigDecimal percent = diff.divide(BigDecimal.valueOf(10), 4, RoundingMode.HALF_UP);

        List<Double> percent10 = new ArrayList<>();
        List<Double> percent20 = new ArrayList<>();
        List<Double> percent30 = new ArrayList<>();
        List<Double> percent40 = new ArrayList<>();
        List<Double> percent50 = new ArrayList<>();
        List<Double> percent60 = new ArrayList<>();
        List<Double> percent70 = new ArrayList<>();
        List<Double> percent80 = new ArrayList<>();
        List<Double> percent90 = new ArrayList<>();

        for (int i=0;i<worthList.size();i++){
            Double percent_10 = BigDecimal.valueOf(min).add(percent).doubleValue();
            Double percent_20 = BigDecimal.valueOf(min).add(percent.multiply(BigDecimal.valueOf(2))).doubleValue();
            Double percent_30 = BigDecimal.valueOf(min).add(percent.multiply(BigDecimal.valueOf(3))).doubleValue();
            Double percent_40 = BigDecimal.valueOf(min).add(percent.multiply(BigDecimal.valueOf(4))).doubleValue();
            Double percent_50 = BigDecimal.valueOf(min).add(percent.multiply(BigDecimal.valueOf(5))).doubleValue();
            Double percent_60 = BigDecimal.valueOf(min).add(percent.multiply(BigDecimal.valueOf(6))).doubleValue();
            Double percent_70 = BigDecimal.valueOf(min).add(percent.multiply(BigDecimal.valueOf(7))).doubleValue();
            Double percent_80 = BigDecimal.valueOf(min).add(percent.multiply(BigDecimal.valueOf(8))).doubleValue();
            Double percent_90 = BigDecimal.valueOf(min).add(percent.multiply(BigDecimal.valueOf(9))).doubleValue();

            percent10.add(percent_10);
            percent20.add(percent_20);
            percent30.add(percent_30);
            percent40.add(percent_40);
            percent50.add(percent_50);
            percent60.add(percent_60);
            percent70.add(percent_70);
            percent80.add(percent_80);
            percent90.add(percent_90);
        }

        dataDTO.setPercent10(percent10);
        dataDTO.setPercent20(percent20);
        dataDTO.setPercent30(percent30);
        dataDTO.setPercent40(percent40);
        dataDTO.setPercent50(percent50);
        dataDTO.setPercent60(percent60);
        dataDTO.setPercent70(percent70);
        dataDTO.setPercent80(percent80);
        dataDTO.setPercent90(percent90);
    }

    private DateTime handleDate(String type){
        DateTime now = DateTime.now().setField(DateField.HOUR, 0).setField(DateField.MINUTE, 0).setField(DateField.SECOND, 0);
        DateTime dateTime = switch (type) {
            case "0" -> now.offset(DateField.MONTH, -1);
            case "1" -> now.offset(DateField.MONTH, -3);
            case "2" -> now.offset(DateField.MONTH, -6);
            case "3" -> now.offset(DateField.YEAR, -1);
            case "4" -> now.offset(DateField.YEAR, -2);
            case "5" -> now.offset(DateField.YEAR, -3);
            default -> now;
        };
        return dateTime;
    }

}
