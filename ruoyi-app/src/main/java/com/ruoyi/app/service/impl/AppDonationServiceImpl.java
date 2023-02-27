package com.ruoyi.app.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.app.mapper.AppDonationMapper;
import com.ruoyi.app.domain.AppDonation;
import com.ruoyi.app.service.IAppDonationService;

/**
 * 捐赠Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-02-27
 */
@Service
public class AppDonationServiceImpl implements IAppDonationService 
{
    @Autowired
    private AppDonationMapper appDonationMapper;

    /**
     * 查询捐赠
     * 
     * @param id 捐赠主键
     * @return 捐赠
     */
    @Override
    public AppDonation selectAppDonationById(Long id)
    {
        return appDonationMapper.selectAppDonationById(id);
    }

    /**
     * 查询捐赠列表
     * 
     * @param appDonation 捐赠
     * @return 捐赠
     */
    @Override
    public List<AppDonation> selectAppDonationList(AppDonation appDonation)
    {
        return appDonationMapper.selectAppDonationList(appDonation);
    }

    /**
     * 新增捐赠
     * 
     * @param appDonation 捐赠
     * @return 结果
     */
    @Override
    public int insertAppDonation(AppDonation appDonation)
    {
        return appDonationMapper.insertAppDonation(appDonation);
    }

    /**
     * 修改捐赠
     * 
     * @param appDonation 捐赠
     * @return 结果
     */
    @Override
    public int updateAppDonation(AppDonation appDonation)
    {
        return appDonationMapper.updateAppDonation(appDonation);
    }

    /**
     * 批量删除捐赠
     * 
     * @param ids 需要删除的捐赠主键
     * @return 结果
     */
    @Override
    public int deleteAppDonationByIds(Long[] ids)
    {
        return appDonationMapper.deleteAppDonationByIds(ids);
    }

    /**
     * 删除捐赠信息
     * 
     * @param id 捐赠主键
     * @return 结果
     */
    @Override
    public int deleteAppDonationById(Long id)
    {
        return appDonationMapper.deleteAppDonationById(id);
    }
}
