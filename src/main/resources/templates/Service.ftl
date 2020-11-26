package ${basePackage}.api;

import com.gog.scm.common.base.PageResult;
import com.gog.scm.common.base.ResultData;
import ${basePackage}.entity.${changeTableName};
import ${basePackage}.vo.req.${changeTableName}Req;

import java.util.List;

/**
* @author ChenHao
* @version 1.0
* @date ${date}
*/
public interface ${changeTableName}Service{

    /**
    * 分页列表
    * @param ${lowerCaseFirst}Req
    * @return
    */
    ResultData<PageResult<${changeTableName}>> getPageList(${changeTableName}Req ${lowerCaseFirst}Req);

    /**
    * 不分页列表
    * @param ${lowerCaseFirst}Req
    * @return
    */
    ResultData<List<${changeTableName}>> getList(${changeTableName}Req ${lowerCaseFirst}Req);

    /**
    * 列表详情
    * @param id
    * @return
    */
    ResultData<${changeTableName}> findById(Long id);

    /**
    * 保存
    * @param ${lowerCaseFirst}
    * @return
    */
    ResultData<String> save(${changeTableName} ${lowerCaseFirst});

    /**
    * 更新
    * @param ${lowerCaseFirst}
    * @return
    */
    ResultData<String> update(${changeTableName} ${lowerCaseFirst});

    /**
    * 根据id删除
    * @param id
    * @return
    */
    ResultData<String> removeById(Long id);

    /**
    * 根据多个id删除
    * @param ids
    * @return
    */
    ResultData<String> removeByIds(List<Long> ids);

    /**
    * id批量查询
    * @param ids
    * @return
    */
    ResultData<List<${changeTableName}>> findByIds(List<Long> ids);
}