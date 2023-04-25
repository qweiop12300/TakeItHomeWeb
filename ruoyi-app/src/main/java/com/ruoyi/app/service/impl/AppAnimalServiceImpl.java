package com.ruoyi.app.service.impl;

import java.util.Date;
import java.util.List;

import com.ruoyi.app.domain.AppAnimalState;
import com.ruoyi.app.mapper.AppAnimalStateMapper;
import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.app.mapper.AppAnimalMapper;
import com.ruoyi.app.domain.AppAnimal;
import com.ruoyi.app.service.IAppAnimalService;

/**
 * 动物信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-03-01
 */
@Service
public class AppAnimalServiceImpl implements IAppAnimalService 
{
    @Autowired
    private AppAnimalMapper appAnimalMapper;

    @Autowired
    private AppAnimalStateMapper appAnimalStateMapper;

    /**
     * 查询动物信息
     * 
     * @param id 动物信息主键
     * @return 动物信息
     */
    @Override
    public AppAnimal selectAppAnimalById(Long id)
    {
        return appAnimalMapper.selectAppAnimalById(id);
    }

    /**
     * 查询动物信息列表
     * 
     * @param appAnimal 动物信息
     * @return 动物信息
     */
    @Override
    public List<AppAnimal> selectAppAnimalList(AppAnimal appAnimal)
    {
        return appAnimalMapper.selectAppAnimalList(appAnimal);
    }

    /**
     * 新增动物信息
     * 
     * @param appAnimal 动物信息
     * @return 结果
     */
    @Override
    public int insertAppAnimal(AppAnimal appAnimal)
    {
        long ys = SecurityUtils.getLoginUser().getDeptId()%110;
        AppAnimalState appAnimalState = new AppAnimalState();
        if (ys==0){
            appAnimalState.setBid(SecurityUtils.getUserId());
        }else if (ys==1){
            appAnimalState.setHid(SecurityUtils.getUserId());
        }else {
            appAnimalState.setUid(SecurityUtils.getUserId());
        }
        appAnimal.setCreateDate(new Date());
        int res = appAnimalMapper.insertAppAnimal(appAnimal);
        appAnimalState.setAid(appAnimal.getId());
        appAnimalStateMapper.insertAppAnimalState(appAnimalState);
        return res;
    }

    /**
     * 修改动物信息
     * 
     * @param appAnimal 动物信息
     * @return 结果
     */
    @Override
    public int updateAppAnimal(AppAnimal appAnimal)
    {
        Long userId = SecurityUtils.getUserId();
        AppAnimalState appAnimalState = new AppAnimalState();
        appAnimalState.setAid(appAnimal.getId());
        List<AppAnimalState> list = appAnimalStateMapper.selectAppAnimalStateList(appAnimalState);
        if (list.size()!=0&&(list.get(0).getUid().equals(userId)||list.get(0).getHid().equals(userId)||list.get(0).getBid().equals(userId))){
            return appAnimalMapper.updateAppAnimal(appAnimal);
        }
        return 0;
    }

    /**
     * 批量删除动物信息
     * 
     * @param ids 需要删除的动物信息主键
     * @return 结果
     */
    @Override
    public int deleteAppAnimalByIds(Long[] ids)
    {
        return appAnimalMapper.deleteAppAnimalByIds(ids);
    }

    /**
     * 删除动物信息信息
     * 
     * @param id 动物信息主键
     * @return 结果
     */
    @Override
    public int deleteAppAnimalById(Long id)
    {
        return 0;
//        return appAnimalMapper.deleteAppAnimalById(id);
    }
}
