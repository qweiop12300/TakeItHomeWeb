package com.ruoyi.app.domain;

public class SysUserE {
    private Long userId;
    private String nickName;
    private String sex;
    private String avatar;

    private String remark;

    public String getNickName() {
        return nickName;
    }

    public String getAvatar() {
        return avatar;
    }

    public Long getUserId() {
        return userId;
    }

    public String getSex() {
        return sex;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
