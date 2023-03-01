package com.ruoyi.app.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 评论点赞对象 app_comments_like
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
public class AppCommentsLike
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 评论id */
    @Excel(name = "评论id")
    private Long cid;

    /** 用户id */
    @Excel(name = "用户id")
    private Long uid;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setCid(Long cid) 
    {
        this.cid = cid;
    }

    public Long getCid() 
    {
        return cid;
    }
    public void setUid(Long uid) 
    {
        this.uid = uid;
    }

    public Long getUid() 
    {
        return uid;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("cid", getCid())
            .append("uid", getUid())
            .toString();
    }
}
