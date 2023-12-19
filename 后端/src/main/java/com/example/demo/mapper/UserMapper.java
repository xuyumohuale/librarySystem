package com.example.demo.mapper;

import com.example.demo.pojo.book;
import com.example.demo.pojo.borrow;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.example.demo.pojo.user;


import java.awt.print.Book;
import java.util.List;

@Repository
@Mapper
public  interface UserMapper {
    List<user> findAll();
    user findByName(String username);
    void reg(String username,String password,String name);
    void forget(String username,String password);
    List<book>  AllBooks();

    List<borrow> findBookInborrow(Integer user_id,Integer book_id);
    void updateStock(Integer id);

    List<borrow> findBorrByUser(Integer user_id);
    List<borrow> findAllBorrow();

    void confirmLend(Integer record_id);

    book findBookInBooks(Integer id);

    void LendOfBorrow(Integer user_id,Integer book_id,Integer status);
    void addStock(Integer id);
    void AddBook(book newbook);
    void UpdateBook(book newbook);
    void DeleteBook(Integer id);
    borrow findByBorrowId(Integer record_id);
    void UpdateBorrow(borrow borr);

    void ReturnBook(Integer record_id);
    borrow FindBorrowByID(Integer book_id);

}