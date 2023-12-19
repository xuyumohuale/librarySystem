import { http } from "@/utils/http";
import { baseUrlApi } from "./utils";

export type UserResult = {
  success: boolean;
  name: string;
  id: string;
  registration_date: string;
  data: {
    /** 用户名 */
    username: string;
    /** 当前登陆用户的角色 */
    roles: Array<string>;
    /** `token` */
    accessToken: string;
    /** 用于调用刷新`accessToken`的接口时所需的`token` */
    refreshToken: string;
    /** `accessToken`的过期时间（格式'xxxx/xx/xx xx:xx:xx'） */
    expires: Date;
  };
};

export type RefreshTokenResult = {
  success: boolean;
  data: {
    /** `token` */
    accessToken: string;
    /** 用于调用刷新`accessToken`的接口时所需的`token` */
    refreshToken: string;
    /** `accessToken`的过期时间（格式'xxxx/xx/xx xx:xx:xx'） */
    expires: Date;
  };
};

/** mock登录 */
export const getLogin = (data?: object) => {
  return http.request<UserResult>("post", "/login", { data });
};

/** 刷新token */
export const refreshTokenApi = (data?: object) => {
  return http.request<RefreshTokenResult>("post", "/refreshToken", { data });
};
export type user = {
  username: String;
  password: String;
};
export const getUserList = () => {
  return http.request<user[]>("post", baseUrlApi("findAll"));
};
//数据库登录
export const login = (data?: Object) => {
  return http.request<UserResult>("post", baseUrlApi("login"), { data });
};

export type book = {
  id: string;
  title: string;
  author: string;
  publisher: string;
  isbn: string;
  stock: number;
};
export type common_result = {
  success: boolean;
  message: string;
};
export const findBooks = () => {
  return http.request<book[]>("post", baseUrlApi("AllBooks"));
};

export const reserveBook = (data?: object) => {
  return http.request<common_result>("post", baseUrlApi("reserve"), { data });
};

export const forget = (data?: object) => {
  return http.request<common_result>("post", baseUrlApi("forget"), { data });
};

export const register = (data?: object) => {
  return http.request<common_result>("post", baseUrlApi("register"), { data });
};

export type borrow = {
  record_id: string;
  user_id: string;
  book_id: string;
  title: string;
  author: string;
  borrow_date: Date;
  return_date: Date;
  shiji_return_date: Date;
  status: number;
};

export const allBorrow = (data?: object) => {
  return http.request<borrow[]>("post", baseUrlApi("AllBorrow"), {
    data
  });
};

export const UserBorrow = (data?: object) => {
  return http.request<borrow[]>("post", baseUrlApi("borrowList"), {
    data
  });
};

export const updateBook = (data?: object) => {
  return http.request<common_result>("post", baseUrlApi("UpdateBook"), {
    data
  });
};

export const deleteBook = (data?: object) => {
  return http.request<common_result>("post", baseUrlApi("DeleteBook"), {
    data
  });
};

export const ConfirmLend = (data?: object) => {
  return http.request<common_result>("post", baseUrlApi("ConfirmLend"), {
    data
  });
};

export const ReturnBook = (data?: object) => {
  return http.request<common_result>("post", baseUrlApi("ReturnBook"), {
    data
  });
};
