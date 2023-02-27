package com.ruoyi.app.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.app.mapper.AppCollectionMapper;
import com.ruoyi.app.domain.AppCollection;
import com.ruoyi.app.service.IAppCollectionService;

/**
 * 收藏Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-02-27
 */
@Service
public class AppCollectionServiceImpl implements IAppCollectionService 
{
    @Autowired
    private AppCollectionMapper appCollectionMapper;

    /**
     * 查询收藏
     * 
     * @param uid 收藏主键
     * @return 收藏
     */
    @Override
    public AppCollection selectAppCollectionByUid(Long uid)
    {
        return appCollectionMapper.selectAppCollectionByUid(uid);
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
        return appCollectionMapper.insertAppCollection(appCollection);
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
     * @param uids 需要删除的收藏主键
     * @return 结果
     */
    @Override
    public int deleteAppCollectionByUids(Long[] uids)
    {
        return appCollectionMapper.deleteAppCollectionByUids(uids);
    }

    /**
     * 删除收藏信息
     * 
     * @param uid 收藏主键
     * @return 结果
     */
    @Override
    public int deleteAppCollectionByUid(Long uid)
    {
        return appCollectionMapper.deleteAppCollectionByUid(uid);
    }
}
