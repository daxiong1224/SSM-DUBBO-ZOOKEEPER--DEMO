package com.demo.service;

import com.demo.pojo.Inventory;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface InventoryService {
    int selectCount();

    List<Inventory> findInventoryByPage(int pageIndex, int pageSize);

    void initializeInsert(Inventory inventory);

    void updateInventoryNumber(int id, int newInventoryNumber);

    List<Inventory> findAll();
}
