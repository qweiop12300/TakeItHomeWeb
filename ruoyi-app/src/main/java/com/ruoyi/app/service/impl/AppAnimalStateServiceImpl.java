package com.ruoyi.app.service.impl;

import java.util.List;

import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.app.mapper.AppAnimalStateMapper;
import com.ruoyi.app.domain.AppAnimalState;
import com.ruoyi.app.service.IAppAnimalStateService;

/**
 * 动物状态关联Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-03-01
 */
@Service
public class AppAnimalStateServiceImpl implements IAppAnimalStateService 
{
    @Autowired
    private AppAnimalStateMapper appAnimalStateMapper;


    /**
     * 查询动物状态关联
     * 
     * @param id 动物状态关联主键
     * @return 动物状态关联
     */
    @Override
    public AppAnimalState selectAppAnimalStateById(Long id)
    {
        return appAnimalStateMapper.selectAppAnimalStateById(id);
    }

    /**
     * 查询动物状态关联列表
     * 
     * @param appAnimalState 动物状态关联
     * @return 动物状态关联
     */
    @Override
    public List<AppAnimalState> selectAppAnimalStateList(AppAnimalState appAnimalState)
    {
        return appAnimalStateMapper.selectAppAnimalStateList(appAnimalState);
    }

    /**
     * 新增动物状态关联
     * 
     * @param appAnimalState 动物状态关联
     * @return 结果
     */
    @Override
    public int insertAppAnimalState(AppAnimalState appAnimalState)
    {
        return appAnimalStateMapper.insertAppAnimalState(appAnimalState);
    }

    /**
     * 修改动物状态关联
     * 
     * @param appAnimalState 动物状态关联
     * @return 结果
     */
    @Override
    public int updateAppAnimalState(AppAnimalState appAnimalState)
    {
        AppAnimalState old = selectAppAnimalStateById(appAnimalState.getId());
        if (old!=null&&(old.getUid().equals(SecurityUtils.getUserId())||old.getBid().equals(SecurityUtils.getUserId())||old.getUid().equals(SecurityUtils.getUserId()))){
            return appAnimalStateMapper.updateAppAnimalState(appAnimalState);
        }

        return 0;

    }

    /**
     * 批量删除动物状态关联
     * 
     * @param ids 需要删除的动物状态关联主键
     * @return 结果
     */
    @Override
    public int deleteAppAnimalStateByIds(Long[] ids)
    {
        return appAnimalStateMapper.deleteAppAnimalStateByIds(ids);
    }

    /**
     * 删除动物状态关联信息
     * 
     * @param id 动物状态关联主键
     * @return 结果
     */
    @Override
    public int deleteAppAnimalStateById(Long id)
    {
        return appAnimalStateMapper.deleteAppAnimalStateById(id);
    }
}
