## Fresco

### 1.简介

>FrescoSupport是基于Facebook开源库Fresco而包装的一个管理类。Fresco 是一个强大的图片加载组件，它设计有一个叫做 image pipeline 的模块，负责从网络，从本地文件系统，本地资源加载图片。且包含3级缓存机制（2级内存，1级文件）。Drawees 模块负责图片的显示。

### 2.1 Fresco特性

1、在5.0以下系统，Fresco将图片放到一个特别的内存区域（Ashmem）。当然，在图片不显示的时候，占用的内存会自动被释放。
2、支持渐进式图片格式：先呈现大致的图片轮廓，然后随着图片下载的继续，呈现逐渐清晰的图片。
3、支持加载Gif图，支持WebP格式

### 2.2 Drawees

Drawees支持的特性如下：

自定义居中焦点(对人脸等图片显示非常有帮助)

    圆角图，当然圆圈也行。

    下载失败之后，点击重现下载

    自定义占位图，自定义overlay, 或者进度条

    指定用户按压时的overlay

### 2.3 image pipeline

    image pipeline 的设计，允许用户在多方面控制图片的加载：

    为同一个图片指定不同的远程路径，或者使用已经存在本地缓存中的图片
    先显示一个低解析度的图片，等高清图下载完之后再显示高清图
    加载完成回调通知
    对于本地图，如有EXIF缩略图，在大图加载完成之前，可先显示缩略图
    缩放或者旋转图片
    处理已下载的图片
    WebP 支持

### 2.4 官方文档

    官方maven依赖，默认使用第一个依赖就好，使用官网的网络层；第二个依赖用来吧Android网络层替
    换成OKHttp。

    dependencies {
      compile 'com.facebook.fresco:fresco:0.6.0+'
      compile 'com.facebook.fresco:imagepipeline-okhttp:0.6.0+'
    }
