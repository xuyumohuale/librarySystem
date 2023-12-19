package com.example.demo.controller;

import com.alibaba.fastjson.JSON;

import com.example.demo.pojo.book;
import com.example.demo.pojo.borrow;
import com.example.demo.service.UserService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@Controller
public class UserController {
    @Resource
    UserService userService;

    @RequestMapping("/findAll")
    @ResponseBody
    public String findALl() {
        return JSON.toJSONString(userService.getList());
    }
    @RequestMapping("/login")
    @ResponseBody
    public String login(@RequestBody Map<String, String> loginForm){

        String username = loginForm.get("username");
        String password = loginForm.get("password");
        String json = JSON.toJSONString(userService.login(username,password));
        return json;
    }

    @RequestMapping("/register")
    @ResponseBody
    public String register(@RequestBody Map<String, String> Form){
        String name = Form.get("name");
        String username = Form.get("username");
        String password = Form.get("password");
        String json=JSON.toJSONString(userService.register(username,password,name));
        System.out.println(json);
        return json;
    }

    @RequestMapping("/forget")
    @ResponseBody
    public String forget(@RequestBody Map<String, String> Form){
        String username = Form.get("username");
        String password = Form.get("password");
        String json=JSON.toJSONString(userService.forget(username,password));
        System.out.println(json);
        return json;
    }

    @RequestMapping("/AllBooks")
    @ResponseBody
    public String AllBooks(){
        String json=JSON.toJSONString(userService.AllBooks());
        return json;
    }

    @RequestMapping("/reserve")
    @ResponseBody
    public String reserve(@RequestBody Map<String, String> Form){
        System.out.println(Form);
        Integer userid = Integer.parseInt(Form.get("userid"));
        Integer bookid = Integer.parseInt(Form.get("bookid"));
        String json=JSON.toJSONString(userService.reserve(userid,bookid));
        System.out.println(json);
        return json;
    }
    @RequestMapping("/borrowList")
    @ResponseBody
    public String borrowList(@RequestBody Map<String, String> Form){
        Integer userid = Integer.parseInt(Form.get("userid"));
        System.out.println(userid);
        String json=JSON.toJSONString(userService.borrowList(userid));
        System.out.println(json);
        return json;
    }

    @RequestMapping("/AllBorrow")
    @ResponseBody
    public String AllBorrow(){
        String json=JSON.toJSONString(userService.AllBorrow());
        System.out.println(json);
        return json;
    }

    @RequestMapping("/ConfirmLend")
    @ResponseBody
    public String ConfirmLend(@RequestBody Map<String, String> Form){
        Integer userid = Integer.parseInt(Form.get("userid"));
        Integer bookid =  Integer.parseInt(Form.get("bookid"));
        String json=JSON.toJSONString(userService.ConfirmLend(userid,bookid));
        System.out.println(json);
        return json;
    }

    @RequestMapping("/ReturnBook")
    @ResponseBody
    public String ReturnBook(@RequestBody Map<String, Integer> Form){
        Integer userid = Form.get("userid");
        Integer bookid = Form.get("bookid");
        String json=JSON.toJSONString(userService.ReturnBook(userid,bookid));
        System.out.println(json);
        return json;
    }

    @RequestMapping("/UpdateBook")
    @ResponseBody
    public String UpdateBook(@RequestBody Map<String, String> Form){
        System.out.println("123");
        System.out.println(Form);
        book newbook = new book();
        if(Form.get("id") != null){
        newbook.setId(Integer.parseInt(Form.get("id")));}
        newbook.setTitle(Form.get("title"));
        newbook.setAuthor(Form.get("author"));
        newbook.setPublisher(Form.get("publisher"));
        newbook.setIsbn(Form.get("isbn"));
        newbook.setStock(Integer.parseInt(Form.get("stock")));

        String json=JSON.toJSONString(userService.UpdateBook(newbook));
        System.out.println(json);
        return json;
    }

    @RequestMapping("/DeleteBook")
    @ResponseBody
    public String DeleteBook(@RequestBody Map<String, String> Form){

        Integer bookid = Integer.parseInt(Form.get("bookid"));

        String json=JSON.toJSONString(userService.DeleteBook(bookid));
        System.out.println(json);
        return json;
    }

    @RequestMapping("/UpdateBorrow")
    @ResponseBody
    public String UpdateBorrow(@RequestBody Map<String, String> Form){
        borrow borr = new borrow();
        Integer record_id = Integer.valueOf(Form.get("record_id"));
        borr.setRecord_id(record_id);
        Integer user_id = Integer.valueOf(Form.get("user_id"));
        borr.setUser_id(user_id);
        Integer book_id = Integer.valueOf(Form.get("book_id"));
        borr.setBook_id(book_id);
        String borrowDateString = Form.get("borrow_date");
        String returnDateString = Form.get("return_date");

        // 定义日期格式
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        borr.setTitle(Form.get("title"));
        borr.setAuthor(Form.get("author"));
        try {
            // 将字符串转换为 Date 类型
            Date borrowDate = dateFormat.parse(borrowDateString);
            Date returnDate = dateFormat.parse(returnDateString);

            // 现在，borrowDate 和 returnDate 变量包含了转换后的 Date 对象
            // 你可以将这些对象设置到相应的对象属性中
            borr.setBorrow_date(borrowDate);
            borr.setReturn_date(returnDate);
        } catch (ParseException e) {
            // 如果无法将字符串解析为日期，ParseException 将被抛出
            // 在这里，你可以处理转换失败的情况
            System.err.println("无法将字符串转换为日期: " + e.getMessage());
        }
        borr.setStatus(Integer.parseInt(Form.get("status")));

        String json=JSON.toJSONString(userService.UpdateBorrow(borr));
        System.out.println(json);
        return json;
    }


}
