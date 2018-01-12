package com.demo.service;

import com.demo.dao.OperationRecordDao;
import com.demo.pojo.OperationRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("operationRecordService")
public class OperationRecordServiceImpl implements OperationRecordService {
    @Autowired
    OperationRecordDao operationRecordDao;

    @Override
    public int selectCount() {
        return operationRecordDao.selectCount();
    }

    @Override
    public List<OperationRecord> findOperationRecordByPage(int pageIndex, int pageSize) {
        Map<String,Object> map= new HashMap<>();
        map.put("start",pageIndex*pageSize);//开始查询的位置
        map.put("end",pageIndex*pageSize+pageSize);//结束查询的位置
        return operationRecordDao.findOperationRecordByPage(map);
    }

    @Override
    public void addRecord(OperationRecord operationRecord) {
        operationRecordDao.addRecord(operationRecord);
    }
}
