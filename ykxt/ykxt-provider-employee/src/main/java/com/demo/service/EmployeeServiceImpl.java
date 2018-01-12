package com.demo.service;

import com.demo.dao.EmployeeDao;
import com.demo.pojo.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    EmployeeDao employeeDao;

    @Override
    public List<Employee> login(Employee employee) {
        List<Employee> list=employeeDao.loginValidate(employee);
        return list;
    }

    @Override
    public int selectCount() {
        return employeeDao.selectCount();
    }

    @Override
    public List<Employee> findEmployeeByPage(int pageIndex, int pageSize) {
        Map<String,Object> map= new HashMap<>();
        map.put("start",pageIndex*pageSize);//开始查询的位置
        map.put("end",pageIndex*pageSize+pageSize);//结束查询的位置
        List<Employee> list=employeeDao.findEmployeeByPage(map);
        return list;
    }

    @Override
    public void addEmployee(Employee employee) {
        employeeDao.addEmployee(employee);
    }

    @Override
    public void deleteEmployee(int id) {
        employeeDao.deleteEmployee(id);
    }

    @Override
    public void updateEmployee(Employee employee) {
        employeeDao.updateEmployee(employee);
    }


}
