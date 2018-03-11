package com.example.pojo.VIP;

public class VIP_Account {
    private int vip_ID;
    private String vip_Name;
    private Integer vip_Level_ID;
    private String level_Description;
    private Integer remains;

    public int getVip_ID() {
        return vip_ID;
    }

    public void setVip_ID(int vip_ID) {
        this.vip_ID = vip_ID;
    }

    public String getVip_Name() {
        return vip_Name;
    }

    public void setVip_Name(String vip_Name) {
        this.vip_Name = vip_Name;
    }

    public Integer getVip_Level_ID() {
        return vip_Level_ID;
    }

    public void setVip_Level_ID(Integer vip_Level_ID) {
        this.vip_Level_ID = vip_Level_ID;
    }

    public String getLevel_Description() {
        return level_Description;
    }

    public void setLevel_Description(String level_Description) {
        this.level_Description = level_Description;
    }

    public Integer getRemains() {
        return remains;
    }

    public void setRemains(Integer remains) {
        this.remains = remains;
    }

    @Override
    public String toString() {
        return "VIP_Account{" +
                "vip_ID=" + vip_ID +
                ", vip_Name='" + vip_Name + '\'' +
                ", vip_Level_ID=" + vip_Level_ID +
                ", level_Description='" + level_Description + '\'' +
                ", remains=" + remains +
                '}';
    }
}
