package com.ruoyi.app.mapper;

import java.util.List;
import com.ruoyi.app.domain.AppTopic;

/**
 * 话题Mapper接口
 * 
 * @author ruoyi
 * @date 2023-02-27
 */
public interface AppTopicMapper 
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
     * 删除话题
     * 
     * @param id 话题主键
     * @return 结果
     */
    public int deleteAppTopicById(Long id);

    /**
     * 批量删除话题
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAppTopicByIds(Long[] ids);
}
