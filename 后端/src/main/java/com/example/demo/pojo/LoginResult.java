package com.example.demo.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginResult {
    private boolean success;
    private login_Data data;
    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class login_Data {
        private String name;
        private String id;
        private String registration_date;
        private String username;
        private String[] roles;
        private String accessToken;
        private String refreshToken;
        private LocalDateTime expires;
        public void setExpires() {
            // 获取当前时间
            // 获取当前时间
            LocalDateTime now = LocalDateTime.now();

            // 在当前时间上添加24小时
            LocalDateTime expiresDateTime = now.plus(24, ChronoUnit.HOURS);

            // 使用 DateTimeFormatter 将 LocalDateTime 格式化为字符串
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            String formattedExpiresDateTime = expiresDateTime.format(formatter);

            // 将字符串转换为 LocalDateTime
            this.expires = LocalDateTime.parse(formattedExpiresDateTime, formatter);

        }
        public void setAccessToken() {
            // 生成随机的UUID作为AccessToken
            this.accessToken = UUID.randomUUID().toString();
        }

        public void setRefreshToken() {
            // 生成随机的UUID作为RefreshToken
            this.refreshToken = UUID.randomUUID().toString();
        }
    }
}
