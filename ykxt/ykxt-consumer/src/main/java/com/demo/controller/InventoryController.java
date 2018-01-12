package com.demo.controller;


import com.demo.pojo.Inventory;
import com.demo.pojo.OperationRecord;
import com.demo.service.InventoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/Inventory")
public class InventoryController {
    @Autowired
    InventoryService inventoryService;

    @Autowired
    OperationRecordController operationRecordController;

    @RequestMapping("/FindInventoryByPage")
    @ResponseBody
    public Map<String, Object> findInventoryByPage(@RequestParam(value = "pageIndex",defaultValue = "1") int pageIndex,
                                                   @RequestParam(value = "pageSize",defaultValue = "5")int pageSize){
        int total=inventoryService.selectCount();
        List<Inventory> list=inventoryService.findInventoryByPage(pageIndex,pageSize);
        Map<String,Object> map=new HashMap<>();
        map.put("total",total);
        map.put("data",list);
        return map;
    }

    @RequestMapping("/FindEchartsData")
    @ResponseBody
    public Map<String,Object> findEchartsData(){
        List<Inventory> list=findAll();
        ArrayList nameList=new ArrayList();
        ArrayList numberList=new ArrayList();
        for (int i=0;i<list.size();i++){
            nameList.add(list.get(i).getDrug().getName());
            numberList.add(list.get(i).getInventoryNumber());
        }
        Map<String,Object> map=new HashMap<>();
        map.put("nameList",nameList);
        map.put("numberList",numberList);
        return map;
    }

    /**
     * 查询所有数据
     */
    public List<Inventory> findAll(){
        List<Inventory> list=inventoryService.findAll();
        return  list;
    }

    /**
     * 页面跳转方法
     */
    @RequestMapping("/JumpToInventoryPage")
    public String jumpToInventoryPage(){
        return "views/InventoryManagement";
    }

    /**
     * 根据ID更新库存数量 并向操作记录表插入一条操作记录
     */
    @RequestMapping("/UpdateInventoryNumber")
    @ResponseBody
    public String updateInventoryNumber(@RequestParam(value = "id")int id,
                                        @RequestParam(value = "newInventoryNumber")int newInventoryNumber,
                                        @RequestParam(value="operation")String operation,
                                        HttpServletRequest request){
        inventoryService.updateInventoryNumber(id,newInventoryNumber);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        OperationRecord operationRecord=new OperationRecord();
        operationRecord.setOperation(operation);
        operationRecord.setEmployeeId((Integer) request.getSession().getAttribute("id"));
        operationRecord.setTime(df.format(new Date()));
        operationRecordController.addRecord(operationRecord);
        return "{\"result\":\"update success\"}";
    }



    /**
     * 初始化一条记录 工具方法
     */
    @RequestMapping()
    public void initializeInsert(Inventory inventory){
        inventoryService.initializeInsert(inventory);
    }

}
