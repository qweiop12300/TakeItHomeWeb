package com.ruoyi.app.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 动物状态关联管理对象 app_animal_state
 * 
 * @author ruoyi
 * @date 2023-02-27
 */
public class AppAnimalState extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 动物id */
    @Excel(name = "动物id")
    private Long aid;

    /** 动物状态 */
    @Excel(name = "动物状态")
    private Integer sid;

    /** 动物领养人id */
    @Excel(name = "动物领养人id")
    private Long uid;

    /** 救助基地id */
    @Excel(name = "救助基地id")
    private Long bid;

    /** 动物医院id */
    @Excel(name = "动物医院id")
    private Long hid;

    /** 扩展1 */
    @Excel(name = "扩展1")
    private String s1;

    public void setAid(Long aid) 
    {
        this.aid = aid;
    }

    public Long getAid() 
    {
        return aid;
    }
    public void setSid(Integer sid) 
    {
        this.sid = sid;
    }

    public Integer getSid() 
    {
        return sid;
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
            .append("aid", getAid())
            .append("sid", getSid())
            .append("uid", getUid())
            .append("bid", getBid())
            .append("hid", getHid())
            .append("s1", getS1())
            .toString();
    }
}
