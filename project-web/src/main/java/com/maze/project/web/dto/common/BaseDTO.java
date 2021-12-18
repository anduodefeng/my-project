package com.maze.project.web.dto.common;

import com.maze.project.web.common.enums.ResponseCodeEnum;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class BaseDTO {

    private int code;

    private String message;

    private Object data;

    public BaseDTO() {
    }

    public BaseDTO(int code, String message, Object data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public static BaseDTO ok(){
        return new BaseDTO(ResponseCodeEnum.SUCCESS.getCode(), ResponseCodeEnum.SUCCESS.getDescription(), null);
    }

    public static BaseDTO error(){
        return new BaseDTO(ResponseCodeEnum.ERROR.getCode(), ResponseCodeEnum.ERROR.getDescription(),   null);
    }

    public BaseDTO code(Integer code) {
        this.setCode(code);
        return this;
    }

    public BaseDTO message(String message) {
        this.setMessage(message);
        return this;
    }

    public BaseDTO data(Object obj) {
        this.data = obj;
        return this;
    }


}
