package ${basePackage}.entity;

import com.gog.scm.common.base.BaseEntity;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.Length;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.com.gog.generator.util.Date;
import java.io.Serializable;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

<#if model_column?exists>
    <#list model_column as model>
        <#if (model.columnType = 'DECIMAL')>
import java.math.BigDecimal;
            <#break>
        </#if>
    </#list>
</#if>

/**
 * @Description:${tableNameCn}
 * @Author:${author}
 * @Date:${date}
 */
@Data
public class ${changeTableName} extends BaseEntity implements Serializable{

<#if model_column?exists>
    <#list model_column as model>
    /**
     * ${model.columnComment!}
     */
        <#if model.nullable=false>
            <#if (model.columnType = 'VARCHAR' || model.columnType = 'CHAR')>
    @NotBlank(message = "${model.columnComment!}不能为空!")
                <#else>
    @NotNull(message = "${model.columnComment!}不能为空!")
            </#if>
        </#if>
    @ApiModelProperty(value = "${model.columnComment!}")
        <#if (model.columnType = 'VARCHAR' || model.columnType = 'CHAR')>
    private String ${model.changeColumnName?uncap_first};
        </#if>
        <#if (model.columnType = 'INT' || model.columnType = 'int')>
    private Integer ${model.changeColumnName?uncap_first};
        </#if>
        <#if (model.columnType = 'DATETIME' || model.columnType = 'DATE') >
    private Date ${model.changeColumnName?uncap_first};
        </#if>
        <#if (model.columnType = 'DECIMAL' || model.columnType = 'decimal') >
    private BigDecimal ${model.changeColumnName?uncap_first};
        </#if>
        <#if (model.columnType = 'BIT' || model.columnType = 'bit') >
    private Integer ${model.changeColumnName?uncap_first};
        </#if>
    </#list>
</#if>
}