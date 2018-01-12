package com.demo.service;

import com.demo.dao.InventoryDao;
import com.demo.pojo.Inventory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("inventoryService")
public class InventoryServiceImpl implements InventoryService{
    @Autowired
    InventoryDao inventoryDao;

    @Override
    public int selectCount() {
        return inventoryDao.selectCount();
    }

    @Override
    public List<Inventory> findInventoryByPage(int pageIndex, int pageSize) {
        Map<String,Object> map=new HashMap<>();
        map.put("start",pageIndex*pageSize);
        map.put("end",pageIndex*pageSize+pageSize);
        return inventoryDao.findInventoryByPage(map);
    }

    /**
     * 添加一条初始化的库存记录
     */
    public void initializeInsert(Inventory inventory){
        inventoryDao.initializeInsert(inventory);
    }

    @Override
    public void updateInventoryNumber(int id, int newInventoryNumber) {
        Map<String,Object> map=new HashMap<>();
        map.put("id",id);
        map.put("inventoryNumber",newInventoryNumber);
        inventoryDao.updateInventoryNumber(map);
    }

    @Override
    public List<Inventory> findAll() {
        return  inventoryDao.findAll();
    }
}
