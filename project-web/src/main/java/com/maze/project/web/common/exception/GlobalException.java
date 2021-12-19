package com.maze.project.web.common.exception;

import com.maze.project.web.common.enums.ResponseCodeEnum;
import lombok.Data;
import lombok.EqualsAndHashCode;


@Data
@EqualsAndHashCode(callSuper = false)
public class GlobalException extends RuntimeException{

    private String errorMessage;

    private Integer errorCode;

    public GlobalException(String message) {
        super(message);
    }

    public GlobalException(ResponseCodeEnum responseCodeEnum) {
        super(responseCodeEnum.getDescription());
        this.errorCode = responseCodeEnum.getCode();
        this.errorMessage = responseCodeEnum.getDescription();
    }

    public GlobalException(String message, String errorMessage, Integer errorCode) {
        super(message);
        this.errorMessage = errorMessage;
        this.errorCode = errorCode;
    }

    public GlobalException(String errorMessage, Throwable cause) {
        super(errorMessage, cause);
        this.errorMessage = errorMessage;
    }

    public GlobalException(String errorMessage, Integer errorCode, Throwable e) {
        super(errorMessage, e);
        this.errorMessage = errorMessage;
        this.errorCode = errorCode;
    }


}

