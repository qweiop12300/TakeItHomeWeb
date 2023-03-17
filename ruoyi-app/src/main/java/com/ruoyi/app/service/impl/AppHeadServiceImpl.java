package com.ruoyi.app.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.app.mapper.AppHeadMapper;
import com.ruoyi.app.domain.AppHead;
import com.ruoyi.app.service.IAppHeadService;

/**
 * 公告Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-03-16
 */
@Service
public class AppHeadServiceImpl implements IAppHeadService 
{
    @Autowired
    private AppHeadMapper appHeadMapper;

    /**
     * 查询公告
     * 
     * @param id 公告主键
     * @return 公告
     */
    @Override
    public AppHead selectAppHeadById(Long id)
    {
        return appHeadMapper.selectAppHeadById(id);
    }

    /**
     * 查询公告列表
     * 
     * @param appHead 公告
     * @return 公告
     */
    @Override
    public List<AppHead> selectAppHeadList(AppHead appHead)
    {
        return appHeadMapper.selectAppHeadList(appHead);
    }

    /**
     * 新增公告
     * 
     * @param appHead 公告
     * @return 结果
     */
    @Override
    public int insertAppHead(AppHead appHead)
    {
        return appHeadMapper.insertAppHead(appHead);
    }

    /**
     * 修改公告
     * 
     * @param appHead 公告
     * @return 结果
     */
    @Override
    public int updateAppHead(AppHead appHead)
    {
        return appHeadMapper.updateAppHead(appHead);
    }

    /**
     * 批量删除公告
     * 
     * @param ids 需要删除的公告主键
     * @return 结果
     */
    @Override
    public int deleteAppHeadByIds(Long[] ids)
    {
        return appHeadMapper.deleteAppHeadByIds(ids);
    }

    /**
     * 删除公告信息
     * 
     * @param id 公告主键
     * @return 结果
     */
    @Override
    public int deleteAppHeadById(Long id)
    {
        return appHeadMapper.deleteAppHeadById(id);
    }
}
