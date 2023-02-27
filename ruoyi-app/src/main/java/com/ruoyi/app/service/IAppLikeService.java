package com.ruoyi.app.service;

import java.util.List;
import com.ruoyi.app.domain.AppLike;

/**
 * 点赞Service接口
 * 
 * @author ruoyi
 * @date 2023-02-27
 */
public interface IAppLikeService 
{
    /**
     * 查询点赞
     * 
     * @param uid 点赞主键
     * @return 点赞
     */
    public AppLike selectAppLikeByUid(Long uid);

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
     * 批量删除点赞
     * 
     * @param uids 需要删除的点赞主键集合
     * @return 结果
     */
    public int deleteAppLikeByUids(Long[] uids);

    /**
     * 删除点赞信息
     * 
     * @param uid 点赞主键
     * @return 结果
     */
    public int deleteAppLikeByUid(Long uid);
}
