package com.demo.service;

import com.demo.pojo.OperationRecord;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface OperationRecordService {
    int selectCount();

    List<OperationRecord> findOperationRecordByPage(int pageIndex, int pageSize);

    void addRecord(OperationRecord operationRecord);
}
