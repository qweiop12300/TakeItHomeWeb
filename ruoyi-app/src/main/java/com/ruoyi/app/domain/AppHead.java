package com.ruoyi.app.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 公告对象 app_head
 * 
 * @author ruoyi
 * @date 2023-03-16
 */
public class AppHead
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** postid */
    @Excel(name = "postid")
    private Long pid;

    private AppPost post;

    public AppPost getPost() {
        return post;
    }

    public void setPost(AppPost post) {
        this.post = post;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setPid(Long pid) 
    {
        this.pid = pid;
    }

    public Long getPid() 
    {
        return pid;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("pid", getPid())
            .toString();
    }
}
