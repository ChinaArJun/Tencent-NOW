# NOW
-NOW项目主要是基于[ijkplayer ](https://github.com/Bilibili/ijkplayer)的. 最好是打包成framework

-已经准备好了一份打包好的分享给大家

-百度云盘链接:https://pan.baidu.com/s/1smNcwsX  密码:xpsq

-记得打开项目后将打包好的[ijkplayer ]拖入项目，不然会报错


# IOS视频直播:高仿 腾讯旗下【NOW】直播 —— 喜欢的记点star谢谢

随着今年近两年直播平台的火热，腾讯旗下NOW直播平台也进驻市场
这还仅仅是游戏直播这块的蛋糕.直播

行业的竞争会越来越激烈, 不管是主播还是直播平台都面临着激烈的竞争, 当然直播
行业也会越来越规范, 直播元素也越来越多.

视频直播初窥
视频直播，可以分为 采集，前处理，编码，传输, 服务器处理，解码，渲染

采集: 
iOS系统因为软硬件种类不多, 硬件适配性比较好, 所以比较简单. 而Android端市面上机型众多, 要做些机型的适配工作.
PC端是最麻烦的, 各种奇葩摄像头驱动.所以现在很多的中小型直播平台, 都放弃了PC的直播, 更有一些直播平台只做iOS端的视频直播.

编码: 
重难点在于要在分辨率，帧率，码率，GOP等参数设计上找到最佳平衡点。
iOS8之后,Apple开放了VideoToolbox.framework, 可以直接进行硬编解码, 
这也是为什么现在大多数直播平台最低只支持到iOS8的原因之一. 
iOS端硬件兼容性比较好, 可以直接采取硬编码.


效果图如下

![12](https://github.com/ChinaArJun/Tencent-NOW/blob/master/NowGif.gif)


![12](https://github.com/ChinaArJun/Tencent-NOW/blob/master/image1.png)


![12](https://github.com/ChinaArJun/Tencent-NOW/blob/master/image2.png)

已增加了对IPad的适配，更加丝滑流畅

![12](https://github.com/ChinaArJun/Tencent-NOW/blob/master/img_0257.png)

![12](https://github.com/ChinaArJun/Tencent-NOW/blob/master/img_0258.png)
