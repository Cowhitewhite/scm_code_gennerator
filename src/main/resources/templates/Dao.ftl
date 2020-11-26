package ${basePackage}.dao;

import com.ecmp.core.dao.BaseEntityDao;
import ${basePackage}.entity.${changeTableName};
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
* @author ChenHao
* @version 1.0
* @date ${date}
*/
@Mapper
public interface ${changeTableName}Dao{

    /**
    * 列表查询
    * @param ${changeTableName}Req
    * @return
    */
    List<${changeTableName}> getList(${changeTableName}Req req);

    /**
    * 修改
    * @param ${lowerCaseFirst}
    * @return
    */
    Integer update(${changeTableName} ${lowerCaseFirst});

    /**
    * 详情
    * @param ${changeTableName}
    * @return
    */
    ${changeTableName} info(@Param("id") Long id);

    /**
    * 批量id查询
    * @param ids
    * @return
    */
    List<${changeTableName}> findByIds(@Param("ids") List<Long> ids);

    /**
    * 删除
    * @param id
    * @return
    */
    Integer deleteById(@Param("id") Long id);

    /**
    * 批量id删除
    * @param warehouseReq
    * @return
    */
    Integer deleteByIds(@Param("ids") List<Long> ids);
}