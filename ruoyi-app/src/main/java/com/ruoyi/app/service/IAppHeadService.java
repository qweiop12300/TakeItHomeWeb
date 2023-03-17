package com.ruoyi.app.service;

import java.util.List;
import com.ruoyi.app.domain.AppHead;

/**
 * 公告Service接口
 * 
 * @author ruoyi
 * @date 2023-03-16
 */
public interface IAppHeadService 
{
    /**
     * 查询公告
     * 
     * @param id 公告主键
     * @return 公告
     */
    public AppHead selectAppHeadById(Long id);

    /**
     * 查询公告列表
     * 
     * @param appHead 公告
     * @return 公告集合
     */
    public List<AppHead> selectAppHeadList(AppHead appHead);

    /**
     * 新增公告
     * 
     * @param appHead 公告
     * @return 结果
     */
    public int insertAppHead(AppHead appHead);

    /**
     * 修改公告
     * 
     * @param appHead 公告
     * @return 结果
     */
    public int updateAppHead(AppHead appHead);

    /**
     * 批量删除公告
     * 
     * @param ids 需要删除的公告主键集合
     * @return 结果
     */
    public int deleteAppHeadByIds(Long[] ids);

    /**
     * 删除公告信息
     * 
     * @param id 公告主键
     * @return 结果
     */
    public int deleteAppHeadById(Long id);
}
