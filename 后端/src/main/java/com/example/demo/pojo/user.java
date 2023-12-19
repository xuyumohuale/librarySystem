package com.example.demo.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class user {
    private String id;
    private String username;
    private String password;
    private String name;
    private String role;
    private String registration_date;
}
