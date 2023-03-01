package com.ruoyi.app.mapper;

import java.util.List;
import com.ruoyi.app.domain.AppPost;

/**
 * 动态Mapper接口
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
public interface AppPostMapper 
{
    /**
     * 查询动态
     * 
     * @param id 动态主键
     * @return 动态
     */
    public AppPost selectAppPostById(Long id);

    /**
     * 查询动态列表
     * 
     * @param appPost 动态
     * @return 动态集合
     */
    public List<AppPost> selectAppPostList(AppPost appPost);

    /**
     * 新增动态
     * 
     * @param appPost 动态
     * @return 结果
     */
    public int insertAppPost(AppPost appPost);

    /**
     * 修改动态
     * 
     * @param appPost 动态
     * @return 结果
     */
    public int updateAppPost(AppPost appPost);

    /**
     * 删除动态
     * 
     * @param id 动态主键
     * @return 结果
     */
    public int deleteAppPostById(Long id);

    /**
     * 批量删除动态
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAppPostByIds(Long[] ids);
}
