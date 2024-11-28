@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// AMap.VectorLayer 是一个矢量图层类，允许在地图上添加各种图形元素，如圆形、矩形等。
// 构造函数的参数为 opts（Object），其中包括一些属性用于配置图层的行为。

@JS()
class VectorLayer {
  // 构造函数：创建一个新的 VectorLayer 实例，接受一个可选的 opts 参数来配置图层的显示和其他属性。
  external VectorLayer(VectorLayerOptions opts);

// 成员函数：
// add(vectors) - 向图层中添加矢量元素。
// remove(vectors) - 从图层中移除矢量元素。
// show() - 显示图层。
// hide() - 隐藏图层。
// has() - 检查图层中是否包含特定的矢量元素。
// clear() - 清空图层中的所有元素。
// setOptions(opt) - 设置图层的选项。
// query(geometry) - 根据几何图形查询图层中包含的元素。
// getBounds() - 获取图层的边界。
}

@JS()
@anonymous
class VectorLayerOptions {
  // opts.visible (boolean, default true) - 是否显示图层，默认为 true。
  external factory VectorLayerOptions({
    bool visible,
    num zIndex,
  });
}
