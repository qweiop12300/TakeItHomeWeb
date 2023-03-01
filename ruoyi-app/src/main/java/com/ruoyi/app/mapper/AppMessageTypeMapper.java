package com.ruoyi.app.mapper;

import java.util.List;
import com.ruoyi.app.domain.AppMessageType;

/**
 * 信息类型Mapper接口
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
public interface AppMessageTypeMapper 
{
    /**
     * 查询信息类型
     * 
     * @param id 信息类型主键
     * @return 信息类型
     */
    public AppMessageType selectAppMessageTypeById(Long id);

    /**
     * 查询信息类型列表
     * 
     * @param appMessageType 信息类型
     * @return 信息类型集合
     */
    public List<AppMessageType> selectAppMessageTypeList(AppMessageType appMessageType);

    /**
     * 新增信息类型
     * 
     * @param appMessageType 信息类型
     * @return 结果
     */
    public int insertAppMessageType(AppMessageType appMessageType);

    /**
     * 修改信息类型
     * 
     * @param appMessageType 信息类型
     * @return 结果
     */
    public int updateAppMessageType(AppMessageType appMessageType);

    /**
     * 删除信息类型
     * 
     * @param id 信息类型主键
     * @return 结果
     */
    public int deleteAppMessageTypeById(Long id);

    /**
     * 批量删除信息类型
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAppMessageTypeByIds(Long[] ids);
}
