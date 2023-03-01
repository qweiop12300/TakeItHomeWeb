package com.ruoyi.app.domain;

import com.ruoyi.common.core.domain.entity.SysUser;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 动物状态关联对象 app_animal_state
 * 
 * @author ruoyi
 * @date 2023-03-01
 */
public class AppAnimalState
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 动物id */
    @Excel(name = "动物id")
    private Long aid;

    private AppAnimal appAnimal;

    /** 动物领养人id */
    @Excel(name = "动物领养人id")
    private Long uid;

    private SysUserE usysUser;

    /** 救助基地id */
    @Excel(name = "救助基地id")
    private Long bid;

    private SysUserE bsysUser;

    /** 动物医院id */
    @Excel(name = "动物医院id")
    private Long hid;

    private SysUserE hsysUser;

    /** 扩展1 */
    @Excel(name = "扩展1")
    private String s1;

    public AppAnimal getAppAnimal() {
        return appAnimal;
    }

    public void setAppAnimal(AppAnimal appAnimal) {
        this.appAnimal = appAnimal;
    }

    public SysUserE getBsysUser() {
        return bsysUser;
    }

    public SysUserE getHsysUser() {
        return hsysUser;
    }


    public SysUserE getUsysUser() {
        return usysUser;
    }

    public void setBsysUser(SysUserE bsysUser) {
        this.bsysUser = bsysUser;
    }

    public void setUsysUser(SysUserE usysUser) {
        this.usysUser = usysUser;
    }

    public void setHsysUser(SysUserE hsysUser) {
        this.hsysUser = hsysUser;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setAid(Long aid) 
    {
        this.aid = aid;
    }

    public Long getAid() 
    {
        return aid;
    }
    public void setUid(Long uid) 
    {
        this.uid = uid;
    }

    public Long getUid() 
    {
        return uid;
    }
    public void setBid(Long bid) 
    {
        this.bid = bid;
    }

    public Long getBid() 
    {
        return bid;
    }
    public void setHid(Long hid) 
    {
        this.hid = hid;
    }

    public Long getHid() 
    {
        return hid;
    }
    public void setS1(String s1) 
    {
        this.s1 = s1;
    }

    public String getS1() 
    {
        return s1;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("aid", getAid())
            .append("uid", getUid())
            .append("bid", getBid())
            .append("hid", getHid())
            .append("s1", getS1())
            .toString();
    }
}
