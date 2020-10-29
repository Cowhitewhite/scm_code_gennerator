package com.gog.generator.util;

import com.gog.generator.config.Config;

import java.io.*;
import java.util.Map;

public class FreeMarkerUtil {

    private static void generateFileByTemplate(final String templateName, File file, Map<String, Object> dataMap) throws Exception {
        dataMap.put("basePackage", Config.basePackage);
        dataMap.put("author", Config.author);
        dataMap.put("date", Config.date);
        dataMap.put("description", Config.description);

        File dir = new File(file.getParent());
        if (!dir.exists()) {
            dir.mkdirs();
        }
        Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "utf-8"), 10240);
        FreeMarkerTemplateUtils.getTemplate(templateName).process(dataMap, out);
    }

    /**
     * 生成model
     *
     * @param dataMap
     * @throws Exception
     */
    public static void generateModelFile(Map<String, Object> dataMap) throws Exception {
        final String path = Config.diskPath + "/entity/" + dataMap.get("changeTableName") + ".java";
        generateFileByTemplate("Model.ftl", new File(path), dataMap);
    }

    /**
     * 生成Dao
     *
     * @throws Exception
     */
    public static void generateDaoFile(Map<String, Object> dataMap) throws Exception {
        final String path = Config.diskPath + "/dao/" + dataMap.get("changeTableName") + "Dao.java";
        generateFileByTemplate("Dao.ftl", new File(path), dataMap);
    }

    /**
     * 生成Service
     *
     * @throws Exception
     */
    public static void generateServiceFile(Map<String, Object> dataMap) throws Exception {
        final String path = Config.diskPath + "/service/" + dataMap.get("changeTableName") + "Service.java";
        generateFileByTemplate("Service.ftl", new File(path), dataMap);
    }

    /**
     * 生成ServiceImpl
     *
     * @throws Exception
     */
    public static void generateServiceImplFile(Map<String, Object> dataMap) throws Exception {
        final String path = Config.diskPath + "/service/impl/" + dataMap.get("changeTableName") + "Service.java";
        generateFileByTemplate("ServiceImpl.ftl", new File(path), dataMap);

    }

    /**
     * 生成Controller
     *
     * @throws Exception
     */
    public static void generateControllerFile(Map<String, Object> dataMap) throws Exception {
        final String path = Config.diskPath + "/controller/" + dataMap.get("changeTableName") + "Controller.java";
        generateFileByTemplate("Controller.ftl", new File(path), dataMap);
    }

    /**
     * 生成Req
     *
     * @param dataMap
     * @throws Exception
     */
    public static void generateQueryVoFile(Map<String, Object> dataMap) throws Exception {
        final String path = Config.diskPath + "/vo/req/" + dataMap.get("changeTableName") + "Req.java";
        generateFileByTemplate("Req.ftl", new File(path), dataMap);
    }

    /**
     * 生成mapper文件
     * @param dataMap
     * @throws Exception
     */
    public static void generateMapperFile(Map<String, Object> dataMap) throws Exception{
        final String path = Config.diskPath + "/mapper/" + dataMap.get("changeTableName") + "Mapper.xml";
        generateFileByTemplate("Mapper.ftl", new File(path), dataMap);
    }
}
