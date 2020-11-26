package ${basePackage}.entity.vo.req;

import com.gog.scm.common.base.BaseRequest;
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
<#if model_column?exists>
    <#list model_column as model>
        <#if (model.columnType = 'DATETIME')>
import java.com.gog.generator.util.Date;
            <#break>
        </#if>
    </#list>
</#if>

/**
* @author ChenHao
* @version 1.0
* @date ${date}
*/
@Data
public class ${changeTableName}Req extends BaseRequest{

<#if model_column?exists>
    <#list model_column as model>
    /**
     * ${model.columnComment!}
     */
    @ApiModelProperty(value = "${model.columnComment!}", notes = "${model.columnComment!}")
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