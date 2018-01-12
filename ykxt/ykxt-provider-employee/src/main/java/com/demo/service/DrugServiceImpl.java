package com.demo.service;

import com.demo.dao.DrugDao;
import com.demo.pojo.Drug;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("drugService")
public class DrugServiceImpl implements DrugService{
    @Autowired
    DrugDao drugDao;

    @Override
    public int selectCount() {
       return drugDao.selectCount();
    }

    @Override
    public List<Drug> findDrugByPage(int pageIndex, int pageSize) {
        Map<String,Object> map=new HashMap<>();
        map.put("start",pageIndex*pageSize);//开始查询的位置
        map.put("end",pageIndex*pageSize+pageSize);//结束查询的位置
        return drugDao.findDrugByPage(map);
    }

    @Override
    public void addDrug(Drug drug) {
        drugDao.addDrug(drug);
    }

    @Override
    public void updateDrug(Drug drug) {
        drugDao.updateDrug(drug);
    }

    @Override
    public void deleteDrug(int id) {
        drugDao.deleteDrug(id);
    }

    @Override
    public int findIdByNumber(String drugNumber) {
        return  drugDao.findIdByNumber(drugNumber);
    }
}
