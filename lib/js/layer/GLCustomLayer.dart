@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 3D 自定义图层
// AMap.GLCustomLayer 提供一个可以自定义绘制的 3D 图层，开发者可以通过自定义渲染方法来绘制图层内容。
@JS()
class GLCustomLayer {
  external GLCustomLayer(GlCustomLayerOptions opts);

  // 获取当前图层所对应的地图对象
  external getMap();

  // 获取当前图层的层级
  external getzIndex();

  // 设置图层的层级
  external setzIndex(int zIndex);

  // 获取图层的透明度
  external getOpacity();

  // 设置图层的透明度
  external setOpacity(double opacity);

  // 获取图层的缩放级别范围
  external getZooms();

  // 设置图层的缩放级别范围
  external setZooms(List<int> zooms);

  // 显示图层
  external show();

  // 隐藏图层
  external hide();
}

// 图层选项参数
// opts.init: 类型 Function, 初始化的时候，开发者可以在这个函数参数里面获取 gl 上下文，进行一些初始化的操作。
// opts.render: 类型 Function, 绘制函数，开发者需要给该图层设定 render 方法，该方法需要实现图层的绘制。
// opts.zooms: 类型 [Number, Number], 默认 [2, 20], 图层缩放等级范围。
// opts.opacity: 类型 Number, 默认值为 1, 图层透明度。
// opts.visible: 类型 Boolean, 默认值为 true, 图层是否可见。
// opts.zIndex: 类型 Number, 默认值为 120, 图层的层级。
@JS()
@anonymous
class GlCustomLayerOptions {
  external factory GlCustomLayerOptions({
    Function init,
    Function render,
    List<int> zooms,
    double opacity,
    bool visible,
    int zIndex,
  });
}
