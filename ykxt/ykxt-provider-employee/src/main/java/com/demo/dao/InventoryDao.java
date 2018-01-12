package com.demo.dao;

import com.demo.pojo.Inventory;

import java.util.List;
import java.util.Map;

public interface InventoryDao {
    int selectCount();

    List<Inventory> findInventoryByPage(Map<String, Object> map);

    void initializeInsert(Inventory inventory);


    void updateInventoryNumber(Map<String, Object> map);

    List<Inventory> findAll();
}
