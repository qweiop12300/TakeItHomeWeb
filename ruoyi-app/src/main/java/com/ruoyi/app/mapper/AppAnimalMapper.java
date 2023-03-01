package com.ruoyi.app.mapper;

import java.util.List;
import com.ruoyi.app.domain.AppAnimal;

/**
 * 动物信息Mapper接口
 * 
 * @author ruoyi
 * @date 2023-03-01
 */
public interface AppAnimalMapper 
{
    /**
     * 查询动物信息
     * 
     * @param id 动物信息主键
     * @return 动物信息
     */
    public AppAnimal selectAppAnimalById(Long id);

    /**
     * 查询动物信息列表
     * 
     * @param appAnimal 动物信息
     * @return 动物信息集合
     */
    public List<AppAnimal> selectAppAnimalList(AppAnimal appAnimal);

    /**
     * 新增动物信息
     * 
     * @param appAnimal 动物信息
     * @return 结果
     */
    public int insertAppAnimal(AppAnimal appAnimal);

    /**
     * 修改动物信息
     * 
     * @param appAnimal 动物信息
     * @return 结果
     */
    public int updateAppAnimal(AppAnimal appAnimal);

    /**
     * 删除动物信息
     * 
     * @param id 动物信息主键
     * @return 结果
     */
    public int deleteAppAnimalById(Long id);

    /**
     * 批量删除动物信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAppAnimalByIds(Long[] ids);
}
