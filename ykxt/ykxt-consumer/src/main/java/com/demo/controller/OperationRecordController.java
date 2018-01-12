package com.demo.controller;

import com.demo.pojo.OperationRecord;
import com.demo.service.OperationRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/OperationRecord")
public class OperationRecordController {
    @Autowired
    OperationRecordService operationRecordService;

    /**
     * 分页查询数据
     * @param pageIndex
     * @param pageSize
     * @return
     */
    @RequestMapping("/FindOperationRecordByPage")
    @ResponseBody
    public  Map<String,Object> findOperationRecordByPage(@RequestParam("pageIndex")int pageIndex,
                                                         @RequestParam("pageSize")int pageSize){
        int total=operationRecordService.selectCount();
        List<OperationRecord> list=operationRecordService.findOperationRecordByPage(pageIndex,pageSize);
        Map<String,Object> map=new HashMap<>();
        map.put("total",total);
        map.put("data",list);
        return map;
    }

    public void addRecord(OperationRecord operationRecord){
        operationRecordService.addRecord(operationRecord);
    }

    /**
     * 页面跳转方法
     */
    @RequestMapping("/JumpToOperationRecordPage")
    public String jumpToOperationRecordPage(){
        return "views/OperationRecord";
    }
}
