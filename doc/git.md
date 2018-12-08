1、打开终端​，cd到已存在项目的目录

​​​2、输入以下命令行，初始化一个本地仓库：

 ​git init
1
3、输入以下命令，把工程所有文件都添加到该仓库中（千万别忘记后面的.号！！！）：

 ​git add .
1
4、输入以下命令，把文件提交到本地仓库：

 git commit -m "Initial commit"​

 如果出现nothing to commit, working directory clean​说明你已经提交好了。
1
2
3
​5、输入以下命令，添加远程仓库地址：

 输入：git remote add origin + 你的仓库地址

 例如：git remote add origin https://git.oschina.net/hhh/GitDemo​.git

 如果出现fatal: remote origin already exists.​说明你已经添加过远程仓库了，输入以下命令删除远程仓库：git remote rm origin，然后再次执行第5步。
1
2
3
4
5
6、​输入以下命令，把文件提交到远程仓库：

 git push -u origin master​
1
然后你就等着它提交完成就完事了。

7、假如第6部失败的话再执行git pull –rebase origin master命令，然后再执行git push -u origin master即可上传成功。

8、完事后假如还是不能拉代码的话再重启项目执行git branch –set-upstream master origin/master即可

## ===========

…or create a new repository on the command line
echo "# Flutter_MyApp" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:TopGuo/Flutter_MyApp.git
git push -u origin master
…or push an existing repository from the command line
git remote add origin git@github.com:TopGuo/Flutter_MyApp.git
git push -u origin master
…or import code from another repository
You can initialize this repository with code from a Subversion, Mercurial, or TFS project.