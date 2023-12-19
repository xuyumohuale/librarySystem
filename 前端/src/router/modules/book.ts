export default [
  {
    path: "/bookList",
    meta: {
      title: "书籍列表",
      rank: 9
    },
    component: () => import("@/views/bookList/index.vue")
  },
  {
    path: "/borrowList",
    meta: {
      title: "借阅信息",
      rank: 9
    },
    component: () => import("@/views/user/index.vue")
  }
] as Array<RouteConfigsTable>;
