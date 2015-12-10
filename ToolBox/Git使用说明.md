# git使用说明

- **创建Git库**

      cd 源码目录

      git init   # 初始化  

      在源码目录中生成一个.git 的目录

- **注册用户信息**

      git config --gloable user.name xxx

      git config --gloable user.email xxx

      git config --list  //查看用户信息

- **向git库中添加或删除文件**

      git add xx 单个文件

      git add .  所有文件

- **向版本库提交变化**
      git status   #查看当前代码库的状态

      git log

      git log -p

      git show xxx   #查看版本信息并显示每次修改的diff

      git commit –m “XXXX”     #直接添加简单提交信息,添加注释

      git reset 会将所有stage的文件状态，都改变成非stage状

- **向服务器提交**

       git push                 #向服务器提交


 - **检出仓库**

       执行如下命令以创建一个本地仓库的克隆版本：

       git clone /path/to/repository

       如果是远端服务器上的仓库，你的命令会是这个样子：

       git clone username@host:/path/to/repository

 - **工作流**

 你的本地仓库由 git 维护的三棵“树”组成。第一个是你的 工作目录，它持有实际文件；第二个是

 缓存区（Index），它像个缓存区域，临时保存你的改动；最后是 HEAD，指向你最近一次提交后的结果。



- **创建版本控制一般步骤**

        echo "# Hello-World" >> README.md

        git init

        git add README.md

        git commit -m "first commit"

        git remote add origin https://github.com/ColinFly/Hello-World.git  //连接远程github项目  

        (如果出现远程origin 已经存在正额错误则git remote rm origin)

        git push -u origin master//将本地项目更新到github项目上去

  ### 获取帮助

  果当你在使用Git时需要帮助，有三种方法可以获得任何git命令的手册页(manpage)帮助信息:
      $ git help <verb>

      $ git <verb> --help

      $ man git-<verb>

      例如，你可以运行如下命令获取对config命令的手册页帮助:

      $ git help config
