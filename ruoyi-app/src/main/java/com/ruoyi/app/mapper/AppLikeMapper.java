package com.ruoyi.app.mapper;

import java.util.List;
import com.ruoyi.app.domain.AppLike;

/**
 * 点赞Mapper接口
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
public interface AppLikeMapper 
{
    /**
     * 查询点赞
     * 
     * @param id 点赞主键
     * @return 点赞
     */
    public AppLike selectAppLikeById(Long id);

    /**
     * 查询点赞列表
     * 
     * @param appLike 点赞
     * @return 点赞集合
     */
    public List<AppLike> selectAppLikeList(AppLike appLike);

    /**
     * 新增点赞
     * 
     * @param appLike 点赞
     * @return 结果
     */
    public int insertAppLike(AppLike appLike);

    /**
     * 修改点赞
     * 
     * @param appLike 点赞
     * @return 结果
     */
    public int updateAppLike(AppLike appLike);

    /**
     * 删除点赞
     * 
     * @param id 点赞主键
     * @return 结果
     */
    public int deleteAppLikeById(Long id);

    /**
     * 批量删除点赞
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAppLikeByIds(Long[] ids);
}
