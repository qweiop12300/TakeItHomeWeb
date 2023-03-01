package com.ruoyi.app.service;

import java.util.List;
import com.ruoyi.app.domain.AppDonation;

/**
 * 捐赠Service接口
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
public interface IAppDonationService 
{
    /**
     * 查询捐赠
     * 
     * @param id 捐赠主键
     * @return 捐赠
     */
    public AppDonation selectAppDonationById(Long id);

    /**
     * 查询捐赠列表
     * 
     * @param appDonation 捐赠
     * @return 捐赠集合
     */
    public List<AppDonation> selectAppDonationList(AppDonation appDonation);

    /**
     * 新增捐赠
     * 
     * @param appDonation 捐赠
     * @return 结果
     */
    public int insertAppDonation(AppDonation appDonation);

    /**
     * 修改捐赠
     * 
     * @param appDonation 捐赠
     * @return 结果
     */
    public int updateAppDonation(AppDonation appDonation);

    /**
     * 批量删除捐赠
     * 
     * @param ids 需要删除的捐赠主键集合
     * @return 结果
     */
    public int deleteAppDonationByIds(Long[] ids);

    /**
     * 删除捐赠信息
     * 
     * @param id 捐赠主键
     * @return 结果
     */
    public int deleteAppDonationById(Long id);
}
