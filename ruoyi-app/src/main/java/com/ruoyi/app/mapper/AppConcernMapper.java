package com.ruoyi.app.mapper;

import java.util.List;
import com.ruoyi.app.domain.AppConcern;

/**
 * 关注Mapper接口
 * 
 * @author ruoyi
 * @date 2023-02-27
 */
public interface AppConcernMapper 
{
    /**
     * 查询关注
     * 
     * @param id 关注主键
     * @return 关注
     */
    public AppConcern selectAppConcernById(Long id);

    /**
     * 查询关注列表
     * 
     * @param appConcern 关注
     * @return 关注集合
     */
    public List<AppConcern> selectAppConcernList(AppConcern appConcern);

    /**
     * 新增关注
     * 
     * @param appConcern 关注
     * @return 结果
     */
    public int insertAppConcern(AppConcern appConcern);

    /**
     * 修改关注
     * 
     * @param appConcern 关注
     * @return 结果
     */
    public int updateAppConcern(AppConcern appConcern);

    /**
     * 删除关注
     * 
     * @param id 关注主键
     * @return 结果
     */
    public int deleteAppConcernById(Long id);

    /**
     * 批量删除关注
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAppConcernByIds(Long[] ids);
}
