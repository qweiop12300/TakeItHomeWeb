package com.ruoyi.app.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 关注对象 app_concern
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
public class AppConcern
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 用户id */
    @Excel(name = "用户id")
    private Long uid;

    /** 被关注用户id */
    @Excel(name = "被关注用户id")
    private Long toUid;

    /** 被关注动物id */
    @Excel(name = "被关注动物id")
    private Long toAid;

    /** 被关注的话题 */
    @Excel(name = "被关注的话题")
    private Long toTid;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createDate;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUid(Long uid) 
    {
        this.uid = uid;
    }

    public Long getUid() 
    {
        return uid;
    }
    public void setToUid(Long toUid) 
    {
        this.toUid = toUid;
    }

    public Long getToUid() 
    {
        return toUid;
    }
    public void setToAid(Long toAid) 
    {
        this.toAid = toAid;
    }

    public Long getToAid() 
    {
        return toAid;
    }
    public void setToTid(Long toTid) 
    {
        this.toTid = toTid;
    }

    public Long getToTid() 
    {
        return toTid;
    }
    public void setCreateDate(Date createDate) 
    {
        this.createDate = createDate;
    }

    public Date getCreateDate() 
    {
        return createDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("uid", getUid())
            .append("toUid", getToUid())
            .append("toAid", getToAid())
            .append("toTid", getToTid())
            .append("createDate", getCreateDate())
            .toString();
    }
}
