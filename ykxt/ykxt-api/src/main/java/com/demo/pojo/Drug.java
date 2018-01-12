package com.demo.pojo;

import java.io.Serializable;

public class Drug implements Serializable{
    private int id;
    private String drug_number;//编号 表中设置完了唯一性约束
    private String name;
    private String common_name;//通用名
    private String category;//药品分类，西药、草药、中草药
    private String specification;//药品规格
    private String origin;//产地
    private String status;//状态

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDrug_number() {
        return drug_number;
    }

    public void setDrug_number(String drug_number) {
        this.drug_number = drug_number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCommon_name() {
        return common_name;
    }

    public void setCommon_name(String common_name) {
        this.common_name = common_name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
