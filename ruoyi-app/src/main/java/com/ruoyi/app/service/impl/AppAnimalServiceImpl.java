package com.ruoyi.app.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.app.mapper.AppAnimalMapper;
import com.ruoyi.app.domain.AppAnimal;
import com.ruoyi.app.service.IAppAnimalService;

/**
 * 动物信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-03-01
 */
@Service
public class AppAnimalServiceImpl implements IAppAnimalService 
{
    @Autowired
    private AppAnimalMapper appAnimalMapper;

    /**
     * 查询动物信息
     * 
     * @param id 动物信息主键
     * @return 动物信息
     */
    @Override
    public AppAnimal selectAppAnimalById(Long id)
    {
        return appAnimalMapper.selectAppAnimalById(id);
    }

    /**
     * 查询动物信息列表
     * 
     * @param appAnimal 动物信息
     * @return 动物信息
     */
    @Override
    public List<AppAnimal> selectAppAnimalList(AppAnimal appAnimal)
    {
        return appAnimalMapper.selectAppAnimalList(appAnimal);
    }

    /**
     * 新增动物信息
     * 
     * @param appAnimal 动物信息
     * @return 结果
     */
    @Override
    public int insertAppAnimal(AppAnimal appAnimal)
    {
        return appAnimalMapper.insertAppAnimal(appAnimal);
    }

    /**
     * 修改动物信息
     * 
     * @param appAnimal 动物信息
     * @return 结果
     */
    @Override
    public int updateAppAnimal(AppAnimal appAnimal)
    {
        return appAnimalMapper.updateAppAnimal(appAnimal);
    }

    /**
     * 批量删除动物信息
     * 
     * @param ids 需要删除的动物信息主键
     * @return 结果
     */
    @Override
    public int deleteAppAnimalByIds(Long[] ids)
    {
        return appAnimalMapper.deleteAppAnimalByIds(ids);
    }

    /**
     * 删除动物信息信息
     * 
     * @param id 动物信息主键
     * @return 结果
     */
    @Override
    public int deleteAppAnimalById(Long id)
    {
        return appAnimalMapper.deleteAppAnimalById(id);
    }
}
