package com.ruoyi.app.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.app.mapper.AppAnimalStateMapper;
import com.ruoyi.app.domain.AppAnimalState;
import com.ruoyi.app.service.IAppAnimalStateService;

/**
 * 动物状态关联管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-02-27
 */
@Service
public class AppAnimalStateServiceImpl implements IAppAnimalStateService 
{
    @Autowired
    private AppAnimalStateMapper appAnimalStateMapper;

    /**
     * 查询动物状态关联管理
     * 
     * @param aid 动物状态关联管理主键
     * @return 动物状态关联管理
     */
    @Override
    public AppAnimalState selectAppAnimalStateByAid(Long aid)
    {
        return appAnimalStateMapper.selectAppAnimalStateByAid(aid);
    }

    /**
     * 查询动物状态关联管理列表
     * 
     * @param appAnimalState 动物状态关联管理
     * @return 动物状态关联管理
     */
    @Override
    public List<AppAnimalState> selectAppAnimalStateList(AppAnimalState appAnimalState)
    {
        return appAnimalStateMapper.selectAppAnimalStateList(appAnimalState);
    }

    /**
     * 新增动物状态关联管理
     * 
     * @param appAnimalState 动物状态关联管理
     * @return 结果
     */
    @Override
    public int insertAppAnimalState(AppAnimalState appAnimalState)
    {
        return appAnimalStateMapper.insertAppAnimalState(appAnimalState);
    }

    /**
     * 修改动物状态关联管理
     * 
     * @param appAnimalState 动物状态关联管理
     * @return 结果
     */
    @Override
    public int updateAppAnimalState(AppAnimalState appAnimalState)
    {
        return appAnimalStateMapper.updateAppAnimalState(appAnimalState);
    }

    /**
     * 批量删除动物状态关联管理
     * 
     * @param aids 需要删除的动物状态关联管理主键
     * @return 结果
     */
    @Override
    public int deleteAppAnimalStateByAids(Long[] aids)
    {
        return appAnimalStateMapper.deleteAppAnimalStateByAids(aids);
    }

    /**
     * 删除动物状态关联管理信息
     * 
     * @param aid 动物状态关联管理主键
     * @return 结果
     */
    @Override
    public int deleteAppAnimalStateByAid(Long aid)
    {
        return appAnimalStateMapper.deleteAppAnimalStateByAid(aid);
    }
}
