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

**git 子模块修改操作以及更新(tools ai示例)**
1. 进入子模块目录
```bash
cd tools
```

2. 切回 main 分支，解除游离状态
```bash
git checkout main
```

3. 拉取远程最新代码，确保本地分支和远程一致
```bash
git pull origin main
```

4. 修改文件，提交并推送到子模块远程
```bash
git add .
git commit -m "feat: 新增文件/修改功能"
git push origin main  # 这次推送是有效的，因为在 main 分支上
```

5. 回到主仓库
```bash
cd ..
```

6. 更新主仓库里子模块的引用
```bash
git submodule update --remote tools
```

7. 提交主仓库的变更并推送
```bash
git add tools
git commit -m "chore: 更新 tools 子模块引用"
git push origin main
```


**git mv**
```bash
git mv class life0123
```
```bash
git submodule sync
```
