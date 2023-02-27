package com.ruoyi.app.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 消息对象 app_message
 * 
 * @author ruoyi
 * @date 2023-02-27
 */
public class AppMessage extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 消息id */
    private Long id;

    /** 用户id */
    @Excel(name = "用户id")
    private Long uid;

    /** 收消息用户id */
    @Excel(name = "收消息用户id")
    private Long toUid;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 帖子id */
    @Excel(name = "帖子id")
    private Long pid;

    /** 类型id */
    @Excel(name = "类型id")
    private Long typeId;

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
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setPid(Long pid) 
    {
        this.pid = pid;
    }

    public Long getPid() 
    {
        return pid;
    }
    public void setTypeId(Long typeId) 
    {
        this.typeId = typeId;
    }

    public Long getTypeId() 
    {
        return typeId;
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
            .append("content", getContent())
            .append("pid", getPid())
            .append("typeId", getTypeId())
            .append("createDate", getCreateDate())
            .toString();
    }
}
