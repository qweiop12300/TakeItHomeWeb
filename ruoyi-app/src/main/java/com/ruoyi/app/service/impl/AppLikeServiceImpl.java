package com.ruoyi.app.service.impl;

import java.util.Date;
import java.util.List;

import com.ruoyi.app.domain.AppConcern;
import com.ruoyi.app.domain.AppPost;
import com.ruoyi.app.mapper.AppPostMapper;
import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.app.mapper.AppLikeMapper;
import com.ruoyi.app.domain.AppLike;
import com.ruoyi.app.service.IAppLikeService;

/**
 * 点赞Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
@Service
public class AppLikeServiceImpl implements IAppLikeService 
{
    @Autowired
    private AppLikeMapper appLikeMapper;

    @Autowired
    private AppPostMapper appPostMapper;

    /**
     * 查询点赞
     * 
     * @param id 点赞主键
     * @return 点赞
     */
    @Override
    public AppLike selectAppLikeById(Long id)
    {
        return appLikeMapper.selectAppLikeById(id);
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
        appLike.setUid(SecurityUtils.getUserId());
        List<AppLike> list = appLikeMapper.selectAppLikeList(appLike);
        AppPost appPost = appPostMapper.selectAppPostById(appLike.getPid());
        if (list.size()==0){
            appLike.setCreateDate(new Date());
            appPost.setLikeNumber(appPost.getLikeNumber()+1);
            appPostMapper.updateAppPost(appPost);
            return appLikeMapper.insertAppLike(appLike);
        }else {
            appPost.setLikeNumber(appPost.getLikeNumber()-1);
            appPostMapper.updateAppPost(appPost);
            appLikeMapper.deleteAppLikeById(list.get(0).getId());
        }
        return 0;
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
     * @param ids 需要删除的点赞主键
     * @return 结果
     */
    @Override
    public int deleteAppLikeByIds(Long[] ids)
    {
        return appLikeMapper.deleteAppLikeByIds(ids);
    }

    /**
     * 删除点赞信息
     * 
     * @param id 点赞主键
     * @return 结果
     */
    @Override
    public int deleteAppLikeById(Long id)
    {
        return appLikeMapper.deleteAppLikeById(id);
    }
}
