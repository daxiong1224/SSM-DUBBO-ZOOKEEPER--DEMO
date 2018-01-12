package com.demo.service;

import com.demo.pojo.Employee;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface EmployeeService {

    /**
     * 登陆 验证账号密码是否正确
     */
    public List<Employee> login(Employee employee);

    int selectCount();

    List<Employee> findEmployeeByPage(int pageIndex, int pageSize);

    void addEmployee(Employee employee);

    void deleteEmployee(int id);

    void updateEmployee(Employee employee);
}
