package com.ruoyi.app.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.app.mapper.AppPostTypeMapper;
import com.ruoyi.app.domain.AppPostType;
import com.ruoyi.app.service.IAppPostTypeService;

/**
 * 动态类型Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-03-14
 */
@Service
public class AppPostTypeServiceImpl implements IAppPostTypeService 
{
    @Autowired
    private AppPostTypeMapper appPostTypeMapper;

    /**
     * 查询动态类型
     * 
     * @param id 动态类型主键
     * @return 动态类型
     */
    @Override
    public AppPostType selectAppPostTypeById(Long id)
    {
        return appPostTypeMapper.selectAppPostTypeById(id);
    }

    /**
     * 查询动态类型列表
     * 
     * @param appPostType 动态类型
     * @return 动态类型
     */
    @Override
    public List<AppPostType> selectAppPostTypeList(AppPostType appPostType)
    {
        return appPostTypeMapper.selectAppPostTypeList(appPostType);
    }

    /**
     * 新增动态类型
     * 
     * @param appPostType 动态类型
     * @return 结果
     */
    @Override
    public int insertAppPostType(AppPostType appPostType)
    {
        return appPostTypeMapper.insertAppPostType(appPostType);
    }

    /**
     * 修改动态类型
     * 
     * @param appPostType 动态类型
     * @return 结果
     */
    @Override
    public int updateAppPostType(AppPostType appPostType)
    {
        return appPostTypeMapper.updateAppPostType(appPostType);
    }

    /**
     * 批量删除动态类型
     * 
     * @param ids 需要删除的动态类型主键
     * @return 结果
     */
    @Override
    public int deleteAppPostTypeByIds(Long[] ids)
    {
        return appPostTypeMapper.deleteAppPostTypeByIds(ids);
    }

    /**
     * 删除动态类型信息
     * 
     * @param id 动态类型主键
     * @return 结果
     */
    @Override
    public int deleteAppPostTypeById(Long id)
    {
        return appPostTypeMapper.deleteAppPostTypeById(id);
    }
}
