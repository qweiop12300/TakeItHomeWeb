package com.ruoyi.app.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.entity.SysUser;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 动态对象 app_post
 * 
 * @author ruoyi
 * @date 2023-02-27
 */
public class AppPost extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  动态id */
    private Long id;

    /** 动态标题 */
    @Excel(name = "动态标题")
    private String title;

    /** 动态内容 */
    @Excel(name = "动态内容")
    private String content;

    /** 动态图片 */
    @Excel(name = "动态图片")
    private String image;

    /** 动态视频 */
    @Excel(name = "动态视频")
    private String video;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createDate;

    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date updateDate;

    /** 用户id */
    @Excel(name = "用户id")
    private Long uid;

    private SysUser sysUser;

    /** 话题id */
    @Excel(name = "话题id")
    private Long tid;

    private AppTopic appTopic;

    /** 动物id */
    @Excel(name = "动物id")
    private Long aid;

    private AppAnimal appAnimal;

    /** 具体位置 */
    @Excel(name = "具体位置")
    private String location;

    /** 城市 */
    @Excel(name = "城市")
    private String city;

    /** 紧急程度 */
    @Excel(name = "紧急程度")
    private Integer urgent;

    /** 动态类型 */
    @Excel(name = "动态类型")
    private Long typeId;

    /** 点赞数量 */
    @Excel(name = "点赞数量")
    private Long likeNumber;

    /** 收藏数量 */
    @Excel(name = "收藏数量")
    private Long collectionNumber;

    /** 评论数量 */
    @Excel(name = "评论数量")
    private Long commentsNumber;

    /** 链接 */
    @Excel(name = "链接")
    private String url;

    /** 扩展1 */
    @Excel(name = "扩展1")
    private String s1;

    private AppPostType appPostType;

    public SysUser getSysUser() {
        return sysUser;
    }

    public AppPostType getAppPostType() {
        return appPostType;
    }

    public void setSysUser(SysUser sysUser) {
        this.sysUser = sysUser;
    }

    public void setAppPostType(AppPostType appPostType) {
        this.appPostType = appPostType;
    }

    public AppAnimal getAppAnimal() {
        return appAnimal;
    }

    public AppTopic getAppTopic() {
        return appTopic;
    }

    public void setAppAnimal(AppAnimal appAnimal) {
        this.appAnimal = appAnimal;
    }

    public void setAppTopic(AppTopic appTopic) {
        this.appTopic = appTopic;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
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
    public void setVideo(String video) 
    {
        this.video = video;
    }

    public String getVideo() 
    {
        return video;
    }
    public void setCreateDate(Date createDate) 
    {
        this.createDate = createDate;
    }

    public Date getCreateDate() 
    {
        return createDate;
    }
    public void setUpdateDate(Date updateDate) 
    {
        this.updateDate = updateDate;
    }

    public Date getUpdateDate() 
    {
        return updateDate;
    }
    public void setUid(Long uid) 
    {
        this.uid = uid;
    }

    public Long getUid() 
    {
        return uid;
    }
    public void setTid(Long tid) 
    {
        this.tid = tid;
    }

    public Long getTid() 
    {
        return tid;
    }
    public void setAid(Long aid) 
    {
        this.aid = aid;
    }

    public Long getAid() 
    {
        return aid;
    }
    public void setLocation(String location) 
    {
        this.location = location;
    }

    public String getLocation() 
    {
        return location;
    }
    public void setCity(String city) 
    {
        this.city = city;
    }

    public String getCity() 
    {
        return city;
    }
    public void setUrgent(Integer urgent) 
    {
        this.urgent = urgent;
    }

    public Integer getUrgent() 
    {
        return urgent;
    }
    public void setTypeId(Long typeId) 
    {
        this.typeId = typeId;
    }

    public Long getTypeId() 
    {
        return typeId;
    }
    public void setLikeNumber(Long likeNumber) 
    {
        this.likeNumber = likeNumber;
    }

    public Long getLikeNumber() 
    {
        return likeNumber;
    }
    public void setCollectionNumber(Long collectionNumber) 
    {
        this.collectionNumber = collectionNumber;
    }

    public Long getCollectionNumber() 
    {
        return collectionNumber;
    }
    public void setCommentsNumber(Long commentsNumber) 
    {
        this.commentsNumber = commentsNumber;
    }

    public Long getCommentsNumber() 
    {
        return commentsNumber;
    }
    public void setUrl(String url) 
    {
        this.url = url;
    }

    public String getUrl() 
    {
        return url;
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
            .append("title", getTitle())
            .append("content", getContent())
            .append("image", getImage())
            .append("video", getVideo())
            .append("createDate", getCreateDate())
            .append("updateDate", getUpdateDate())
            .append("uid", getUid())
            .append("tid", getTid())
            .append("aid", getAid())
            .append("location", getLocation())
            .append("city", getCity())
            .append("urgent", getUrgent())
            .append("typeId", getTypeId())
            .append("likeNumber", getLikeNumber())
            .append("collectionNumber", getCollectionNumber())
            .append("commentsNumber", getCommentsNumber())
            .append("url", getUrl())
            .append("s1", getS1())
            .toString();
    }
}
