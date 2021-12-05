# Widget
Widget 是 Flutter 世界里对视图的一种轻量级结构化描述，Widget是不可变的，Widget不负责最后的渲染，“一切皆Widget”是Flutter的设计思想


## 动画
* Animation 是 Flutter 动画库中的核心类，会根据预定规则，在单位时间内持续输出动画的当前状态。Animation 知道当前动画的状态（比如，动画是否开始、停止、前进或者后退，以及动画的当前值），但却不知道这些状态究竟应用在哪个组件对象上。换句话说，Animation 仅仅是用来提供动画数据，而不负责动画的渲染。
* AnimationController 用于管理 Animation，可以用来设置动画的时长、启动动画、暂停动画、反转动画等。
* Listener 是 Animation 的回调函数，用来监听动画的进度变化，我们需要在这个回调函数中，根据动画的当前值重新渲染组件，实现动画的渲染。

AnimatedWidget 和 AnimatedBuilder 可以减少模板代码

Hero，两个页面的共享元素之间，做出流畅的页面切换效果。