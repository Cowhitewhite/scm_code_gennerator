<#assign a = "#"/>
<#assign b = "{"/>
<#assign c = "}"/>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="${basePackage}.dao.${changeTableName}Dao">

    <!-- 可根据自己的需求，是否要使用 -->
    <resultMap type="${basePackage}.entity.${changeTableName}" id="${changeTableName}Map">
        <result property="id" column="id"/>
        <#if model_column?exists>
            <#list model_column as model>
        <result property="${model.changeColumnName?uncap_first}" column="${model.columnName}">
            </#list>
        </#if>
        <result property="deleted" column="delete"/>
        <result property="tenantCode" column="tenant_code"/>
        <result property="createTime" column="create_time"/>
        <result property="updateTime" column="update_time"/>
    </resultMap>

    <select id="getList" resultType="${basePackage}.entity.${changeTableName}">
        select
          t.id,
          <#if model_column?exists>
            <#list model_column as model>
          t.${model.columnName} as ${model.changeColumnName?uncap_first}
            </#list>
          </#if>
          t.deleted,
          t.create_time as createTime,
          t.update_time as updateTime
        from
          ${tableName} t
        where
          t.deleted = 0
        <#if model_column?exists>
            <#list model_column as model>
        <if test="${model.changeColumnName?uncap_first} != null and ${model.changeColumnName?uncap_first} != ''">
            and ${model.columnName} = ${a + b +model.changeColumnName?uncap_first + c}
        </if>
            </#list>
        </#if>
        order by t.create_time desc
    </select>

    <select id="info" resultType="${basePackage}.entity.${changeTableName}">
        select
          t.id,
        <#if model_column?exists>
            <#list model_column as model>
          t.${model.columnName} as ${model.changeColumnName?uncap_first}
            </#list>
        </#if>
          t.deleted,
          t.create_time as createTime,
          t.update_time as updateTime
        from
          ${tableName} t
        where
          t.deleted = 0
        and t.id = ${a + b + "id" + c}
    </select>

    <select id="findByIds" resultType="${basePackage}.entity.${changeTableName}">
        select
          t.id,
        <#if model_column?exists>
            <#list model_column as model>
          t.${model.columnName} as ${model.changeColumnName?uncap_first}
            </#list>
        </#if>
          t.deleted,
          t.create_time as createTime,
          t.update_time as updateTime,
        from
          ${tableName} t
        where
          t.deleted = 0
        and t.id in
        <foreach collection="ids" item="item" open="(" separator=","  close=")">
            ${a + b + "item" + c}
        </foreach>
    </select>

    <insert id="save" useGeneratedKeys="true" keyProperty="id">
        insert into scm_warehouse(<#if model_column?exists><#list model_column as model>${model.columnName},</#list></#if>
           deleted,create_time,update_time)
        values (<#if model_column?exists><#list model_column as model>${model.changeColumnName?uncap_first},</#list></#if>
        ${a + b + "deleted" + c},${a + b + "creatTime" + c},now())
    </insert>

    <update id="update">
        update scm_warehouse t
        <set>
            <#if model_column?exists>
                <#list model_column as model>
            <if test="${model.changeColumnName?uncap_first} != null">
                t.${model.columnName} = '${a + b +model.changeColumnName?uncap_first + c},
            </if>
                </#list>
            </#if>
            <if test="deleted != null">
                t.deleted = ${a + b + "deleted" + c},
            </if>
            <if test="creatTime != null">
                t.create_time = ${a + b + "creatTime" + c},
            </if>
            <if test="updateTime != null">
                t.update_time = ${a + b + "updateTime" + c},
            </if>
        </set>
        where
          t.id = ${a + b + "id" + c}
    </update>

    <update id="removeById">
        update
         ${tableName} t
        set
          t.deleted = 1
        where
          t.id = ${a + b + "id" + c}
    </update>

    <update id="removeByIds">
        update
          ${tableName} t
        set
          t.deleted = 1
        where
          t.id in
        <foreach collection="ids" item="item" open="(" separator=","  close=")">
            ${a + b + "item" + c}
        </foreach>
    </update>
</mapper>