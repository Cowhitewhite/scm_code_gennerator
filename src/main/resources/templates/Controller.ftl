package ${basePackage}.controller;

import com.gog.scm.common.base.PageResult;
import com.gog.scm.common.base.ResultData;
import ${basePackage}.entity.Warehouse;
import ${basePackage}.service.WarehouseService;
import ${basePackage}.vo.req.WarehouseReq;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

<#assign Service=changeTableName+"Service">
<#assign service=changeTableName?uncap_first+"Service">
<#assign Req=changeTableName+"Req">
<#assign req=changeTableName?uncap_first+"Req">
/**
* 描述：${tableNameCn}controller
* @author ${author}
* @date ${date}
*/
@Api(tags = "${tableNameCn}控制器")
@RequestMapping("/${changeTableName?uncap_first}")
@RestController
public class ${changeTableName}Controller{

    @Autowired
    private ${Service} ${service};

    /**
    * 分页列表
    * @param ${req}
    * @return
    */
    @PostMapping("/Pagelist")
    @ApiOperation(value = "查询分页列表",notes = "查询分页列表")
    public ResultData<PageResult<${changeTableName}>> ${changeTableName}PageList(@RequestBody ${Req} ${req}){
        return ${service}.getPageList(warehouseReq);
    }

    /**
    * 分页列表
    * @param ${req}
    * @return
    */
    @PostMapping("/list")
    @ApiOperation(value = "查询不分页列表",notes = "查询不分页列表")
    public ResultData<List<${changeTableName}>> ${changeTableName}List(@RequestBody ${Req} ${req}){
        return ${service}.getList(warehouseReq);
    }


    /**
    * 详情
    * @param id
    * @return
    */
    @GetMapping("/info/{id}")
    @ApiOperation(value = "详情",notes = "详情")
    public ResultData<${changeTableName}> ${changeTableName}Info(@PathVariable("id") Long id){
        return ${service}.findById(id);
    }

    /**
    * 批量查询
    * @param ids
    * @return
    */
    @GetMapping("/info/ids")
    @ApiOperation(value = "批量id查询",notes = "批量查询详情")
    public ResultData<List<${changeTableName}>> ${changeTableName}InfoIds(@RequestParam("ids") List<Long> ids){
        return ${service}.findByIds(ids);
    }

    /**
    * 保存
    * @param ${lowerCaseFirst}
    * @return
    */
    @PostMapping("/save")
    @ApiOperation(value = "保存",notes = "保存")
    public ResultData<String> ${changeTableName}Save(@RequestBody @Valid ${changeTableName} ${lowerCaseFirst}){
        return ${service}.save(warehouse);
    }

    /**
    * 修改
    * @param ${lowerCaseFirst}
    * @return
    */
    @PutMapping("/update")
    @ApiOperation(value = "更新",notes = "更新")
    public ResultData<String> ${changeTableName}Update(@RequestBody ${changeTableName} ${lowerCaseFirst}){
        return ${service}.update(warehouse);
    }

    /**
    * 根据id删除
    * @param id
    * @return
    */
    @DeleteMapping("/delete/{id}")
    @ApiOperation(value = "删除",notes = "删除")
    public ResultData<String> ${changeTableName}Delete(@PathVariable("id") Long id){
        return ${service}.removeById(id);
    }

    /**
    * 批量id删除
    * @param ids
    * @return
    */
    @DeleteMapping("/delete/ids")
    @ApiOperation(value = "根据id批量删除",notes = "根据id批量删除")
    public ResultData<String> ${changeTableName}BatchDelete(@RequestBody List<Long> ids){
        return ${service}.removeByIds(ids);
    }
}