package com.maze.project.web.common.util;

import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;

@Slf4j
public class ExceptionUtil {

    public static String getMessage(Exception e) {
        String message = null;
        try(StringWriter sw = new StringWriter(); PrintWriter pw = new PrintWriter(sw)) {
            e.printStackTrace(pw);
            pw.flush();
            sw.flush();
            message = sw.toString();
        }catch (IOException io) {
            io.printStackTrace();
            log.error(io.getMessage());
        }
        return message;
    }

}
