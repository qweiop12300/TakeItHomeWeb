package com.ruoyi.app.mapper;

import java.util.List;
import com.ruoyi.app.domain.AppCommentsLike;

/**
 * 评论点赞Mapper接口
 * 
 * @author ruoyi
 * @date 2023-02-27
 */
public interface AppCommentsLikeMapper 
{
    /**
     * 查询评论点赞
     * 
     * @param id 评论点赞主键
     * @return 评论点赞
     */
    public AppCommentsLike selectAppCommentsLikeById(Long id);

    /**
     * 查询评论点赞列表
     * 
     * @param appCommentsLike 评论点赞
     * @return 评论点赞集合
     */
    public List<AppCommentsLike> selectAppCommentsLikeList(AppCommentsLike appCommentsLike);

    /**
     * 新增评论点赞
     * 
     * @param appCommentsLike 评论点赞
     * @return 结果
     */
    public int insertAppCommentsLike(AppCommentsLike appCommentsLike);

    /**
     * 修改评论点赞
     * 
     * @param appCommentsLike 评论点赞
     * @return 结果
     */
    public int updateAppCommentsLike(AppCommentsLike appCommentsLike);

    /**
     * 删除评论点赞
     * 
     * @param id 评论点赞主键
     * @return 结果
     */
    public int deleteAppCommentsLikeById(Long id);

    /**
     * 批量删除评论点赞
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAppCommentsLikeByIds(Long[] ids);
}
