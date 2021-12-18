package com.maze.project.web.common.aspects;

import cn.hutool.json.JSONUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

@Aspect
@Component
@Slf4j
public class WebLogAspect {

    /** controller包下面所有方法打印日志 */
    @Pointcut("execution(public * com.maze.project.web.controller..*.*(..))")
    public void webLog(){}

    @Before("webLog()")
    public void doBefore(JoinPoint joinPoint) {
        //打印请求日志
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        //打印相关参数
        log.info("===================Request Start====================");
        //请求URL
        log.info("URL           :{}", request.getRequestURL().toString());
        //Controller全路径及方法
        log.info("Class Method  :{}.{}", joinPoint.getSignature().getDeclaringTypeName(), joinPoint.getSignature().getName());
        //请求IP
        log.info("IP            :{}", request.getRemoteAddr());
        //请求参数
        log.info("Request Param :{}", JSONUtil.toJsonStr(joinPoint.getArgs()));
        log.info("===================Request End====================");
    }

    @AfterReturning(returning = "o", pointcut = "webLog()")
    public void doAfter(Object o){
        log.info("===================Response Start====================");
        log.info("Response Param :{}", JSONUtil.toJsonStr(o));
        log.info("===================Response End====================");
    }
}
