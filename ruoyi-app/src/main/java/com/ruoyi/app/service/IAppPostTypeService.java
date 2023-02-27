package com.ruoyi.app.service;

import java.util.List;
import com.ruoyi.app.domain.AppPostType;

/**
 * 动态类型Service接口
 * 
 * @author ruoyi
 * @date 2023-02-27
 */
public interface IAppPostTypeService 
{
    /**
     * 查询动态类型
     * 
     * @param id 动态类型主键
     * @return 动态类型
     */
    public AppPostType selectAppPostTypeById(Long id);

    /**
     * 查询动态类型列表
     * 
     * @param appPostType 动态类型
     * @return 动态类型集合
     */
    public List<AppPostType> selectAppPostTypeList(AppPostType appPostType);

    /**
     * 新增动态类型
     * 
     * @param appPostType 动态类型
     * @return 结果
     */
    public int insertAppPostType(AppPostType appPostType);

    /**
     * 修改动态类型
     * 
     * @param appPostType 动态类型
     * @return 结果
     */
    public int updateAppPostType(AppPostType appPostType);

    /**
     * 批量删除动态类型
     * 
     * @param ids 需要删除的动态类型主键集合
     * @return 结果
     */
    public int deleteAppPostTypeByIds(Long[] ids);

    /**
     * 删除动态类型信息
     * 
     * @param id 动态类型主键
     * @return 结果
     */
    public int deleteAppPostTypeById(Long id);
}
