package com.ruoyi.app.service;

import java.util.List;
import com.ruoyi.app.domain.AppTopic;

/**
 * 话题Service接口
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
public interface IAppTopicService 
{
    /**
     * 查询话题
     * 
     * @param id 话题主键
     * @return 话题
     */
    public AppTopic selectAppTopicById(Long id);

    /**
     * 查询话题列表
     * 
     * @param appTopic 话题
     * @return 话题集合
     */
    public List<AppTopic> selectAppTopicList(AppTopic appTopic);

    /**
     * 新增话题
     * 
     * @param appTopic 话题
     * @return 结果
     */
    public int insertAppTopic(AppTopic appTopic);

    /**
     * 修改话题
     * 
     * @param appTopic 话题
     * @return 结果
     */
    public int updateAppTopic(AppTopic appTopic);

    /**
     * 批量删除话题
     * 
     * @param ids 需要删除的话题主键集合
     * @return 结果
     */
    public int deleteAppTopicByIds(Long[] ids);

    /**
     * 删除话题信息
     * 
     * @param id 话题主键
     * @return 结果
     */
    public int deleteAppTopicById(Long id);
}
