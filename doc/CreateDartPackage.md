第一步：创建Dart包
您可以通过Android Studio：File>New>New Flutter Project 来创建：

image-20181204195346470

您也可以通过使用--template=package 来执行 flutter create 命令来创建：

flutter create --template=package hello
这将在hello/文件夹下创建一个具有以下专用内容的package工程：

lib/hello.dart：Package的Dart代码

test/hello_test.dart：Package的单元测试代码。

可以使用 dartdoc 工具来为Package生成文档，开发者需要做的就是遵守文档注释语法在代码中添加文档注释，最后使用dartdoc可以直接生成API文档（一个静态网站）。文档注释是使用三斜线"///"开始，如：

/// The event handler responsible for updating the badge in the UI.
void updateBadge() {
  ...
}

发布Package
一旦实现了一个包，我们可以在Pub上发布它 ，这样其他开发者就可以轻松使用它。

在发布之前，检查pubspec.yaml、README.md以及CHANGELOG.md文件，以确保其内容的完整性和正确性。然后，运行 dry-run 命令以查看是否都准备OK了:

flutter packages pub publish --dry-run
验证无误后，我们就可以运行发布命令了：

flutter packages pub publish