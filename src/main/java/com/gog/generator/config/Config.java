package com.gog.generator.config;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

/**
 * author: nhc
 * date: 2019/3/4
 */
public class Config {
    /**
     * 模板导出路径
     */
    public static String diskPath;

    /**
     * 数据库连接信息
     */
    public static String URL;
    public static String USER;
    public static String PASSWORD;
    public static String DRIVER;

    /**
     * 模板对应的表
     */
    public static String[] tables;

    /**
     * 是否删除前缀
     */
    public static boolean isDelPrefix = true;

    /**
     * 基础包路径，不同模板会自动在此基础上追加包名
     */
    public static String basePackage;

    /**
     * 模板的公共注释信息，如果为空则取数据库表名
     */
    public static String description = "";
    public static String author;
    public static String date = getDate();

    public static String getDate() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
        return df.format(new Date());
    }


    static {
        try (InputStream stream = Config.class.getClassLoader().getResourceAsStream("config.properties")){
            Properties properties = new Properties();
            properties.load(stream);
            diskPath = properties.getProperty("diskPath");
            URL = properties.getProperty("URL");
            USER = properties.getProperty("USER");
            PASSWORD = properties.getProperty("PASSWORD");
            DRIVER = properties.getProperty("DRIVER");
            tables = properties.getProperty("tables").split(",");
            isDelPrefix = Boolean.parseBoolean(properties.getProperty("isDelPrefix"));
            basePackage = properties.getProperty("basePackage");
            description = properties.getProperty("description");
            author = properties.getProperty("author");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
