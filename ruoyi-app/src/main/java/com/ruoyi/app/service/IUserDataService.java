package com.ruoyi.app.service;

import java.util.List;
import com.ruoyi.app.domain.UserData;

/**
 * 用户数据扩展Service接口
 * 
 * @author ruoyi
 * @date 2023-02-27
 */
public interface IUserDataService 
{
    /**
     * 查询用户数据扩展
     * 
     * @param uid 用户数据扩展主键
     * @return 用户数据扩展
     */
    public UserData selectUserDataByUid(Long uid);

    /**
     * 查询用户数据扩展列表
     * 
     * @param userData 用户数据扩展
     * @return 用户数据扩展集合
     */
    public List<UserData> selectUserDataList(UserData userData);

    /**
     * 新增用户数据扩展
     * 
     * @param userData 用户数据扩展
     * @return 结果
     */
    public int insertUserData(UserData userData);

    /**
     * 修改用户数据扩展
     * 
     * @param userData 用户数据扩展
     * @return 结果
     */
    public int updateUserData(UserData userData);

    /**
     * 批量删除用户数据扩展
     * 
     * @param uids 需要删除的用户数据扩展主键集合
     * @return 结果
     */
    public int deleteUserDataByUids(Long[] uids);

    /**
     * 删除用户数据扩展信息
     * 
     * @param uid 用户数据扩展主键
     * @return 结果
     */
    public int deleteUserDataByUid(Long uid);
}
