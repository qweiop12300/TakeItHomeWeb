package com.ruoyi.app.mapper;

import java.util.List;
import com.ruoyi.app.domain.UserType;

/**
 * 用户类型Mapper接口
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
public interface UserTypeMapper 
{
    /**
     * 查询用户类型
     * 
     * @param id 用户类型主键
     * @return 用户类型
     */
    public UserType selectUserTypeById(Long id);

    /**
     * 查询用户类型列表
     * 
     * @param userType 用户类型
     * @return 用户类型集合
     */
    public List<UserType> selectUserTypeList(UserType userType);

    /**
     * 新增用户类型
     * 
     * @param userType 用户类型
     * @return 结果
     */
    public int insertUserType(UserType userType);

    /**
     * 修改用户类型
     * 
     * @param userType 用户类型
     * @return 结果
     */
    public int updateUserType(UserType userType);

    /**
     * 删除用户类型
     * 
     * @param id 用户类型主键
     * @return 结果
     */
    public int deleteUserTypeById(Long id);

    /**
     * 批量删除用户类型
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteUserTypeByIds(Long[] ids);
}
