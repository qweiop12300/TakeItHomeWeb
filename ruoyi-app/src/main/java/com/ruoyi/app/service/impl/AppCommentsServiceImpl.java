package com.ruoyi.app.service.impl;

import java.util.List;

import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.app.mapper.AppCommentsMapper;
import com.ruoyi.app.domain.AppComments;
import com.ruoyi.app.service.IAppCommentsService;

/**
 * 评论Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-02-28
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
        appComments.setUid(SecurityUtils.getUserId());
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
        appComments.setUid(SecurityUtils.getUserId());
        AppComments old = appCommentsMapper.selectAppCommentsById(appComments.getId());
        if (old!=null&&old.getUid().equals(SecurityUtils.getUserId())){
            return appCommentsMapper.updateAppComments(appComments);
        }
        return 0;
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
        AppComments old = appCommentsMapper.selectAppCommentsById(id);
        if (old!=null&&old.getUid().equals(SecurityUtils.getUserId())){
            return appCommentsMapper.deleteAppCommentsById(id);
        }
        return 0;
    }
}
