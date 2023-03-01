package com.ruoyi.app.service;

import java.util.List;
import com.ruoyi.app.domain.AppCollection;

/**
 * 收藏Service接口
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
public interface IAppCollectionService 
{
    /**
     * 查询收藏
     * 
     * @param id 收藏主键
     * @return 收藏
     */
    public AppCollection selectAppCollectionById(Long id);

    /**
     * 查询收藏列表
     * 
     * @param appCollection 收藏
     * @return 收藏集合
     */
    public List<AppCollection> selectAppCollectionList(AppCollection appCollection);

    /**
     * 新增收藏
     * 
     * @param appCollection 收藏
     * @return 结果
     */
    public int insertAppCollection(AppCollection appCollection);

    /**
     * 修改收藏
     * 
     * @param appCollection 收藏
     * @return 结果
     */
    public int updateAppCollection(AppCollection appCollection);

    /**
     * 批量删除收藏
     * 
     * @param ids 需要删除的收藏主键集合
     * @return 结果
     */
    public int deleteAppCollectionByIds(Long[] ids);

    /**
     * 删除收藏信息
     * 
     * @param id 收藏主键
     * @return 结果
     */
    public int deleteAppCollectionById(Long id);
}
