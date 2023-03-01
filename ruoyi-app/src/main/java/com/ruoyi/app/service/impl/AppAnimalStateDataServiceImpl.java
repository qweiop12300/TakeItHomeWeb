package com.ruoyi.app.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.app.mapper.AppAnimalStateDataMapper;
import com.ruoyi.app.domain.AppAnimalStateData;
import com.ruoyi.app.service.IAppAnimalStateDataService;

/**
 * 动物状态信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
@Service
public class AppAnimalStateDataServiceImpl implements IAppAnimalStateDataService 
{
    @Autowired
    private AppAnimalStateDataMapper appAnimalStateDataMapper;

    /**
     * 查询动物状态信息
     * 
     * @param id 动物状态信息主键
     * @return 动物状态信息
     */
    @Override
    public AppAnimalStateData selectAppAnimalStateDataById(Long id)
    {
        return appAnimalStateDataMapper.selectAppAnimalStateDataById(id);
    }

    /**
     * 查询动物状态信息列表
     * 
     * @param appAnimalStateData 动物状态信息
     * @return 动物状态信息
     */
    @Override
    public List<AppAnimalStateData> selectAppAnimalStateDataList(AppAnimalStateData appAnimalStateData)
    {
        return appAnimalStateDataMapper.selectAppAnimalStateDataList(appAnimalStateData);
    }

    /**
     * 新增动物状态信息
     * 
     * @param appAnimalStateData 动物状态信息
     * @return 结果
     */
    @Override
    public int insertAppAnimalStateData(AppAnimalStateData appAnimalStateData)
    {
        return appAnimalStateDataMapper.insertAppAnimalStateData(appAnimalStateData);
    }

    /**
     * 修改动物状态信息
     * 
     * @param appAnimalStateData 动物状态信息
     * @return 结果
     */
    @Override
    public int updateAppAnimalStateData(AppAnimalStateData appAnimalStateData)
    {
        return appAnimalStateDataMapper.updateAppAnimalStateData(appAnimalStateData);
    }

    /**
     * 批量删除动物状态信息
     * 
     * @param ids 需要删除的动物状态信息主键
     * @return 结果
     */
    @Override
    public int deleteAppAnimalStateDataByIds(Long[] ids)
    {
        return appAnimalStateDataMapper.deleteAppAnimalStateDataByIds(ids);
    }

    /**
     * 删除动物状态信息信息
     * 
     * @param id 动物状态信息主键
     * @return 结果
     */
    @Override
    public int deleteAppAnimalStateDataById(Long id)
    {
        return appAnimalStateDataMapper.deleteAppAnimalStateDataById(id);
    }
}
