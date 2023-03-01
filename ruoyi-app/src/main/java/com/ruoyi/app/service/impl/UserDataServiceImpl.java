package com.ruoyi.app.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.app.mapper.UserDataMapper;
import com.ruoyi.app.domain.UserData;
import com.ruoyi.app.service.IUserDataService;

/**
 * 用户数据扩展Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
@Service
public class UserDataServiceImpl implements IUserDataService 
{
    @Autowired
    private UserDataMapper userDataMapper;

    /**
     * 查询用户数据扩展
     * 
     * @param uid 用户数据扩展主键
     * @return 用户数据扩展
     */
    @Override
    public UserData selectUserDataByUid(Long uid)
    {
        return userDataMapper.selectUserDataByUid(uid);
    }

    /**
     * 查询用户数据扩展列表
     * 
     * @param userData 用户数据扩展
     * @return 用户数据扩展
     */
    @Override
    public List<UserData> selectUserDataList(UserData userData)
    {
        return userDataMapper.selectUserDataList(userData);
    }

    /**
     * 新增用户数据扩展
     * 
     * @param userData 用户数据扩展
     * @return 结果
     */
    @Override
    public int insertUserData(UserData userData)
    {
        return userDataMapper.insertUserData(userData);
    }

    /**
     * 修改用户数据扩展
     * 
     * @param userData 用户数据扩展
     * @return 结果
     */
    @Override
    public int updateUserData(UserData userData)
    {
        return userDataMapper.updateUserData(userData);
    }

    /**
     * 批量删除用户数据扩展
     * 
     * @param uids 需要删除的用户数据扩展主键
     * @return 结果
     */
    @Override
    public int deleteUserDataByUids(Long[] uids)
    {
        return userDataMapper.deleteUserDataByUids(uids);
    }

    /**
     * 删除用户数据扩展信息
     * 
     * @param uid 用户数据扩展主键
     * @return 结果
     */
    @Override
    public int deleteUserDataByUid(Long uid)
    {
        return userDataMapper.deleteUserDataByUid(uid);
    }
}
