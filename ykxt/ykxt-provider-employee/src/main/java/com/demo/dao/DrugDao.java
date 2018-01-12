package com.demo.dao;

import com.demo.pojo.Drug;

import java.util.List;
import java.util.Map;

public interface DrugDao {
    int selectCount();

    List<Drug> findDrugByPage(Map<String, Object> map);

    void addDrug(Drug drug);

    void updateDrug(Drug drug);

    void deleteDrug(int id);

    int findIdByNumber(String drugNumber);
}
