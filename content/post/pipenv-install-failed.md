+++
title = "pipenv install 报错"
date = 2019-01-31T00:00:00+08:00
lastmod = 2019-01-31T20:45:47+08:00
tags = ["python", "pipenv", "faq"]
categories = ["python"]
draft = false
weight = 3001
+++

在某个项目中遇到了出错，如下：

```shell
(saleor) ➜  saleor git:(master) pipenv install --dev
Courtesy Notice: Pipenv found itself running within a virtual environment, so it will automatically use that environment, instead of creating its own for any project. You can set PIPENV_IGNORE_VIRTUALENVS
=1 to force pipenv to ignore that environment and create its own instead. You can set PIPENV_VERBOSITY=-1 to suppress this warning.
Installing dependencies from Pipfile.lock (0c0b26)…
An error occurred while installing yarl==1.3.0 ; python_version >= '3.4' --hash=sha256:024ecdc12bc02b321bc66b41327f930d1c2c543fa9a561b39861da9388ba7aa9 --hash=sha256:2f3010703295fbe1aec51023740871e64bb966
4c789cba5a6bdf404e93f7568f --hash=sha256:3890ab952d508523ef4881457c4099056546593fa05e93da84c7250516e632eb --hash=sha256:3e2724eb9af5dc41648e5bb304fcf4891adc33258c6e14e2a7414ea32541e320 --hash=sha256:5badb
97dd0abf26623a9982cd448ff12cb39b8e4c94032ccdedf22ce01a64842 --hash=sha256:73f447d11b530d860ca1e6b582f947688286ad16ca42256413083d13f260b7a0 --hash=sha256:7ab825726f2940c16d92aaec7d204cfc34ac26c0040da727cf8
ba87255a33829 --hash=sha256:b25de84a8c20540531526dfbb0e2d2b648c13fd5dd126728c496d7c3fea33310 --hash=sha256:c6e341f5a6562af74ba55205dbd56d248daf1b5748ec48a0200ba227bb9e33f4 --hash=sha256:c9bb7c249c4432cd47
e75af3864bc02d26c9594f49c82e2a28624417f0ae63b8 --hash=sha256:e060906c0c585565c718d1c3841747b61c5439af2211e185f6739a9412dfbde1! Will try again.
  🐍   ▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉ 151/151 — 00:02:25                                                                                                                                                  Installing initially failed dependencies…                                                                                                                                                                   [pipenv.exceptions.InstallError]:   File "/home/tom/.virtualenvs/saleor/lib/python3.5/site-packages/pipenv/core.py", line 1874, in do_install
[pipenv.exceptions.InstallError]:       keep_outdated=keep_outdated
[pipenv.exceptions.InstallError]:   File "/home/tom/.virtualenvs/saleor/lib/python3.5/site-packages/pipenv/core.py", line 1253, in do_init
[pipenv.exceptions.InstallError]:       pypi_mirror=pypi_mirror,
[pipenv.exceptions.InstallError]:   File "/home/tom/.virtualenvs/saleor/lib/python3.5/site-packages/pipenv/core.py", line 859, in do_install_dependencies
[pipenv.exceptions.InstallError]:       retry_list, procs, failed_deps_queue, requirements_dir, **install_kwargs
[pipenv.exceptions.InstallError]:   File "/home/tom/.virtualenvs/saleor/lib/python3.5/site-packages/pipenv/core.py", line 763, in batch_install
[pipenv.exceptions.InstallError]:       _cleanup_procs(procs, not blocking, failed_deps_queue, retry=retry)
[pipenv.exceptions.InstallError]:   File "/home/tom/.virtualenvs/saleor/lib/python3.5/site-packages/pipenv/core.py", line 681, in _cleanup_procs
[pipenv.exceptions.InstallError]:       raise exceptions.InstallError(c.dep.name, extra=err_lines)
[pipenv.exceptions.InstallError]: ['Looking in indexes: https://pypi.python.org/simple', 'Collecting yarl==1.3.0 (from -r /tmp/pipenv-umy9db73-requirements/pipenv-5nm2wwj2-requirement.txt (line 1))']
[pipenv.exceptions.InstallError]: ['Could not find a version that satisfies the requirement yarl==1.3.0 (from -r /tmp/pipenv-umy9db73-requirements/pipenv-5nm2wwj2-requirement.txt (line 1)) (from versions:
 0.0.1, 0.1.0, 0.1.1, 0.1.2, 0.1.3, 0.1.4, 0.2.0, 0.2.1, 0.3.0, 0.3.1, 0.3.2, 0.4.0, 0.4.1, 0.4.2, 0.4.3, 0.5.0b2, 0.5.0b3, 0.5.0b4, 0.5.0b5, 0.5.0, 0.5.1, 0.5.2, 0.5.3, 0.6.0, 0.7.0, 0.7.1, 0.8.0, 0.8.1, 0.9.0, 0.9.1, 0.9.2, 0.9.3, 0.9.4, 0.9.5, 0.9.6, 0.9.7, 0.9.8, 0.10.0, 0.10.1, 0.10.2, 0.10.3, 0.11.0, 0.12.0, 0.13.0, 0.14.0, 0.14.1, 0.14.2, 0.15.0, 0.16.0, 0.17.0, 0.18.0, 1.0.0, 1.1.0, 1.1.1, 1.2.0)'
, 'No matching distribution found for yarl==1.3.0 (from -r /tmp/pipenv-umy9db73-requirements/pipenv-5nm2wwj2-requirement.txt (line 1))']
ERROR: ERROR: Package installation failed...
(saleor) ➜  saleor git:(master)
```

其实在最开始的时候，就已经提示\`An error occurred while installing yarl==1.3.0\`, 这个时候，如果我们看到了，应该要停止安装接下来的包，因为，最后还是会报错的。

一个简单有效的思路，就是手工安装一下 yarl 包，看是不是版本不对。

```shell
(saleor) ➜  saleor git:(master) grep yarl -rn ./Pipfile*
./Pipfile.lock:1384:        "yarl": {
(saleor) ➜  saleor git:(master) vi ./Pipfile.lock
(saleor) ➜  saleor git:(master) pip install yarl==1.3
Collecting yarl==1.3
  Could not find a version that satisfies the requirement yarl==1.3 (from versions: 0.0.1, 0.1.0, 0.1.1, 0.1.2, 0.1.3, 0.1.4, 0.2.0, 0.2.1, 0.3.0, 0.3.1, 0.3.2, 0.4.0, 0.4.1, 0.4.2, 0.4.3, 0.5.0b2, 0.5.0b3, 0.5.0b4, 0.5.0b5, 0.5.0, 0.5.1, 0.5.2, 0.5.3, 0.6.0, 0.7.0, 0.7.1, 0.8.0, 0.8.1, 0.9.0, 0.9.1, 0.9.2, 0.9.3, 0.9.4, 0.9.5, 0.9.6, 0.9.7, 0.9.8, 0.10.0, 0.10.1, 0.10.2, 0.10.3, 0.11.0, 0.12.0, 0.13.0, 0.14.0, 0.14.1, 0.14.2, 0.15.0, 0.16.0, 0.17.0, 0.18.0, 1.0.0, 1.1.0, 1.1.1, 1.2.0)
No matching distribution found for yarl==1.3
(saleor) ➜  saleor git:(master) pip install yarl
Collecting yarl
  Downloading https://files.pythonhosted.org/packages/23/7d/41beef3b35c1836079fde8408aebfb3c0a24c6bf2e66078d351fc4cfa1ff/yarl-1.2.0-cp35-cp35m-manylinux1_x86_64.whl (252kB)
    100% |████████████████████████████████| 256kB 520kB/s
Requirement already satisfied: idna>=2.0 in /home/tom/.virtualenvs/saleor/lib/python3.5/site-packages (from yarl) (2.8)
Requirement already satisfied: multidict>=4.0 in /home/tom/.virtualenvs/saleor/lib/python3.5/site-packages (from yarl) (4.5.2)
Installing collected packages: yarl
Successfully installed yarl-1.2.0
(saleor) ➜  saleor git:(master) vi ./Pipfile.lock
(saleor) ➜  saleor git:(master) ✗ pipenv install --dev
Courtesy Notice: Pipenv found itself running within a virtual environment, so it will automatically use that environment, instead of creating its own for any project. You can set PIPENV_IGNORE_VIRTUALENVS=1 to force pipenv to ignore that environment and create its own instead. You can set PIPENV_VERBOSITY=-1 to suppress this warning.
Installing dependencies from Pipfile.lock (0c0b26)…
  🐍   ▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉ 151/151 — 00:02:00
(saleor) ➜  saleor git:(master) ✗ ls
apollo.config.js  common.env                   docker-compose.yml  LICENSE    package.json       Pipfile.lock  requirements_dev.txt  saleor     templates  tsconfig.json      webpack.d.ts
app.json          deployment                   Dockerfile          locale     package-lock.json  Procfile      requirements.txt      scripts    tests      tslint.json
CHANGELOG.md      docker-compose.override.yml  docs                manage.py  Pipfile            README.md     runtime.txt           setup.cfg  tox.ini    webpack.config.js
(saleor) ➜  saleor git:(master) ✗
```

看到了吧。pip 直接安装的是 1.2.0 ,所以，把 Pipfile.lock 文件里的版本值 修改成 1.2.0 就可以了。
