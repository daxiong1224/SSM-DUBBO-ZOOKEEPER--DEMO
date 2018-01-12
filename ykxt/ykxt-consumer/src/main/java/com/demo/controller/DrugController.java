package com.demo.controller;

import com.demo.pojo.Drug;
import com.demo.pojo.Inventory;
import com.demo.service.DrugService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Drug")
public class DrugController {
    @Autowired
    DrugService drugService;

    @Autowired
    InventoryController inventoryController;

    @RequestMapping("/FindDrugByPage")
    @ResponseBody
    public Map<String, Object> findDrugByPage(@RequestParam(value = "pageIndex",defaultValue = "1")int pageIndex,
                                 @RequestParam(value = "pageSize",defaultValue = "5")int pageSize){
        int total=drugService.selectCount();
        List<Drug> list=drugService.findDrugByPage(pageIndex,pageSize);
        Map<String,Object> map=new HashMap<>();
        map.put("total",total);
        map.put("data",list);
        return  map;
    }

    @RequestMapping("/JumpToDrugPage")
    public String jumpToDrugPage(){
        return "views/DrugManagement";
    }

    /**
     * 添加药品。并向库存表中插入一条初始化的记录
     */
    @RequestMapping("/AddDrug")
    @ResponseBody
    public String addDrug(Drug drug){
        drugService.addDrug(drug);

        //通过药品编号查找药品ID
        int id=findIdByNumber(drug.getDrug_number());
        //初始化库存表的数据 默认库存数量为0
        Inventory inventory=new Inventory();
        inventory.setInventoryNumber(0);
        inventory.setDrugId(id);
        inventoryController.initializeInsert(inventory);

        return "{\"result\":\"add success\"}";
    }

    /**
     * 更新药品
     */
    @RequestMapping("/UpdateDrug")
    @ResponseBody
    public String updateDrug(Drug drug){
        drugService.updateDrug(drug);
        return "{\"result\":\"update success\"}";
    }

    /**
     * 删除药品
     */
    @RequestMapping("/DeleteDrug")
    @ResponseBody
    public String deleteDrug(@RequestParam(value = "id")int id){
        drugService.deleteDrug(id);
        return "{\"result\":\"delete success\"}";
    }

    /**
     * 通过药品编号查找Id
     * @return
     */
    public int findIdByNumber(String drugNumber){
         int id=drugService.findIdByNumber(drugNumber);
         return id;
    }
}
