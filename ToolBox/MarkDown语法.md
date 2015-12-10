>此文档为了指导在wordpress下使用Markdown on Save插件编写markdown。
markdown语法说明请参阅：http://wowubuntu.com/markdown/index.html

1.1 标题
# 一级标题
## 二级标题
### 三级标题


1.2、加粗、斜体

*单星号*

_单下划线_

**双星号**

__双下划线__

1.3、列表

1.3.1 无序列表示例：

* item1
* item2
* item3

1.3.2 有序列表示例：

1. item1
1. item2
1. item3

注意：列表要与上面的内容有换行。

1.3.3 多级列表示例
注意：第二行+前应该有空格。

* item1
 + item1.1
* item2
 + item2.1

注意：多级列表只支持2层。

1.3.4 列表项目有多个段落
注意：正文前有四个空格或制表符

    * 第一段

正文

    * 第二段


1.3.4 分割线

***

---

1.3.5

<table>
    <tr>
        <td>Foo</td>
        <td>Foo</td>
        <td>Foo</td>
        <td>Foo</td>
    </tr>
</table>

**这样不管怎么分都是一段话**
<p>Here is anex
 ample of AppleScript:</p>


1.4、区块引用

1.4.1 普通区块
与标准的markdown语法一致：

> 这是一段文字
> 第二行
> 第三行

1.4.2 嵌套区块

> 第一层

>> 嵌套第二层

> 还是第一层


1.5、链接、图片

注意：链接中如果带有特殊符号，比如 & 需要用转义字符进行标示 \&。

1.5.1 链接
与markdown标准语法兼容。示例：

This is [an example](http://example.com/ “Title”) inline link.
[This link](http://example.net/) has no title attribute.

1.5.2 图片
图片示例：

![Importnew](http://www.importnew.com/wp-content/uploads/2012/11/importNew-233×50.jpg)

建议：翻译时，可以直接引用原文链接。在提交到Importnew时，可以通过 上传或插入 功能将图片上传并插入到文章。

2、代码

2.1、关键词

可以通过“标记需要突出的关键词或变量，例如

`public` => public
`main(String[] args)` => main(String[] args)

2.2、代码段

这里与普通markdown语法有些区别。Java代码示例：

<pre class=”brush: java; gutter: true;”>
// Java代码
class HelloImportnew {

}
</pre>

// Java代码   
class HelloImportnew {

}

类似的，通过将brush参数进行替换可以支持其他语言。
支持的常用语言包括java, xml, shell, html, diff。例如替换为xml：

<pre class=”brush: xml; gutter: true;”>

（其他支持的语言有：actionscript3, applescript, bash, c, csharp, cpp, css, coldfusion, delphi, diff, erlang, groovy, html, javafx, javascript, php, pascal, patch, perl, text, powershell, python, ruby, rails, sql, sass, scala, shell, vb, vbnet, xhtml, xml, xslt）。

推荐开启显示行号。如果不需要显示行号，可以设置 gutter: false。
