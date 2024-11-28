@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 自定义图层是一种完全由开发者来指定绘制方法的图层
@JS()
class CustomLayer {
  // 构造函数：初始化时提供 canvas 对象和自定义图层的参数选项
  external CustomLayer(
    dynamic canvas, // canvas 对象
    CustomLayerOption opts, // 默认图层参数
  );

  // 获取当前图层的所有选项
  external CustomLayerOption getOptions();

  // 获取当前图层的层级
  external int getzIndex();

  // 设置图层的层级
  external void setzIndex(int zIndex);

  // 获取当前图层的透明度
  external double getOpacity();

  // 设置图层的透明度
  external void setOpacity(double opacity);

  // 获取图层的缩放等级范围
  external List<int> getZooms();

  // 设置图层的缩放等级范围
  external void setZooms(List<int> zooms);

  // 显示图层
  external void show();

  // 隐藏图层
  external void hide();

  // 设置该图层所在的地图
  external void setMap(AMap map);
}

// 图层选项配置
@JS()
@anonymous
class CustomLayerOption {
  // 绘制函数，初始化完成后，开发者需要给该图层设定render方法，该方法需要实现图层的绘制
  // API会在合适的时机自动调用该方法
  external Function render;

  // 图层缩放等级范围，默认 [2, 20]
  external List<int> zooms;

  // 图层透明度，默认为 1
  external double opacity;

  // 图层是否可见，默认为 true
  external bool visible;

  // 图层的层级，默认为 120
  external int zIndex;

  // 是否主动渲染，默认为 false
  external bool alwaysRender;

  // 构造函数
  external factory CustomLayerOption({
    Function render, // 绘制函数
    List<int> zooms, // 图层缩放等级范围
    double opacity, // 图层透明度
    bool visible, // 图层是否可见
    int zIndex, // 图层的层级
    bool alwaysRender, // 是否主动渲染
  });
}
