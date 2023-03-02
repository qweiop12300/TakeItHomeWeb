package com.ruoyi.app.service.impl;

import java.util.List;

import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.app.mapper.AppMessageMapper;
import com.ruoyi.app.domain.AppMessage;
import com.ruoyi.app.service.IAppMessageService;

/**
 * 消息Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
@Service
public class AppMessageServiceImpl implements IAppMessageService 
{
    @Autowired
    private AppMessageMapper appMessageMapper;

    /**
     * 查询消息
     * 
     * @param id 消息主键
     * @return 消息
     */
    @Override
    public AppMessage selectAppMessageById(Long id)
    {
        return appMessageMapper.selectAppMessageById(id);
    }

    /**
     * 查询消息列表
     * 
     * @param appMessage 消息
     * @return 消息
     */
    @Override
    public List<AppMessage> selectAppMessageList(AppMessage appMessage)
    {
        return appMessageMapper.selectAppMessageList(appMessage);
    }

    /**
     * 新增消息
     * 
     * @param appMessage 消息
     * @return 结果
     */
    @Override
    public int insertAppMessage(AppMessage appMessage)
    {
        appMessage.setUid(SecurityUtils.getUserId());
        return appMessageMapper.insertAppMessage(appMessage);
    }

    /**
     * 修改消息
     * 
     * @param appMessage 消息
     * @return 结果
     */
    @Override
    public int updateAppMessage(AppMessage appMessage)
    {
        return appMessageMapper.updateAppMessage(appMessage);
    }

    /**
     * 批量删除消息
     * 
     * @param ids 需要删除的消息主键
     * @return 结果
     */
    @Override
    public int deleteAppMessageByIds(Long[] ids)
    {
        return appMessageMapper.deleteAppMessageByIds(ids);
    }

    /**
     * 删除消息信息
     * 
     * @param id 消息主键
     * @return 结果
     */
    @Override
    public int deleteAppMessageById(Long id)
    {
        if (selectAppMessageById(id)!=null&&selectAppMessageById(id).getUid().equals(SecurityUtils.getUserId())){
            return appMessageMapper.deleteAppMessageById(id);
        }
        return 0;
    }
}
