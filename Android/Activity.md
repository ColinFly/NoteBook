
## Activity

> 根据博客整理：http://www.jianshu.com/p/33d0a0abd990

### 一.生命周期

![流程图](/home/colin/NoteBook/Resource/Picture/Activity生命周期.png)

### 二.进程的优先级

上文中我们多次提到当内存不足时，当前Activity被系统gc回收的。那么这回收大概是怎么回收，这肯定是一套复杂的系统，但是这里面涉及到一个进程优先级的问题。gc的回收涉及到一个进程的优先级的问题

  - 进程的几个特点

    1.程序启动时创建了进程

    2.程序退出时，进程没有退出

    3.可用内存空间不足时会干掉没用到的进程

  - 进程的优先级分类

        Foreground process（前台进程）
        Visible process （可视进程）
        Service process （服务进程）
        Background process（后台进程）
        Empty process （空进程）



  - 2.1. Foreground process（前台进程）
    用户正在操作的应用程序所在的进程，就是前台进程。即当前Activity的onResume方法被执行了，可以响应点击事件。

  - 2.2. Visible process （可视进程）
    应用程序的ui界面，用户还可以看到，但是不能操作了。（比如全透明了，比如一个非全屏的界面在我们的界面的上方）

  - 2.3. Service process （服务进程）
    当前操作的不是这个程序，但是这个程序有一个后台的 服务 还处于运行状态。

  - 2.4. Background process（后台进程）
    应用程序没有服务处于运行状态，也没有服务在运行，应用程序被最小化了，（activity执行了onStop方法，就是界面最小化）

  - 2.5. Empty process （空进程）
    没有任何四大组件在运行，所有的Activity都关闭了，任务栈清空了。（任务栈的概念我们后面有介绍）


  - savaInstanceState、onRestoreInstanceState的作用
  >savaInstanceState的作用 : 当程序的组件被异常销毁时，做一定的数据保存的工作。
  onRestoreInstanceState的作用：恢复程序被异常的终止时的数据。
  当Activity被异常销毁时，savaInstanceState会保存的数据这个我们已经知道了。

  保存没什么可说，恢复却出现了不同。
  就算我们不复写onRestoreInstanceState方法，也可以利用生命周期的onCreate方法参数 savaInstanceState来进行数据恢复。
  当然如果我们复写onRestoreInstanceState方法,一样可进行数据恢复。

  两者有什么区别呢？

  针对onCreate的参数Bundle savedInstanceState有可能为空：

  >如果之前Activity的savaInstanceState方法没有执行过，那么onCreate的参数Bundle savedInstanceState有可能为空，这样就导致了onCreate的参数Bundle savedInstanceState有可能为空，所以在利用onCreate的参数Bundle savedInstanceState进行数据恢复的时候需要进行参数的非空判断，这个参数不一定是有值的。
  针对onRestoreInstanceState（推荐）：
    如果之前Activity的savaInstanceState方法没有执行过，那么onRestoreInstanceState肯定不会执行。也就是说，只要onRestoreInstanceState方法执行，那么之前肯定执行过savaInstanceState方法。所以，在onRestoreInstanceState方法进行恢复数据的时候，不需要进行什么非空判断,直接用。
  所以：推荐在 onRestoreInstanceState 方法进行数据恢复。
  （Google也是推荐我们这么做的）


### 三.任务栈/Activity的启动模式

> 栈的概念这里就不再赘述，这里知道先进后出就好。就像子弹夹。

- 任务栈的分类

      standard 默认的启动模式,标准模式
      singletop 单一顶部模式 （顶部不会重复）
      singleTask 单一任务栈，干掉头上的其他Activity
      singleInstance 单一实例(单例)，任务栈里面自已自己一个人

- 2.1 manifest指定

  比如我们要指定为singleTask模式
  manifest里面的Activity有个 launchMode属性来制定启动模式：

      <activity android:name=".SecondActivity"

           android:launchMode="singleTask"

           />

- 2.2 代码指定 intent.

 比如我们要指定为singleTop模式

       Intent intent  = new Intent();
      intent.setClass(FirstActivity.this,SecondActivity.class);
      // 通过Intent的addFlag指定
      intent.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP);
      startActivity(intent);

- 2.3、两种方式的对比

1、从优先级来说，代码指定优先于manifest指定

2、两者各有局限，
manifest无法设定 FLAG_ACTIVITY_CLEAR_TOP 标识
代码指定无法指定为 singleInstance启动模式
