// 模拟后端动态生成路由
import { MockMethod } from "vite-plugin-mock";

/**
 * roles：页面级别权限，这里模拟二种 "admin"、"common"
 * admin：管理员角色
 * common：普通角色
 */

const permissionRouter = {
  path: "/permission",
  meta: {
    title: "书籍管理",
    roles: ["admin"],
    rank: 10
  },
  children: [
    {
      path: "/permission/page/index",
      name: "PermissionPage",
      meta: {
        title: "图书信息",
        roles: ["admin"]
      }
    },
    {
      path: "/permission/borrowList/index",
      name: "PermissionButton",
      meta: {
        title: "借阅信息",
        roles: ["admin"],
        auths: ["btn_add", "btn_edit", "btn_delete"]
      }
    }
  ]
};

export default [
  {
    url: "/getAsyncRoutes",
    method: "get",
    response: () => {
      return {
        success: true,
        data: [permissionRouter]
      };
    }
  }
] as MockMethod[];
