package com.ruoyi.app.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用户数据扩展对象 user_data
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
public class UserData
{
    private static final long serialVersionUID = 1L;

    /** user_id */
    @Excel(name = "user_id")
    private Long uid;

    /** 描述 */
    @Excel(name = "描述")
    private String desc;

    /** 年龄 */
    @Excel(name = "年龄")
    private Integer year;

    /** 属于某用户 */
    @Excel(name = "属于某用户")
    private Long toUid;

    /** 扩展1 */
    @Excel(name = "扩展1")
    private String s1;

    /** 扩展2 */
    @Excel(name = "扩展2")
    private String s2;

    public void setUid(Long uid) 
    {
        this.uid = uid;
    }

    public Long getUid() 
    {
        return uid;
    }
    public void setDesc(String desc) 
    {
        this.desc = desc;
    }

    public String getDesc() 
    {
        return desc;
    }
    public void setYear(Integer year) 
    {
        this.year = year;
    }

    public Integer getYear() 
    {
        return year;
    }
    public void setToUid(Long toUid) 
    {
        this.toUid = toUid;
    }

    public Long getToUid() 
    {
        return toUid;
    }
    public void setS1(String s1) 
    {
        this.s1 = s1;
    }

    public String getS1() 
    {
        return s1;
    }
    public void setS2(String s2) 
    {
        this.s2 = s2;
    }

    public String getS2() 
    {
        return s2;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("uid", getUid())
            .append("desc", getDesc())
            .append("year", getYear())
            .append("toUid", getToUid())
            .append("s1", getS1())
            .append("s2", getS2())
            .toString();
    }
}
