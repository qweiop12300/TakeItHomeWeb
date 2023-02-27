package com.ruoyi.app.service;

import java.util.List;
import com.ruoyi.app.domain.AppAnimal;

/**
 * 动物信息管理Service接口
 * 
 * @author ruoyi
 * @date 2023-02-27
 */
public interface IAppAnimalService 
{
    /**
     * 查询动物信息管理
     * 
     * @param id 动物信息管理主键
     * @return 动物信息管理
     */
    public AppAnimal selectAppAnimalById(Long id);

    /**
     * 查询动物信息管理列表
     * 
     * @param appAnimal 动物信息管理
     * @return 动物信息管理集合
     */
    public List<AppAnimal> selectAppAnimalList(AppAnimal appAnimal);

    /**
     * 新增动物信息管理
     * 
     * @param appAnimal 动物信息管理
     * @return 结果
     */
    public int insertAppAnimal(AppAnimal appAnimal);

    /**
     * 修改动物信息管理
     * 
     * @param appAnimal 动物信息管理
     * @return 结果
     */
    public int updateAppAnimal(AppAnimal appAnimal);

    /**
     * 批量删除动物信息管理
     * 
     * @param ids 需要删除的动物信息管理主键集合
     * @return 结果
     */
    public int deleteAppAnimalByIds(Long[] ids);

    /**
     * 删除动物信息管理信息
     * 
     * @param id 动物信息管理主键
     * @return 结果
     */
    public int deleteAppAnimalById(Long id);
}
