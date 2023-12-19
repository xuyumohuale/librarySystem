package com.example.demo.service;

import com.example.demo.mapper.UserMapper;
import com.example.demo.pojo.*;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Resource
    UserMapper userMapper;

    //查找所有学生
    public List<user> getList() {
        return userMapper.findAll();
    }

    public LoginResult login(String username, String password) {
        LoginResult result = new LoginResult();
        LoginResult.login_Data data = new LoginResult.login_Data();
        try {
            user user = userMapper.findByName(username);
            if (user != null) {
                if (password.equals(user.getPassword())) {
                    result.setSuccess(true);
                    data.setId(user.getId());
                    data.setName(user.getName());
                    data.setRegistration_date(user.getRegistration_date());
                    data.setAccessToken();
                    data.setRefreshToken();
                    data.setExpires();
                    data.setUsername(user.getUsername());
                    String[] rolesArray = user.getRole().split(",");
                    data.setRoles(rolesArray);
                    result.setData(data);
                } else {
                    result.setSuccess(false);
                    data.setId(user.getId());
                    data.setName(user.getName());
                    data.setRegistration_date(user.getRegistration_date());
                    data.setAccessToken();
                    data.setRefreshToken();
                    data.setExpires();
                    data.setUsername(user.getUsername());
                    String[] rolesArray = user.getRole().split(",");
                    data.setRoles(rolesArray);
                    result.setData(data);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return result;
        }
        return result;
    }

    public OtherResult register(String username, String password, String name) {
        OtherResult result = new OtherResult();
        try {
            user user = userMapper.findByName(username);
            //如果没有被注册，才能进行注册功能
            if (user == null) {
                userMapper.reg(username, password, name);
                result.setSuccess(true);
                result.setMessage("注册成功");
            } else {
                result.setSuccess(false);
                result.setMessage("注册失败，用户已存在");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return result;
        }
        return result;
    }

    public OtherResult forget(String username, String password) {
        OtherResult result = new OtherResult();
        System.out.println(username);
        try {
            user user = userMapper.findByName(username);
            //数据库中存在，才能进行忘记密码的操作
            if (user != null) {
                userMapper.forget(username, password);
                result.setSuccess(true);
                result.setMessage("修改成功");
            } else {
                result.setSuccess(false);
                result.setMessage("修改失败，用户不存在");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return result;
        }
        return result;
    }

    public List<book> AllBooks() {
        return userMapper.AllBooks();
    }

    public  OtherResult reserve(Integer userid, Integer bookid){
        OtherResult result=new OtherResult();
        try{
            List<borrow> listBorrow=userMapper.findBookInborrow(userid,bookid);
            borrow borr = new borrow();
            for (borrow borrow : listBorrow) {
                if (borrow.getStatus() != 0){
                    borr = borrow;
                    break;
                }
            }
            //判断是否已经借了同样的书
            if(borr.getRecord_id()==null){
                book b=userMapper.findBookInBooks(bookid);
                if(b.getStock()>0){
                    userMapper.updateStock(bookid); //更新stock表的库存
//                    book book1 = userMapper.findBookInBooks(bookid);
                    userMapper.LendOfBorrow(userid,bookid,1);
                    result.setSuccess(true);
                    result.setMessage("借阅成功,请等待审理");
                }else{
                    result.setSuccess(false);
                    result.setMessage("借阅失败，无库存");
                }
            }else{
                result.setSuccess(false);
                result.setMessage("借阅失败，不能借阅两本相同的书");
            }

        }catch(Exception e){
            System.out.println(3);
            e.printStackTrace();
            return result;
        }
        return result;
    }
    public List<borrow> borrowList(Integer userid) {
        return userMapper.findBorrByUser(userid);
    }

    public List<borrow> AllBorrow() {
        System.out.println(userMapper.findAllBorrow());
        return userMapper.findAllBorrow();
    }

    public OtherResult ConfirmLend(Integer userid, Integer bookid) {
        OtherResult result = new OtherResult();
        try {
            List<borrow> listBorrow=userMapper.findBookInborrow(userid,bookid);
            borrow book = new borrow();
            for (borrow borrow : listBorrow) {
                if (borrow.getStatus() != 0){
                    book = borrow;
                    break;
                }
            }
            if (book.getStatus() == 1) {
                userMapper.confirmLend(book.getRecord_id());
                result.setSuccess(true);
                result.setMessage("审理成功，成功借出");
            } else {
                result.setSuccess(false);
                result.setMessage("审理失败，该图书已借出");
            }

        } catch (Exception e) {
            e.printStackTrace();
            return result;
        }
        return result;
    }

    public  OtherResult ReturnBook(Integer userid, Integer bookid){
        OtherResult result=new OtherResult();
        try{
            List<borrow> listBorrow=userMapper.findBookInborrow(userid,bookid);
            borrow book = new borrow();
            for (borrow borrow : listBorrow) {
                if (borrow.getStatus() != 0){
                    book = borrow;
                    break;
                }
            }
            if(book.getStatus()==2){
                userMapper.ReturnBook(book.getRecord_id());
                userMapper.addStock(bookid);

                result.setSuccess(true);
                result.setMessage("审理成功，成功归还");
            }else{
                result.setSuccess(false);
                result.setMessage("审理失败，该图书已在书库");
            }

        }catch(Exception e){
            e.printStackTrace();
            return result;
        }
        return result;
    }

    public  OtherResult UpdateBook(book newbook){
        OtherResult result=new OtherResult();
        try{
            book b=userMapper.findBookInBooks(newbook.getId());

            //如果不存在该书籍，则进行插入，否则进行更新
            if(b==null){
                userMapper.AddBook(newbook);
                result.setSuccess(true);
                result.setMessage("添加书籍成功");
            }else{
                userMapper.UpdateBook(newbook);
                result.setSuccess(true);
                result.setMessage("更新书籍信息成功");
            }
        }catch(Exception e){
            e.printStackTrace();
            return result;
        }
        return result;
    }

    public  OtherResult DeleteBook(Integer bookid){
        OtherResult result=new OtherResult();
        try{
            book b=userMapper.findBookInBooks(bookid);
            //如果不存在该书籍，则无法删除
            if(b!=null){
                borrow bo =userMapper.FindBorrowByID(bookid);
                if(bo!=null && bo.getStatus()!=0){
                    result.setSuccess(false);
                    result.setMessage("删除图书失败，该书籍已被借阅");
                    return result;
                }
                userMapper.DeleteBook(bookid);
                result.setSuccess(true);
                result.setMessage("删除书籍成功");
            }else{
                result.setSuccess(false);
                result.setMessage("删除图书失败，不存在该书籍");
            }
        }catch(Exception e){
            e.printStackTrace();
            result.setSuccess(false);
            result.setMessage("删除图书失败，该书籍已被借阅");
            return result;
        }
        return result;
    }

    public  OtherResult UpdateBorrow(borrow borr){
        OtherResult result=new OtherResult();
        try{
            borrow b=userMapper.findByBorrowId(borr.getRecord_id());
            //如果不存在该记录，则无法进行修改
            if(b!=null){
                //userMapper.DeleteBook(bookid);
                userMapper.UpdateBorrow(borr);
                result.setSuccess(true);
                result.setMessage("修改借阅信息成功");
            }else{
                result.setSuccess(false);
                result.setMessage("修改借阅信息失败，不存在该记录");
            }
        }catch(Exception e){
            e.printStackTrace();
            return result;
        }
        return result;
    }

}
