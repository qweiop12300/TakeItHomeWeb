package com.ruoyi.app.service.impl;

import java.util.Date;
import java.util.List;

import com.ruoyi.app.domain.AppMessage;
import com.ruoyi.app.domain.AppPost;
import com.ruoyi.app.mapper.AppMessageMapper;
import com.ruoyi.app.mapper.AppPostMapper;
import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.app.mapper.AppCollectionMapper;
import com.ruoyi.app.domain.AppCollection;
import com.ruoyi.app.service.IAppCollectionService;

/**
 * 收藏Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
@Service
public class AppCollectionServiceImpl implements IAppCollectionService 
{
    @Autowired
    private AppCollectionMapper appCollectionMapper;

    @Autowired
    private AppPostMapper appPostMapper;

    @Autowired
    private AppMessageMapper appMessageMapper;

    /**
     * 查询收藏
     * 
     * @param id 收藏主键
     * @return 收藏
     */
    @Override
    public AppCollection selectAppCollectionById(Long id)
    {
        return appCollectionMapper.selectAppCollectionById(id);
    }

    /**
     * 查询收藏列表
     * 
     * @param appCollection 收藏
     * @return 收藏
     */
    @Override
    public List<AppCollection> selectAppCollectionList(AppCollection appCollection)
    {
        return appCollectionMapper.selectAppCollectionList(appCollection);
    }

    /**
     * 新增收藏
     * 
     * @param appCollection 收藏
     * @return 结果
     */
    @Override
    public int insertAppCollection(AppCollection appCollection)
    {
        appCollection.setUid(SecurityUtils.getUserId());
        List<AppCollection> list = appCollectionMapper.selectAppCollectionList(appCollection);
        AppPost appPost = appPostMapper.selectAppPostById(appCollection.getPid());
        if (list.size()==0){
            appCollection.setCreateDate(new Date());
            appPost.setCollectionNumber(appPost.getCollectionNumber()+1);
            appPostMapper.updateAppPost(appPost);

            appMessageMapper.insertNewAppMessage(new AppMessage(appCollection.getUid(),appPost.getUid(),"收藏", appPost.getId(),2L,new Date()));

            return appCollectionMapper.insertAppCollection(appCollection);
        }else{
            AppCollection appCollection1 = list.get(0);
            appPost.setCollectionNumber(appPost.getCollectionNumber()-1);
            appPostMapper.updateAppPost(appPost);
            appCollectionMapper.deleteAppCollectionById(appCollection1.getId());
        }
        return 0;
    }

    /**
     * 修改收藏
     * 
     * @param appCollection 收藏
     * @return 结果
     */
    @Override
    public int updateAppCollection(AppCollection appCollection)
    {
        return appCollectionMapper.updateAppCollection(appCollection);
    }

    /**
     * 批量删除收藏
     * 
     * @param ids 需要删除的收藏主键
     * @return 结果
     */
    @Override
    public int deleteAppCollectionByIds(Long[] ids)
    {
        return appCollectionMapper.deleteAppCollectionByIds(ids);
    }

    /**
     * 删除收藏信息
     * 
     * @param id 收藏主键
     * @return 结果
     */
    @Override
    public int deleteAppCollectionById(Long id)
    {
        return appCollectionMapper.deleteAppCollectionById(id);
    }
}
