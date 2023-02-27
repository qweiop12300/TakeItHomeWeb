package com.ruoyi.app.service;

import java.util.List;
import com.ruoyi.app.domain.AppAnimalState;

/**
 * 动物状态关联管理Service接口
 * 
 * @author ruoyi
 * @date 2023-02-27
 */
public interface IAppAnimalStateService 
{
    /**
     * 查询动物状态关联管理
     * 
     * @param aid 动物状态关联管理主键
     * @return 动物状态关联管理
     */
    public AppAnimalState selectAppAnimalStateByAid(Long aid);

    /**
     * 查询动物状态关联管理列表
     * 
     * @param appAnimalState 动物状态关联管理
     * @return 动物状态关联管理集合
     */
    public List<AppAnimalState> selectAppAnimalStateList(AppAnimalState appAnimalState);

    /**
     * 新增动物状态关联管理
     * 
     * @param appAnimalState 动物状态关联管理
     * @return 结果
     */
    public int insertAppAnimalState(AppAnimalState appAnimalState);

    /**
     * 修改动物状态关联管理
     * 
     * @param appAnimalState 动物状态关联管理
     * @return 结果
     */
    public int updateAppAnimalState(AppAnimalState appAnimalState);

    /**
     * 批量删除动物状态关联管理
     * 
     * @param aids 需要删除的动物状态关联管理主键集合
     * @return 结果
     */
    public int deleteAppAnimalStateByAids(Long[] aids);

    /**
     * 删除动物状态关联管理信息
     * 
     * @param aid 动物状态关联管理主键
     * @return 结果
     */
    public int deleteAppAnimalStateByAid(Long aid);
}
