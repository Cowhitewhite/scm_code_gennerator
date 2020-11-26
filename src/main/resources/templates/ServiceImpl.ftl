package ${basePackage}.service;

import com.github.pagehelper.PageHelper;
import com.gog.scm.common.base.PageResult;
import com.gog.scm.common.base.ResultData;
import com.gog.scm.common.utils.ContextUtil;
import ${basePackage}.dao.WarehouseDao;
import ${basePackage}.entity.Warehouse;
import ${basePackage}.service.WarehouseService;
import ${basePackage}.vo.req.WarehouseReq;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

<#assign Dao=changeTableName+"Dao">
<#assign dao=changeTableName?uncap_first+"Dao">
<#assign Class=changeTableName>
<#assign class=changeTableName?uncap_first>

/**
* @author ChenHao
* @version 1.0
* @date ${date}
*/
@Slf4j
@Service
public class ${changeTableName}Service implements ${changeTableName}Service{

    @Autowired
    private ${Dao} ${dao};

    @Override
    public ResultData<List<${changeTableName}>> getList(${changeTableName}Req ${lowerCaseFirst}Req){
        List<${changeTableName}> list = ${dao}.getList(${class}Req);
        return ResultData.success(ContextUtil.getMessage("core_context_01"), result);
    }

    @Override
    public ResultData<PageResult<${changeTableName}>> getPageList(${changeTableName}Req ${lowerCaseFirst}Req){
        PageHelper.startPage(${lowerCaseFirst}Req.getPageIndex(), ${lowerCaseFirst}Req.getPageSize());
        List<${changeTableName}> list = warehouseDao.getPageList(warehouseReq);
        PageResult<${changeTableName}> pageResult = new PageResult<>(list);
        return ResultData.success(ContextUtil.getMessage("core_context_01"), pageResult);
    }

    @Override
    public ResultData<${changeTableName}> findById(Long id){
        ${changeTableName} ${lowerCaseFirst} = ${dao}.info(id);
        return ResultData.success(ContextUtil.getMessage("core_context_01"), ${lowerCaseFirst});
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultData<String> save(${changeTableName} ${lowerCaseFirst}){
        ${dao}.save(${lowerCaseFirst});
        return ResultData.success(ContextUtil.getMessage("core_context_01"));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultData<String> update(${changeTableName} ${lowerCaseFirst}){
        ${dao}.update(newRecord);
        return ResultData.success(ContextUtil.getMessage("core_context_01"));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultData<String> removeById(Long id){
        ${dao}.deleteById(newRecord);
        return ResultData.success(ContextUtil.getMessage("core_context_01"));
    }

    @Override
    public ResultData<String> removeByIds(List<Long> ids) {
        ${dao}.deleteByIds(ids);
        return ResultData.success(ContextUtil.getMessage("core_context_01"));
    }

    @Override
    public ResultData<List<${changeTableName}>> findByIds(List<Long> ids){
        List<${changeTableName}> list = ${dao}.findByIds(ids);
        return ResultData.success(ContextUtil.getMessage("core_context_01"));
    }
}