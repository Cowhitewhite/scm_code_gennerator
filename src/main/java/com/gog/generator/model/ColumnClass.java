package com.gog.generator.model;

public class ColumnClass {

    /**
     * 数据库字段名称
     **/
    private String columnName;
    /**
     * 数据库字段类型
     **/
    private String columnType;
    /**
     * 数据库字段首字母小写且去掉下划线字符串
     **/
    private String changeColumnName;
    /**
     * 数据库字段注释
     **/
    private String columnComment;

    private Boolean nullable;

    private String columnSize;
    // 对于 char 类型，该长度是列中的最大字节数
    private String charOctetLength;
    // 对于 char 类型，该长度是列中的最大字节数
    private Integer charOctetLengthInt;

    public String getColumnComment() {
        return columnComment;
    }

    public void setColumnComment(String columnComment) {
        this.columnComment = columnComment;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public String getColumnType() {
        return columnType;
    }

    public void setColumnType(String columnType) {
        this.columnType = columnType;
    }

    public String getChangeColumnName() {
        return changeColumnName;
    }

    public void setChangeColumnName(String changeColumnName) {
        this.changeColumnName = changeColumnName;
    }

    public Boolean getNullable() {
        return nullable;
    }

    public void setNullable(Boolean nullable) {
        this.nullable = nullable;
    }

    public String getColumnSize() {
        return columnSize;
    }

    public void setColumnSize(String columnSize) {
        this.columnSize = columnSize;
    }

    public String getCharOctetLength() {
        return charOctetLength;
    }

    public void setCharOctetLength(String charOctetLength) {
        this.charOctetLength = charOctetLength;
    }

    public Integer getCharOctetLengthInt() {
        return charOctetLengthInt;
    }

    public void setCharOctetLengthInt(Integer charOctetLengthInt) {
        this.charOctetLengthInt = charOctetLengthInt;
    }
}
