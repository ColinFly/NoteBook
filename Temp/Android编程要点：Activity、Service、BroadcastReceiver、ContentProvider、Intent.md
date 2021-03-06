
根据Android SDK的引导可以列出Android应用开发不等不涉及的5个关键类，把Android应用开发入手方向大致划分成了4个大块（前4个类为Android应用主体构成，Intent为交互提供可能）。Activity提供应用活动、Service提供后台服务、BroadcastReceiver提供广播支持、ContentProvider提供数据支持（外部数据）、Intent提供交互支持（直译为意图或者意译为组件桥）。

掌握这5个类是进入Android开发的基础，非常重要，下面就对这5个关键类做一个比较详细的介绍：

Activity：应用活动
Activity几乎承接了所有的用户对应用程序（Application）的操作，Activity自带有一个窗口（Window）的，窗口里面承载了UI操作，这个窗口还可以通过使用不同的主题（Theme）改变样子的，有关主题的使用与编写将在以后的内容中介绍。多个Activity之间可以跳转（导航/Navigate）来完成某个任务。Activity具有生命周期（Lifecycle），还会受到设备状态（Configuration）的影响，比如在默认情况下，横屏竖屏交换时Activity是会重新启动的。编写程序时还要注意Activity运行状态和数据的保存，这个在一个应用程序是否可靠和人性化上至关重要。Activity里还可能要申明一些许可（Permissions），以便使用Android的一些软硬件功能，这些申明可以由代码或者Manifest.xml给出。最后，每个Activity（的入口）一定要在Manifest当中申明，否则会出现Activity无法找到的错误。Activity相关的具体内容会在以后的系列文章中详细讲解。

Service：后台服务
Service是默认没有界面的运行于后台的服务程序。Service的开启方式分为启动（startService）和绑定（bindService）两种。Service也具有生命周期，而且两种开启Service的方法对Service的生命周期效果是不同的，这对用好Service是非常重要的。申明许可可以在代码内或者Manifest内申明，Service必须在Manifest.xml中申明，有关Service的内容在系列文章《Android Service 全解》中会非常详细的介绍。

BroadcastReceiver：广播支持
广播并不是通常所说的无线电广播，但是Android提供的广播和无线广播在形式上又非常相似，都是一个或多个发送者，一个或多个接收者，信息由发送者到接收者构成的单向通路结构。无线广播发送出来的是电波，Android系统所发送出来的组件桥（Intent）对象，即Android广播就是广播组件桥对象。BroadcastReceiver在注册（代码中Registe或者Manifest.xml中申明）之后可以自动监听符合预先给定条件的组件桥，如果有则会回调（callback或者invoke）此BroadcastReceiver里的onReceive()方法。Android系统有一些默认的已经存在的Broadcast（比如每分钟广播一次的与时间相关的Broadcast）可以直接监听，也可以自己编写Broadcast。相关内容将会在以后的内容中详细介绍。

ContentProvider：数据支持（外部数据）
从ContentProvider（直译为内容支持/内容提供）字面上来看，很容易发现这是一个数据服务机制。ContentProvider向外部方便的提供内容（基本上什么内容都可以）的使用，这里的外部可以是另外的进程。通过ContentResolver类对象可以访问到ContentProvider提供的内容，当然需要通过一些安全性验证，比如需要申明一些Permission。ContentResolver可以认为是ContentProvider的客户端（Client）。在涉及到大量数据的操作时候，数据库肯定是需要参与操作的了，Android使用的是一个轻量级的数据库系统SQLite，精简了很多标准SQL函数，只留下少数非常有用的。Android还专门提供了一个包（android.database.sqlite）的内容来使用SQLite。这部分内容将在之后的内容中详细介绍。

Intent：意图（组件桥）
Intent是Android应用开发里很重要的一个组件，很多书上直译为“意图”，不太好理解，意译为“组件桥”更好，也就是连接两个组件（Component）之间的桥梁（Bridge）。通过Intent可以从一个组件来启动另一个组件，不管是自己定义的还是系统定义的，并且在之间Intent中夹带Extra数据以达到信息交换的目的。Intent里面还可以设置一些有关组件（主要是Activity）启动的标记（flag），这些标记也可以在相应组件的Manifest.xml里面申明，这些flag关系到组件启动和逻辑存储的方式。Intent的内容范围涉及非常广，所以其详细内容的介绍将在前面4个内容的介绍中一并介绍。

至此，Android应用编程入门的几个要点都简单的介绍了。如果要对Android应用编程有个深入的了解，除了深入研究上面提到的几个方面的编程方法外，还应该深入研究这几个方面的Android应用层框架的源码，了解运行原理等。这方面的内容将在我搞清楚明白之后再介绍~~~
