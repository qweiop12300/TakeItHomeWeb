package com.ruoyi.app.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.app.mapper.AppLikeMapper;
import com.ruoyi.app.domain.AppLike;
import com.ruoyi.app.service.IAppLikeService;

/**
 * 点赞Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-02-27
 */
@Service
public class AppLikeServiceImpl implements IAppLikeService 
{
    @Autowired
    private AppLikeMapper appLikeMapper;

    /**
     * 查询点赞
     * 
     * @param uid 点赞主键
     * @return 点赞
     */
    @Override
    public AppLike selectAppLikeByUid(Long uid)
    {
        return appLikeMapper.selectAppLikeByUid(uid);
    }

    /**
     * 查询点赞列表
     * 
     * @param appLike 点赞
     * @return 点赞
     */
    @Override
    public List<AppLike> selectAppLikeList(AppLike appLike)
    {
        return appLikeMapper.selectAppLikeList(appLike);
    }

    /**
     * 新增点赞
     * 
     * @param appLike 点赞
     * @return 结果
     */
    @Override
    public int insertAppLike(AppLike appLike)
    {
        return appLikeMapper.insertAppLike(appLike);
    }

    /**
     * 修改点赞
     * 
     * @param appLike 点赞
     * @return 结果
     */
    @Override
    public int updateAppLike(AppLike appLike)
    {
        return appLikeMapper.updateAppLike(appLike);
    }

    /**
     * 批量删除点赞
     * 
     * @param uids 需要删除的点赞主键
     * @return 结果
     */
    @Override
    public int deleteAppLikeByUids(Long[] uids)
    {
        return appLikeMapper.deleteAppLikeByUids(uids);
    }

    /**
     * 删除点赞信息
     * 
     * @param uid 点赞主键
     * @return 结果
     */
    @Override
    public int deleteAppLikeByUid(Long uid)
    {
        return appLikeMapper.deleteAppLikeByUid(uid);
    }
}
