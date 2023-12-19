# Read

## 文件说明

前端 由Vue3+Vite+Element-Plus+TypeScript+Pinia开发

后端 由Springboot开发

数据库使用Mysql

## 使用方式

### **<u>前端</u>**

**node版本应不小于16，pnpm版本应不小于6**

**如果还没安装 `pnpm`，执行下面命令进行安装（`mac` 用户遇到安装报错请在命令前加上 `sudo`）**

```
npm install -g pnpm
```

**安装依赖**

```text
pnpm install
```

**启动**

```text
pnpm dev
```

### **<u>后端</u>**

使用jdk17

### **<u>数据库</u>**

创建数据库表名为library

运行library.sql

然后再springboot中的application.yml中修改对应的数据库用户名称及密码

