package com.ruoyi.app.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.app.mapper.UserTypeMapper;
import com.ruoyi.app.domain.UserType;
import com.ruoyi.app.service.IUserTypeService;

/**
 * 用户类型Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
@Service
public class UserTypeServiceImpl implements IUserTypeService 
{
    @Autowired
    private UserTypeMapper userTypeMapper;

    /**
     * 查询用户类型
     * 
     * @param id 用户类型主键
     * @return 用户类型
     */
    @Override
    public UserType selectUserTypeById(Long id)
    {
        return userTypeMapper.selectUserTypeById(id);
    }

    /**
     * 查询用户类型列表
     * 
     * @param userType 用户类型
     * @return 用户类型
     */
    @Override
    public List<UserType> selectUserTypeList(UserType userType)
    {
        return userTypeMapper.selectUserTypeList(userType);
    }

    /**
     * 新增用户类型
     * 
     * @param userType 用户类型
     * @return 结果
     */
    @Override
    public int insertUserType(UserType userType)
    {
        return userTypeMapper.insertUserType(userType);
    }

    /**
     * 修改用户类型
     * 
     * @param userType 用户类型
     * @return 结果
     */
    @Override
    public int updateUserType(UserType userType)
    {
        return userTypeMapper.updateUserType(userType);
    }

    /**
     * 批量删除用户类型
     * 
     * @param ids 需要删除的用户类型主键
     * @return 结果
     */
    @Override
    public int deleteUserTypeByIds(Long[] ids)
    {
        return userTypeMapper.deleteUserTypeByIds(ids);
    }

    /**
     * 删除用户类型信息
     * 
     * @param id 用户类型主键
     * @return 结果
     */
    @Override
    public int deleteUserTypeById(Long id)
    {
        return userTypeMapper.deleteUserTypeById(id);
    }
}
