package com.ruoyi.app.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ruoyi.app.domain.AppMessage;
import com.ruoyi.app.mapper.AppMessageMapper;
import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.app.mapper.AppConcernMapper;
import com.ruoyi.app.domain.AppConcern;
import com.ruoyi.app.service.IAppConcernService;

/**
 * 关注Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
@Service
public class AppConcernServiceImpl implements IAppConcernService 
{
    @Autowired
    private AppConcernMapper appConcernMapper;

    @Autowired
    private AppMessageMapper appMessageMapper;



    /**
     * 查询关注
     * 
     * @param id 关注主键
     * @return 关注
     */
    @Override
    public AppConcern selectAppConcernById(Long id)
    {
        return appConcernMapper.selectAppConcernById(id);
    }

    /**
     * 查询关注列表
     * 
     * @param appConcern 关注
     * @return 关注
     */
    @Override
    public List<AppConcern> selectAppConcernList(AppConcern appConcern)
    {
        if (appConcern.getUid()!=null){
            if (appConcern.getUid()==-1){
                appConcern.setUid(SecurityUtils.getUserId());
            }

            return appConcernMapper.selectAppConcernList(appConcern);
        }
        return new ArrayList<AppConcern>();
    }

    /**
     * 新增关注
     * 
     * @param appConcern 关注
     * @return 结果
     */
    @Override
    public int insertAppConcern(AppConcern appConcern)
    {
        appConcern.setUid(SecurityUtils.getUserId());
        List<AppConcern> list = appConcernMapper.selectAppConcernList(appConcern);
        if (list.size()==0){
            if (appConcern.getUid()!=null){
                appMessageMapper.insertNewAppMessage(new AppMessage(appConcern.getUid(),appConcern.getToUid(),"关注", null,3L,new Date()));
            }
            return appConcernMapper.insertAppConcern(appConcern);
        }else {
            appConcernMapper.deleteAppConcernById(list.get(0).getId());
        }
        return 0;
    }

    /**
     * 修改关注
     * 
     * @param appConcern 关注
     * @return 结果
     */
    @Override
    public int updateAppConcern(AppConcern appConcern)
    {
        return appConcernMapper.updateAppConcern(appConcern);
    }

    /**
     * 批量删除关注
     * 
     * @param ids 需要删除的关注主键
     * @return 结果
     */
    @Override
    public int deleteAppConcernByIds(Long[] ids)
    {

        return appConcernMapper.deleteAppConcernByIds(ids);
    }

    /**
     * 删除关注信息
     * 
     * @param id 关注主键
     * @return 结果
     */
    @Override
    public int deleteAppConcernById(Long id)
    {
        return appConcernMapper.deleteAppConcernById(id);
    }
}
