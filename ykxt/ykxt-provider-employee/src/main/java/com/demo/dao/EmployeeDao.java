package com.demo.dao;

import com.demo.pojo.Employee;

import java.util.List;
import java.util.Map;

public interface EmployeeDao {
     List<Employee> loginValidate(Employee employee);

     // List<Employee> findEmployee();

     List<Employee> findEmployeeByPage(Map<String,Object> map);

     int selectCount();

     void addEmployee(Employee employee);

     void deleteEmployee(int id);

     void updateEmployee(Employee employee);
}
