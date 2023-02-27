package com.ruoyi.app.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.app.mapper.AppCommentsMapper;
import com.ruoyi.app.domain.AppComments;
import com.ruoyi.app.service.IAppCommentsService;

/**
 * 评论Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-02-27
 */
@Service
public class AppCommentsServiceImpl implements IAppCommentsService 
{
    @Autowired
    private AppCommentsMapper appCommentsMapper;

    /**
     * 查询评论
     * 
     * @param id 评论主键
     * @return 评论
     */
    @Override
    public AppComments selectAppCommentsById(Long id)
    {
        return appCommentsMapper.selectAppCommentsById(id);
    }

    /**
     * 查询评论列表
     * 
     * @param appComments 评论
     * @return 评论
     */
    @Override
    public List<AppComments> selectAppCommentsList(AppComments appComments)
    {
        return appCommentsMapper.selectAppCommentsList(appComments);
    }

    /**
     * 新增评论
     * 
     * @param appComments 评论
     * @return 结果
     */
    @Override
    public int insertAppComments(AppComments appComments)
    {
        return appCommentsMapper.insertAppComments(appComments);
    }

    /**
     * 修改评论
     * 
     * @param appComments 评论
     * @return 结果
     */
    @Override
    public int updateAppComments(AppComments appComments)
    {
        return appCommentsMapper.updateAppComments(appComments);
    }

    /**
     * 批量删除评论
     * 
     * @param ids 需要删除的评论主键
     * @return 结果
     */
    @Override
    public int deleteAppCommentsByIds(Long[] ids)
    {
        return appCommentsMapper.deleteAppCommentsByIds(ids);
    }

    /**
     * 删除评论信息
     * 
     * @param id 评论主键
     * @return 结果
     */
    @Override
    public int deleteAppCommentsById(Long id)
    {
        return appCommentsMapper.deleteAppCommentsById(id);
    }
}
