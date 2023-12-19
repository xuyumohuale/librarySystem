package com.example.demo.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class borrow {
    private Integer record_id;
    private Integer user_id;
    private Integer book_id;
    private String title;
    private String author;
    private Date borrow_date;
    private Date return_date;
    private Date shiji_return_date;
    private Integer status;
}