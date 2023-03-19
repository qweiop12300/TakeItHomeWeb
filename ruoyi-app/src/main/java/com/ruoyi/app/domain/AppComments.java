package com.ruoyi.app.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 评论对象 app_comments
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
public class AppComments
{
    private static final long serialVersionUID = 1L;

    /** 评论id */
    private Long id;

    /** 被评论id */
    @Excel(name = "被评论id")
    private Long toId;

    /** 被评论帖子id */
    @Excel(name = "被评论帖子id")
    private Long pid;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 图片 */
    @Excel(name = "图片")
    private String image;

    /** 用户id */
    @Excel(name = "用户id")
    private Long uid;

    private SysUserE user;

    /** 动物id */
    @Excel(name = "动物id")
    private Long aid;

    private AppAnimal appAnimal;

    /** 点赞数量 */
    @Excel(name = "点赞数量")
    private Long likeNumber;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createDate;

    public SysUserE getUser() {
        return user;
    }

    public void setUser(SysUserE user) {
        this.user = user;
    }

    public AppAnimal getAppAnimal() {
        return appAnimal;
    }

    public void setAppAnimal(AppAnimal appAnimal) {
        this.appAnimal = appAnimal;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setToId(Long toId) 
    {
        this.toId = toId;
    }

    public Long getToId() 
    {
        return toId;
    }
    public void setPid(Long pid) 
    {
        this.pid = pid;
    }

    public Long getPid() 
    {
        return pid;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setImage(String image) 
    {
        this.image = image;
    }

    public String getImage() 
    {
        return image;
    }
    public void setUid(Long uid) 
    {
        this.uid = uid;
    }

    public Long getUid() 
    {
        return uid;
    }
    public void setAid(Long aid) 
    {
        this.aid = aid;
    }

    public Long getAid() 
    {
        return aid;
    }
    public void setLikeNumber(Long likeNumber) 
    {
        this.likeNumber = likeNumber;
    }

    public Long getLikeNumber() 
    {
        return likeNumber;
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
            .append("toId", getToId())
            .append("pid", getPid())
            .append("content", getContent())
            .append("image", getImage())
            .append("uid", getUid())
            .append("aid", getAid())
            .append("likeNumber", getLikeNumber())
            .append("createDate", getCreateDate())
            .toString();
    }
}
