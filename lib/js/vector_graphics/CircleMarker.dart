@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 圆形标记对象，使用 CircleOptions 指定圆形样式
@JS()
class CircleMarker {
  external CircleMarker(CircleMarkerOptions opts);

  // 检查指定点是否在圆形范围内
  external bool contains(LngLat point);

  // 隐藏圆形标记
  external void hide();

  // 设置圆的半径
  external void setRadius(double radius);

  // 生成圆形缓冲区
  external void generateBuffer();

  // 获取圆心位置
  external LngLat getCenter();

  // 获取圆的半径
  external double getRadius();

  // 显示圆形标记
  external void show();

  // 设置圆形的选项
  external void setOptions(CircleMarkerOptions optsArg);

  // 获取当前圆形标记的所有选项
  external CircleMarkerOptions getOptions();

  // 获取用户自定义的额外数据
  external dynamic getExtData();

  // 获取圆形标记的当前海拔
  external double getCurAltitude();

  // 设置用户自定义的额外数据
  external void setExtData(dynamic extData);

  // 销毁圆形标记
  external void destroy();
}

// 圆形标记的选项类
@JS()
@anonymous
class CircleMarkerOptions {
  external factory CircleMarkerOptions({
    LngLat center, // 圆心位置
    double radius, // 圆半径，单位：px，最大值 64
    int zIndex, // 多边形覆盖物的叠加顺序，默认 10
    bool bubble, // 是否将覆盖物的鼠标或 touch 等事件冒泡到地图上，默认 false
    String cursor, // 鼠标悬停时的鼠标样式
    String strokeColor, // 轮廓线颜色，16 进制颜色代码，默认 #00D3FC
    double strokeOpacity, // 轮廓线透明度，取值范围 [0, 1]，默认 0.9
    double strokeWeight, // 轮廓线宽度，默认 2
    String fillColor, // 多边形填充颜色，16 进制颜色代码，默认 #00B2D5
    double fillOpacity, // 多边形填充透明度，取值范围 [0, 1]，默认 0.5
    bool draggable, // 是否可拖拽，默认 false
    dynamic extData, // 用户自定义的额外数据
  });
}
