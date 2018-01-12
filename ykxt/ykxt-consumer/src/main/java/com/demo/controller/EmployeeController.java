package com.demo.controller;

import com.demo.pojo.Employee;
import com.demo.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Employee")
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;

    @RequestMapping(value = "/Login")
    @ResponseBody
    public String login(Employee employee, HttpServletRequest request){
        List<Employee> list=employeeService.login(employee);
        System.out.println("mysize="+list.size());
        if(list.size()>0){
            if(list.get(0).getStatus().equals("启用")){
                System.out.println("aa"+request.getSession().getAttribute("account")
                                        +request.getSession().getAttribute("character"));
                request.getSession().setAttribute("account",list.get(0).getAccount());
                request.getSession().setAttribute("id",list.get(0).getId());
                request.getSession().setAttribute("character",list.get(0).getCharacter());
                System.out.println("bb"+request.getSession().getAttribute("account")
                        +request.getSession().getAttribute("character"));
                return "登录成功！";
            }else if(list.get(0).getStatus().equals("停用")){
                return "该账号已被禁用！";
            }
        }
        return "账号或密码不正确！";
    }

    /**
     * 得到用户角色的权限
     * @param request
     * @return
     */
    @RequestMapping(value = "/UserCharacter",method = RequestMethod.POST)
    @ResponseBody
    public String getUserCharacter(HttpServletRequest request){
        String character= (String) request.getSession().getAttribute("character");
        return character;
    }

    /**
     * 分页查询员工数据
     */
    @RequestMapping("/FindEmployeeByPage")
    @ResponseBody
    public Map<String,Object> findEmployeeByPage(@RequestParam(value = "pageIndex",defaultValue = "1")int pageIndex,
                                                 @RequestParam(value = "pageSize",defaultValue = "5") int pageSize){
        int total=employeeService.selectCount();
        List<Employee> list=employeeService.findEmployeeByPage(pageIndex,pageSize);
        Map<String,Object> map= new HashMap<>();
        map.put("data",list);
        map.put("total",total);
        return  map;
    }

    /**
     * 添加员工
     */
    @RequestMapping("/AddEmployee")
    @ResponseBody
    public String addEmployee(Employee employee){
        employeeService.addEmployee(employee);
        return "{\"result\":\"success\"}";
    }

    /**
     * 删除员工
     */
    @RequestMapping("/DeleteEmployee")
    @ResponseBody
    public String deleteEmployee(@RequestParam(value = "id")int id){
        employeeService.deleteEmployee(id);
        return "{\"result\":\"delete success\"}";
    }

    /**
     * 更新员工信息
     */
    @RequestMapping("/UpdateEmployee")
    @ResponseBody
    public String updateEmployee(Employee employee){
        employeeService.updateEmployee(employee);
        return "{\"result\":\"update success\"}";
    }

    /**
     * 页面跳转方法
     * @return
     */
    @RequestMapping("/JumpToAccountPage")
    public String jumpToAccountPage(){
        return "views/AccountManagement";
    }
    @RequestMapping("/JumpToWinEmpPage")
    public String jumpTowPage(){
        return "windowViews/windowEmployee";
    }
}
