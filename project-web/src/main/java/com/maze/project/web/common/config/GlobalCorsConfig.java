package com.maze.project.web.common.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

/**
 * @description: 全局跨域配置
 * @author maze
 * @date 2021/12/18 21:31
 * @version 1.0
 */
@Configuration
public class GlobalCorsConfig {

    @Bean
    public CorsFilter corsFilter(){
        CorsConfiguration corsConfiguration = new CorsConfiguration();
        //放行哪些原始域
        corsConfiguration.addAllowedOriginPattern("*");
        //是否发送 Cookie
        corsConfiguration.setAllowCredentials(true);
        //放行哪些请求方式
        corsConfiguration.addAllowedMethod("*");
        //放行哪些原始请求头部信息
        corsConfiguration.addAllowedHeader("*");
        //暴露哪些头部信息
        corsConfiguration.addExposedHeader("*");
        //添加映射路径
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", corsConfiguration);

        //返回新的CorsFilter
        return new CorsFilter(source);
    }
}
