package com.ruoyi.app.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 捐赠对象 app_donation
 * 
 * @author ruoyi
 * @date 2023-02-28
 */
public class AppDonation
{
    private static final long serialVersionUID = 1L;

    /** 捐赠id */
    private Long id;

    /** 用户id */
    @Excel(name = "用户id")
    private Long uid;

    /** 被捐赠用户id */
    @Excel(name = "被捐赠用户id")
    private Long toUid;

    /** 金额 */
    @Excel(name = "金额")
    private Long amount;

    /** 捐赠时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "捐赠时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createDate;

    /** 说明 */
    @Excel(name = "说明")
    private String title;

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
    public void setAmount(Long amount) 
    {
        this.amount = amount;
    }

    public Long getAmount() 
    {
        return amount;
    }
    public void setCreateDate(Date createDate) 
    {
        this.createDate = createDate;
    }

    public Date getCreateDate() 
    {
        return createDate;
    }
    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("uid", getUid())
            .append("toUid", getToUid())
            .append("amount", getAmount())
            .append("createDate", getCreateDate())
            .append("title", getTitle())
            .toString();
    }
}
