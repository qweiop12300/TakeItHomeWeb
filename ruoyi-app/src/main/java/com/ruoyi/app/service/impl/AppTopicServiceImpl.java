package com.ruoyi.app.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.app.mapper.AppTopicMapper;
import com.ruoyi.app.domain.AppTopic;
import com.ruoyi.app.service.IAppTopicService;

/**
 * 话题Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
@Service
public class AppTopicServiceImpl implements IAppTopicService 
{
    @Autowired
    private AppTopicMapper appTopicMapper;

    /**
     * 查询话题
     * 
     * @param id 话题主键
     * @return 话题
     */
    @Override
    public AppTopic selectAppTopicById(Long id)
    {
        return appTopicMapper.selectAppTopicById(id);
    }

    /**
     * 查询话题列表
     * 
     * @param appTopic 话题
     * @return 话题
     */
    @Override
    public List<AppTopic> selectAppTopicList(AppTopic appTopic)
    {
        return appTopicMapper.selectAppTopicList(appTopic);
    }

    /**
     * 新增话题
     * 
     * @param appTopic 话题
     * @return 结果
     */
    @Override
    public int insertAppTopic(AppTopic appTopic)
    {
        return appTopicMapper.insertAppTopic(appTopic);
    }

    /**
     * 修改话题
     * 
     * @param appTopic 话题
     * @return 结果
     */
    @Override
    public int updateAppTopic(AppTopic appTopic)
    {
        return appTopicMapper.updateAppTopic(appTopic);
    }

    /**
     * 批量删除话题
     * 
     * @param ids 需要删除的话题主键
     * @return 结果
     */
    @Override
    public int deleteAppTopicByIds(Long[] ids)
    {
        return appTopicMapper.deleteAppTopicByIds(ids);
    }

    /**
     * 删除话题信息
     * 
     * @param id 话题主键
     * @return 结果
     */
    @Override
    public int deleteAppTopicById(Long id)
    {
        return appTopicMapper.deleteAppTopicById(id);
    }
}
