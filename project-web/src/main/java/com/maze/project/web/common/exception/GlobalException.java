package com.maze.project.web.common.exception;

import lombok.Data;
import lombok.EqualsAndHashCode;


@Data
@EqualsAndHashCode(callSuper = false)
public class GlobalException extends RuntimeException{

    private String errorMessage;

    private Integer errorCode;

    public GlobalException(String message, String errorMessage) {
        super(message);
        this.errorMessage = errorMessage;
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

