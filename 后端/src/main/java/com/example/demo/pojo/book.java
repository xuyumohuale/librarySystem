package com.example.demo.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class book {
    private int id;
    private String title;
    private String author;
    private String publisher;
    private String isbn;
    private int stock;
}