// 根据角色动态生成路由
import { MockMethod } from "vite-plugin-mock";

export default [
  {
    url: "/AllBooks",
    method: "post",
    response: () => {
      return [
        {
          id: "123",
          title: "数据库系统",
          author: "张三",
          publisher: "人民出版社",
          isbn: "0-670-82162-4",
          stock: 5
        }
      ];
    }
  },
  {
    url: "/reserve", //预约
    method: "post",
    response: () => {
      return [
        {
          success: true
        }
      ];
    }
  },
  {
    url: "/borrowList",
    method: "post",
    response: () => {
      return [
        {
          id: "123",
          title: "数据库系统",
          author: "张三",
          publisher: "人民出版社",
          isbn: "0-670-82162-4",
          stock: 5
        }
      ];
    }
  },
  {
    url: "/AllBorrow", //管理员端借阅信息
    method: "post",
    response: () => {
      return [
        {
          id: "123",
          title: "数据库系统",
          author: "张三",
          publisher: "人民出版社",
          isbn: "0-670-82162-4",
          stock: 5
        }
      ];
    }
  },
  {
    url: "/ConfirmLend", //管理员端借阅信息
    method: "post",
    response: () => {
      return [
        {
          id: "123",
          title: "数据库系统",
          author: "张三",
          publisher: "人民出版社",
          isbn: "0-670-82162-4",
          stock: 5
        }
      ];
    }
  },
  {
    url: "/ReturnBook", //管理员控制还书
    method: "post",
    response: () => {
      return [
        {
          id: "123",
          title: "数据库系统",
          author: "张三",
          publisher: "人民出版社",
          isbn: "0-670-82162-4",
          stock: 5
        }
      ];
    }
  },
  {
    url: "/AddBook", //管理员端添加图书信息
    method: "post",
    response: () => {
      return [
        {
          id: "123",
          title: "数据库系统",
          author: "张三",
          publisher: "人民出版社",
          isbn: "0-670-82162-4",
          stock: 5
        }
      ];
    }
  },
  {
    url: "/DeleteBook", //管理员端删除图书信息
    method: "post",
    response: () => {
      return [
        {
          id: "123",
          title: "数据库系统",
          author: "张三",
          publisher: "人民出版社",
          isbn: "0-670-82162-4",
          stock: 5
        }
      ];
    }
  },
  {
    url: "/UpdateBook", //管理员端删除图书信息
    method: "post",
    response: () => {
      return [
        {
          id: "123",
          title: "数据库系统",
          author: "张三",
          publisher: "人民出版社",
          isbn: "0-670-82162-4",
          stock: 5
        }
      ];
    }
  },
  {
    url: "/UpdateBorrow", //管理员端删除图书信息
    method: "post",
    response: () => {
      return [
        {
          id: "123",
          title: "数据库系统",
          author: "张三",
          publisher: "人民出版社",
          isbn: "0-670-82162-4",
          stock: 5
        }
      ];
    }
  }
] as MockMethod[];
