// 根据角色动态生成路由
import { MockMethod } from "vite-plugin-mock";

export default [
  {
    url: "/login",
    method: "post",
    response: ({ body }) => {
      if (body.username === "admin") {
        return {
          success: true,
          data: {
            name: "小明",
            id: "12",
            registration_date: "2013-12-5",
            username: "admin",
            // 一个用户可能有多个角色
            roles: ["admin"],
            accessToken: "eyJhbGciOiJIUzUxMiJ9.admin",
            refreshToken: "eyJhbGciOiJIUzUxMiJ9.adminRefresh",
            expires: "2023/10/30 00:00:00"
          }
        };
      } else {
        return {
          success: true,
          name: "小明",
          id: "12",
          registration_date: "2013-12-5",
          data: {
            name: "小明",
            id: "12",
            registration_date: "2013-12-5",
            username: "common",
            // 一个用户可能有多个角色
            roles: ["common"],
            accessToken: "eyJhbGciOiJIUzUxMiJ9.common",
            refreshToken: "eyJhbGciOiJIUzUxMiJ9.commonRefresh",
            expires: "2023/10/30 00:00:00"
          }
        };
      }
    }
  },
  {
    url: "/register",
    method: "post",
    response: () => {
      return [
        {
          success: true,
          msg: "登陆成功"
        }
      ];
    }
  }
] as MockMethod[];
