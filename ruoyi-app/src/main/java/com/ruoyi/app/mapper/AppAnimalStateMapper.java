package com.ruoyi.app.mapper;

import java.util.List;
import com.ruoyi.app.domain.AppAnimalState;

/**
 * 动物状态关联Mapper接口
 * 
 * @author ruoyi
 * @date 2023-03-01
 */
public interface AppAnimalStateMapper 
{
    /**
     * 查询动物状态关联
     * 
     * @param id 动物状态关联主键
     * @return 动物状态关联
     */
    public AppAnimalState selectAppAnimalStateById(Long id);

    /**
     * 查询动物状态关联列表
     * 
     * @param appAnimalState 动物状态关联
     * @return 动物状态关联集合
     */
    public List<AppAnimalState> selectAppAnimalStateList(AppAnimalState appAnimalState);

    /**
     * 新增动物状态关联
     * 
     * @param appAnimalState 动物状态关联
     * @return 结果
     */
    public int insertAppAnimalState(AppAnimalState appAnimalState);

    /**
     * 修改动物状态关联
     * 
     * @param appAnimalState 动物状态关联
     * @return 结果
     */
    public int updateAppAnimalState(AppAnimalState appAnimalState);

    /**
     * 删除动物状态关联
     * 
     * @param id 动物状态关联主键
     * @return 结果
     */
    public int deleteAppAnimalStateById(Long id);

    /**
     * 批量删除动物状态关联
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAppAnimalStateByIds(Long[] ids);
}
