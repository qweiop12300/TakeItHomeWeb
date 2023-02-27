package com.ruoyi.app.mapper;

import java.util.List;
import com.ruoyi.app.domain.AppMessage;

/**
 * 消息Mapper接口
 * 
 * @author ruoyi
 * @date 2023-02-27
 */
public interface AppMessageMapper 
{
    /**
     * 查询消息
     * 
     * @param id 消息主键
     * @return 消息
     */
    public AppMessage selectAppMessageById(Long id);

    /**
     * 查询消息列表
     * 
     * @param appMessage 消息
     * @return 消息集合
     */
    public List<AppMessage> selectAppMessageList(AppMessage appMessage);

    /**
     * 新增消息
     * 
     * @param appMessage 消息
     * @return 结果
     */
    public int insertAppMessage(AppMessage appMessage);

    /**
     * 修改消息
     * 
     * @param appMessage 消息
     * @return 结果
     */
    public int updateAppMessage(AppMessage appMessage);

    /**
     * 删除消息
     * 
     * @param id 消息主键
     * @return 结果
     */
    public int deleteAppMessageById(Long id);

    /**
     * 批量删除消息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAppMessageByIds(Long[] ids);
}
