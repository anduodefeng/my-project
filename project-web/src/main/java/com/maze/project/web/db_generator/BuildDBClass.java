package com.maze.project.web.db_generator;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;

import java.util.Collections;


public class BuildDBClass {

    private static final String CODE_DIR = "/Users/maze/Project/my-project/idea-workspace/my-project/project-web/src/main/java";
    private static final String RESOURCES = "/Users/maze/Project/my-project/idea-workspace/my-project/project-web/src/main/resources/mapper";

    public static void main(String[] args) {

        String[] tables = new String[]{
                "my_user",
                "my_roles",
                "my_user_roles"
        };

        FastAutoGenerator.create(
                "jdbc:mysql://localhost:3306/my_project?useUnicode=true&characterEncoding=utf8&autoReconnect=true&useSSL=false&serverTimezone=GMT%2B8", "root", "3006265598")
                .globalConfig(builder -> builder.author("maze").fileOverride().outputDir(CODE_DIR))
                .packageConfig(builder -> builder.parent("com.maze.project").moduleName("web")
                        .entity("entity").service("service").serviceImpl("service.impl")
                        .mapper("mapper").xml("mapper").pathInfo(Collections.singletonMap(OutputFile.mapperXml, RESOURCES)))
                .strategyConfig(builder -> builder.addInclude(tables)
                        .serviceBuilder().formatServiceFileName("%sService").formatServiceImplFileName("%sServiceImpl")
                        .entityBuilder().enableLombok().enableTableFieldAnnotation()
                        .mapperBuilder().superClass(BaseMapper.class).formatMapperFileName("%sMapper").enableMapperAnnotation().formatXmlFileName("%sMapper"))
                .templateEngine(new FreemarkerTemplateEngine()).execute();
    }
}
