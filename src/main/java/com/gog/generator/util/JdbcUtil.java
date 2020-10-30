package com.gog.generator.util;

import com.gog.generator.config.Config;
import com.gog.generator.model.ColumnClass;
import org.apache.commons.lang3.StringUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class JdbcUtil {

    private static Connection connection = null;

    /**
     * 数据库连接
     *
     * @return
     * @throws Exception
     */
    public Connection getConnection() throws Exception {
        if (connection == null) {
            Class.forName(Config.DRIVER);
            connection = DriverManager.getConnection(Config.URL, Config.USER, Config.PASSWORD);
        }
        return connection;
    }

    /**
     * 获取表的列信息
     *
     * @return
     * @throws Exception
     */
    public static Map<String, Object> getColumns(String tableName) throws Exception {
        Connection connection = new JdbcUtil().getConnection();
        DatabaseMetaData databaseMetaData = connection.getMetaData();
        //列信息
        ResultSet columnResultSet = databaseMetaData.getColumns(null, "%", tableName, "%");
        ResultSet indexResultSet = databaseMetaData.getIndexInfo(null, null, tableName, true, false);
        List<String> uniqueList = new ArrayList<String>();
        //开始遍历
        Map<String, Object> dataMap = new HashMap<String, Object>();
        String dbName = null;
        String tableNameCn=null;
        try (Statement stmt = connection.createStatement()){
            String tableSql = "select TABLE_COMMENT from information_schema.tables where table_name='" + tableName + "'";
            ResultSet tablesSet =stmt.executeQuery(tableSql);
            while (tablesSet.next()){
                tableNameCn=tablesSet.getString("TABLE_COMMENT");
            }
        }

        while (indexResultSet.next()) {
            dbName=indexResultSet.getString(1);
            if (indexResultSet.getString("COLUMN_NAME").equals("id")) {
                continue;
            }
            uniqueList.add(indexResultSet.getString("COLUMN_NAME"));
        }

        List<ColumnClass> columnClassList = new ArrayList<ColumnClass>();
        while (columnResultSet.next()) {
            //id字段略过
            if (columnResultSet.getString("COLUMN_NAME").equals("id") ||
                    columnResultSet.getString("COLUMN_NAME").equals("create_time") ||
                    columnResultSet.getString("COLUMN_NAME").equals("update_time") ||
                    columnResultSet.getString("COLUMN_NAME").equals("deleted")){
                continue;
            }
            ColumnClass columnClass = new ColumnClass();
            //获取字段名称
            columnClass.setColumnName(columnResultSet.getString("COLUMN_NAME"));
            //获取字段类型
            columnClass.setColumnType(columnResultSet.getString("TYPE_NAME"));
            //转换字段名称，如 sys_name 变成 SysName
            columnClass.setChangeColumnName(CommonUtil.replaceUnderLineAndUpperCase(columnResultSet.getString("COLUMN_NAME")));
            //字段在数据库的注释
            columnClass.setColumnComment(columnResultSet.getString("REMARKS"));
            //可否为null
            columnClass.setNullable(columnResultSet.getString("NULLABLE").equals("1") ? Boolean.TRUE : Boolean.FALSE);
            columnClass.setColumnSize(columnResultSet.getString("COLUMN_SIZE"));
            //字符长度
            columnClass.setCharOctetLength(columnResultSet.getString("CHAR_OCTET_LENGTH"));
            //字符长度
            columnClass.setCharOctetLengthInt(columnResultSet.getInt("CHAR_OCTET_LENGTH"));
            columnClassList.add(columnClass);
        }

        dataMap.put("model_column", columnClassList);
        dataMap.put("unique_column", uniqueList);
        dataMap.put("tableName", tableName);
        //Config中没有设置表名，则取数据库中的注释
        dataMap.put("tableNameCn",  StringUtils.isEmpty(Config.description)?tableNameCn:Config.description);
        String changeTableName = CommonUtil.replaceUnderLineAndUpperCase(tableName, Config.isDelPrefix);
        dataMap.put("changeTableName", changeTableName);
        dataMap.put("lowerCaseFirst",CommonUtil.toLowerCaseFirstOne(changeTableName));
        return dataMap;
    }

}
