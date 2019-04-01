+++
title = "mysql 常用用法"
date = 2019-02-13T00:00:00-08:00
lastmod = 2019-02-13T18:09:25-08:00
tags = ["mysql"]
categories = ["mysql"]
draft = false
+++

### 修改mysql用户密码

```mysql
select User,Password from mysql.user;
set password for keystone@localhost = password('324dcdc2318be07d0300');
```