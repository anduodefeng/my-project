package com.maze.project.web.common.exception;

import com.maze.project.web.common.util.ExceptionUtil;
import com.maze.project.web.dto.common.BaseDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.ArrayList;
import java.util.List;

@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @ExceptionHandler(GlobalException.class)
    public BaseDTO handGlobalException(Exception e){
        log.error(ExceptionUtil.getMessage(e));
        return BaseDTO.error().message(e.getMessage());
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public BaseDTO handlerValidException(MethodArgumentNotValidException e) {
        log.error(ExceptionUtil.getMessage(e));
        BindingResult result = e.getBindingResult();
        List<String> message = new ArrayList<>();
        // 获取校验结果，遍历获取捕获到的每个校验结果
        result.getFieldErrors().forEach(item ->{
            // 存储得到的校验结果
            message.add(item.getDefaultMessage());
        });
        return BaseDTO.error().message(message.toString());
    }
}
