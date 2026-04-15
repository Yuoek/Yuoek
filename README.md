# Yuoek

🕙 2026-04-12

这个仓库存放一些好用的 `github` 项目，`fork` 作为子模块，并且存放一些学习笔记。


**克隆主项目**
```bash
git@github.com:Yuoek/Yuoek.git
```

**添加子模块**
```bash
git submodule add git@github.com:Yuoek/typepad.git
```
```bash
git submodule add git@github.com:Yuoek/qwerty-learner.git
```

**主项目初始化并更新子模块**
```bash
git init
```
```bash
git update
```

或
```bash
git clone --recurse-submodules git@github.com/Yuoek/Yuoek.git
```

**更新子模块**
```bash
git submodule update --remote <子模块路径>
```


**删除子模块**
```bash
git submodule deinit -f tools/git
```
```bash
git rm tools/git
```
```bash
rm -rf .git/modules/tools/git
```
```bash
git add .
```
```bash
git commit -m "remove submodule"
```
