package com.ruoyi.app.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.app.mapper.AppPostMapper;
import com.ruoyi.app.domain.AppPost;
import com.ruoyi.app.service.IAppPostService;

/**
 * 动态Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
@Service
public class AppPostServiceImpl implements IAppPostService 
{
    @Autowired
    private AppPostMapper appPostMapper;

    /**
     * 查询动态
     * 
     * @param id 动态主键
     * @return 动态
     */
    @Override
    public AppPost selectAppPostById(Long id)
    {
        return appPostMapper.selectAppPostById(id);
    }

    /**
     * 查询动态列表
     * 
     * @param appPost 动态
     * @return 动态
     */
    @Override
    public List<AppPost> selectAppPostList(AppPost appPost)
    {
        return appPostMapper.selectAppPostList(appPost);
    }

    /**
     * 新增动态
     * 
     * @param appPost 动态
     * @return 结果
     */
    @Override
    public int insertAppPost(AppPost appPost)
    {
        return appPostMapper.insertAppPost(appPost);
    }

    /**
     * 修改动态
     * 
     * @param appPost 动态
     * @return 结果
     */
    @Override
    public int updateAppPost(AppPost appPost)
    {
        return appPostMapper.updateAppPost(appPost);
    }

    /**
     * 批量删除动态
     * 
     * @param ids 需要删除的动态主键
     * @return 结果
     */
    @Override
    public int deleteAppPostByIds(Long[] ids)
    {
        return appPostMapper.deleteAppPostByIds(ids);
    }

    /**
     * 删除动态信息
     * 
     * @param id 动态主键
     * @return 结果
     */
    @Override
    public int deleteAppPostById(Long id)
    {
        return appPostMapper.deleteAppPostById(id);
    }
}
