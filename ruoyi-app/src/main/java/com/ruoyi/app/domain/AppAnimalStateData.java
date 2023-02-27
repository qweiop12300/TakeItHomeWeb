package com.ruoyi.app.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 动物状态信息对象 app_animal_state_data
 * 
 * @author ruoyi
 * @date 2023-02-27
 */
public class AppAnimalStateData extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 状态id */
    private Long id;

    /** 动物状态标题 */
    @Excel(name = "动物状态标题")
    private String title;

    /** 扩展1 */
    @Excel(name = "扩展1")
    private String s1;

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
            .append("s1", getS1())
            .toString();
    }
}
