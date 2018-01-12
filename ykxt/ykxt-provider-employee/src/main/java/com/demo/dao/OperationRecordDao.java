package com.demo.dao;

import com.demo.pojo.OperationRecord;

import java.util.List;
import java.util.Map;

public interface OperationRecordDao {
    int selectCount();

    List<OperationRecord> findOperationRecordByPage(Map<String, Object> map);

    void addRecord(OperationRecord operationRecord);
}
