package com.ruoyi.app.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 动物信息对象 app_animal
 * 
 * @author ruoyi
 * @date 2023-03-01
 */
public class AppAnimal
{
    private static final long serialVersionUID = 1L;

    /** 动物id */
    private Long id;

    /** 动物状态id */
    @Excel(name = "动物状态id")
    private Long sid;

    private AppAnimalStateData appAnimalStateData;

    /** 动物名字 */
    @Excel(name = "动物名字")
    private String name;

    /** 动物性别 */
    @Excel(name = "动物性别")
    private Integer sex;

    /** 动物头像 */
    @Excel(name = "动物头像")
    private String icon;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createDate;

    /** 动物年龄 */
    @Excel(name = "动物年龄")
    private Integer year;

    /** 扩展1 */
    @Excel(name = "扩展1")
    private String s1;

    /** 扩展2 */
    @Excel(name = "扩展2")
    private String s2;

    private AppAnimalState appAnimalState;


    public AppAnimalState getAppAnimalState() {
        return appAnimalState;
    }

    public void setAppAnimalState(AppAnimalState appAnimalState) {
        this.appAnimalState = appAnimalState;
    }

    public AppAnimalStateData getAppAnimalStateData() {
        return appAnimalStateData;
    }

    public void setAppAnimalStateData(AppAnimalStateData appAnimalStateData) {
        this.appAnimalStateData = appAnimalStateData;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setSid(Long sid) 
    {
        this.sid = sid;
    }

    public Long getSid() 
    {
        return sid;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setSex(Integer sex) 
    {
        this.sex = sex;
    }

    public Integer getSex() 
    {
        return sex;
    }
    public void setIcon(String icon) 
    {
        this.icon = icon;
    }

    public String getIcon() 
    {
        return icon;
    }
    public void setCreateDate(Date createDate) 
    {
        this.createDate = createDate;
    }

    public Date getCreateDate() 
    {
        return createDate;
    }
    public void setYear(Integer year) 
    {
        this.year = year;
    }

    public Integer getYear() 
    {
        return year;
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
            .append("id", getId())
            .append("sid", getSid())
            .append("name", getName())
            .append("sex", getSex())
            .append("icon", getIcon())
            .append("createDate", getCreateDate())
            .append("year", getYear())
            .append("s1", getS1())
            .append("s2", getS2())
            .toString();
    }
}
