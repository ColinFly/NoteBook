## RX使用初步

>RxJava只是ReactiveX(Reactive Extensions)的一种java实现, ReactiveX是一种响应式扩展框架，有很多种实现，如RxAndroid, RxJS, RxSwift, RxRuby等等。RX采用一种类似于观察者的形式来实现各种功能，跟我们一般的写代码思路差别较大。刚开始接触可能会觉得难以理解，但是一旦掌握地话就会体会到其强大之处。其原理就是创建一个Observable对象来干活，然后使用各种操作符建立起来的链式操作，就如同流水线一样把你想要处理的数据一步一步地加工成你想要的成品然后发射(emit)给Subscriber。

RxAndroid是对RxJava在Android上的扩展，如果你是做安卓开发的话，各种主线程和子线程的操作肯定会让你觉得头疼，RxAndroid可以很容易地解决你的这种困扰。

### 基本操作符

  create：创建被观察者，并根据适当的时机执行onNext()，onError()，onComplete()

  range:根据设置的起始值n和数目m，发射一系列>=n的值共m个，类似递增操作

  defer:每次订阅都会得到一个最新的Observable对象，可以确保数据是最新的

  interval:创建的Observable对象会从0开始，每隔固定的时间发射一个数字，需要在主线程中订阅

  scan：对一个序列的数据应用一个函数，并将这个函数的结果发射出去作为下个数据应用这个函数时候的第一个参数使用，有点类似于递归操作。

  filter：返回满足过滤条件的数据。

  skip：将数据过滤掉前n项。

  take：只取数据的前n项。

  startWith：在源Observable发射的数据前面插上一些数据。
