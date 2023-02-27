package com.ruoyi.app.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.app.mapper.AppCommentsLikeMapper;
import com.ruoyi.app.domain.AppCommentsLike;
import com.ruoyi.app.service.IAppCommentsLikeService;

/**
 * 评论点赞Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-02-27
 */
@Service
public class AppCommentsLikeServiceImpl implements IAppCommentsLikeService 
{
    @Autowired
    private AppCommentsLikeMapper appCommentsLikeMapper;

    /**
     * 查询评论点赞
     * 
     * @param id 评论点赞主键
     * @return 评论点赞
     */
    @Override
    public AppCommentsLike selectAppCommentsLikeById(Long id)
    {
        return appCommentsLikeMapper.selectAppCommentsLikeById(id);
    }

    /**
     * 查询评论点赞列表
     * 
     * @param appCommentsLike 评论点赞
     * @return 评论点赞
     */
    @Override
    public List<AppCommentsLike> selectAppCommentsLikeList(AppCommentsLike appCommentsLike)
    {
        return appCommentsLikeMapper.selectAppCommentsLikeList(appCommentsLike);
    }

    /**
     * 新增评论点赞
     * 
     * @param appCommentsLike 评论点赞
     * @return 结果
     */
    @Override
    public int insertAppCommentsLike(AppCommentsLike appCommentsLike)
    {
        return appCommentsLikeMapper.insertAppCommentsLike(appCommentsLike);
    }

    /**
     * 修改评论点赞
     * 
     * @param appCommentsLike 评论点赞
     * @return 结果
     */
    @Override
    public int updateAppCommentsLike(AppCommentsLike appCommentsLike)
    {
        return appCommentsLikeMapper.updateAppCommentsLike(appCommentsLike);
    }

    /**
     * 批量删除评论点赞
     * 
     * @param ids 需要删除的评论点赞主键
     * @return 结果
     */
    @Override
    public int deleteAppCommentsLikeByIds(Long[] ids)
    {
        return appCommentsLikeMapper.deleteAppCommentsLikeByIds(ids);
    }

    /**
     * 删除评论点赞信息
     * 
     * @param id 评论点赞主键
     * @return 结果
     */
    @Override
    public int deleteAppCommentsLikeById(Long id)
    {
        return appCommentsLikeMapper.deleteAppCommentsLikeById(id);
    }
}
