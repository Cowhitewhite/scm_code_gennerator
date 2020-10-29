package com.gog.generator;

import com.gog.generator.config.Config;
import com.gog.generator.util.FreeMarkerUtil;
import com.gog.generator.util.JdbcUtil;

import java.util.Map;

public class CodeGenerateMain {

    public static void main(String[] args) throws Exception {
        CodeGenerateMain codeGenerateUtils = new CodeGenerateMain();
        codeGenerateUtils.generate();
    }

    public void generate() throws Exception {
        try {
            for (int i = 0; i < Config.tables.length; i++) {
                Map<String, Object> dataMap = JdbcUtil.getColumns(Config.tables[i]);
                //生成Model文件
                FreeMarkerUtil.generateModelFile(dataMap);
                //生成Req文件
                FreeMarkerUtil.generateQueryVoFile(dataMap);
                //生成Dao文件
                FreeMarkerUtil.generateDaoFile(dataMap);
                //生成Service文件
                FreeMarkerUtil.generateServiceFile(dataMap);
                //生成impl文件
                FreeMarkerUtil.generateServiceImplFile(dataMap);
                //生成controller文件
                FreeMarkerUtil.generateControllerFile(dataMap);
                //生成mapper文件
                FreeMarkerUtil.generateMapperFile(dataMap);
            }
            System.out.println("生成成功!");
        } catch (Exception e) {
            System.out.println("生成失败!");
            throw new RuntimeException(e);
        }
    }
}
