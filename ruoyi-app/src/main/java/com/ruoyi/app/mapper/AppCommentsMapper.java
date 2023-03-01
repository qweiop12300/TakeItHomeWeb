package com.ruoyi.app.mapper;

import java.util.List;
import com.ruoyi.app.domain.AppComments;

/**
 * 评论Mapper接口
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
public interface AppCommentsMapper 
{
    /**
     * 查询评论
     * 
     * @param id 评论主键
     * @return 评论
     */
    public AppComments selectAppCommentsById(Long id);

    /**
     * 查询评论列表
     * 
     * @param appComments 评论
     * @return 评论集合
     */
    public List<AppComments> selectAppCommentsList(AppComments appComments);

    /**
     * 新增评论
     * 
     * @param appComments 评论
     * @return 结果
     */
    public int insertAppComments(AppComments appComments);

    /**
     * 修改评论
     * 
     * @param appComments 评论
     * @return 结果
     */
    public int updateAppComments(AppComments appComments);

    /**
     * 删除评论
     * 
     * @param id 评论主键
     * @return 结果
     */
    public int deleteAppCommentsById(Long id);

    /**
     * 批量删除评论
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAppCommentsByIds(Long[] ids);
}
