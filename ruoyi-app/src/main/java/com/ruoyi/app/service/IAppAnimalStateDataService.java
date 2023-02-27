package com.ruoyi.app.service;

import java.util.List;
import com.ruoyi.app.domain.AppAnimalStateData;

/**
 * 动物状态信息Service接口
 * 
 * @author ruoyi
 * @date 2023-02-27
 */
public interface IAppAnimalStateDataService 
{
    /**
     * 查询动物状态信息
     * 
     * @param id 动物状态信息主键
     * @return 动物状态信息
     */
    public AppAnimalStateData selectAppAnimalStateDataById(Long id);

    /**
     * 查询动物状态信息列表
     * 
     * @param appAnimalStateData 动物状态信息
     * @return 动物状态信息集合
     */
    public List<AppAnimalStateData> selectAppAnimalStateDataList(AppAnimalStateData appAnimalStateData);

    /**
     * 新增动物状态信息
     * 
     * @param appAnimalStateData 动物状态信息
     * @return 结果
     */
    public int insertAppAnimalStateData(AppAnimalStateData appAnimalStateData);

    /**
     * 修改动物状态信息
     * 
     * @param appAnimalStateData 动物状态信息
     * @return 结果
     */
    public int updateAppAnimalStateData(AppAnimalStateData appAnimalStateData);

    /**
     * 批量删除动物状态信息
     * 
     * @param ids 需要删除的动物状态信息主键集合
     * @return 结果
     */
    public int deleteAppAnimalStateDataByIds(Long[] ids);

    /**
     * 删除动物状态信息信息
     * 
     * @param id 动物状态信息主键
     * @return 结果
     */
    public int deleteAppAnimalStateDataById(Long id);
}
