package com.demo.service;

import com.demo.pojo.Drug;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface DrugService {
    int selectCount();

    List<Drug> findDrugByPage(int pageIndex, int pageSize);

    void addDrug(Drug drug);

    void updateDrug(Drug drug);

    void deleteDrug(int id);

    int findIdByNumber(String drugNumber);
}
