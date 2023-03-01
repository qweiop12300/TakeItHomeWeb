package com.ruoyi.app.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.app.mapper.AppMessageTypeMapper;
import com.ruoyi.app.domain.AppMessageType;
import com.ruoyi.app.service.IAppMessageTypeService;

/**
 * 信息类型Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
@Service
public class AppMessageTypeServiceImpl implements IAppMessageTypeService 
{
    @Autowired
    private AppMessageTypeMapper appMessageTypeMapper;

    /**
     * 查询信息类型
     * 
     * @param id 信息类型主键
     * @return 信息类型
     */
    @Override
    public AppMessageType selectAppMessageTypeById(Long id)
    {
        return appMessageTypeMapper.selectAppMessageTypeById(id);
    }

    /**
     * 查询信息类型列表
     * 
     * @param appMessageType 信息类型
     * @return 信息类型
     */
    @Override
    public List<AppMessageType> selectAppMessageTypeList(AppMessageType appMessageType)
    {
        return appMessageTypeMapper.selectAppMessageTypeList(appMessageType);
    }

    /**
     * 新增信息类型
     * 
     * @param appMessageType 信息类型
     * @return 结果
     */
    @Override
    public int insertAppMessageType(AppMessageType appMessageType)
    {
        return appMessageTypeMapper.insertAppMessageType(appMessageType);
    }

    /**
     * 修改信息类型
     * 
     * @param appMessageType 信息类型
     * @return 结果
     */
    @Override
    public int updateAppMessageType(AppMessageType appMessageType)
    {
        return appMessageTypeMapper.updateAppMessageType(appMessageType);
    }

    /**
     * 批量删除信息类型
     * 
     * @param ids 需要删除的信息类型主键
     * @return 结果
     */
    @Override
    public int deleteAppMessageTypeByIds(Long[] ids)
    {
        return appMessageTypeMapper.deleteAppMessageTypeByIds(ids);
    }

    /**
     * 删除信息类型信息
     * 
     * @param id 信息类型主键
     * @return 结果
     */
    @Override
    public int deleteAppMessageTypeById(Long id)
    {
        return appMessageTypeMapper.deleteAppMessageTypeById(id);
    }
}
