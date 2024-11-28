@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 构造矩形对象，通过RectangleOptions指定多边形样式
// AMap.Rectangle 提供了矩形的显示和交互功能。
// 用户可以通过 RectangleOptions 配置矩形的各种样式和行为。
@JS()
class Rectangle {
  external Rectangle(RectangleOptions opts);

  // 矩形包含指定点时，返回true
  external bool contains(LngLat point);

  // 设置矩形的范围
  external void setBounds(Bounds bounds);

  // 生成缓冲区
  external void generateBuffer(dynamic gl);

  // 设置矩形的样式选项
  external void setOptions(RectangleOptions optsArg);

  // 获取矩形的平面高度
  external double getPlaneHeight();

  // 隐藏矩形
  external void hide();

  // 设置矩形的平面高度
  external void setHeight(double height);

  // 获取矩形的中心点
  external LngLat getCenter();

  // 显示矩形
  external void show();

  // 获取矩形的扩展数据
  external dynamic getExtData();

  // 设置矩形的扩展数据
  external void setExtData(dynamic extData);

  // 销毁矩形
  external void destroy();

  // 获取矩形的面积
  external double getArea();

  // 获取矩形的当前选项
  external RectangleOptions getOptions();
}

// 配置矩形的选项，支持设置矩形的各种样式和行为
@JS()
@anonymous
class RectangleOptions {
  external factory RectangleOptions({
    AMap map, // 要显示该覆盖物的地图对象
    Bounds bounds, // 矩形的范围
    int zIndex, // 矩形覆盖物的叠加顺序，默认值为10
    bool bubble, // 是否将覆盖物的鼠标或touch等事件冒泡到地图上，默认值为false
    String cursor, // 鼠标悬停时的鼠标样式，IE仅支持cur/ani/ico格式，Opera不支持自定义cursor
    String strokeColor, // 线条颜色，默认值为#00D3FC
    double strokeOpacity, // 轮廓线透明度，取值范围 [0,1] ，默认值为0.9
    int strokeWeight, // 轮廓线宽度，默认值为2
    String fillColor, // 矩形填充颜色，默认值为#00B2D5
    double fillOpacity, // 矩形填充透明度，取值范围 [0,1] ，默认值为0.5
    bool draggable, // 是否可拖拽矩形，默认值为false
    double height, // 矩形平面高度，默认值为0
    dynamic extData, // 用户自定义属性，支持任意数据类型
    String strokeStyle, // 轮廓线样式，实线:solid，虚线:dashed，默认值为solid
    List<int> strokeDasharray, // 虚线样式，当strokeStyle为dashed时有效
  });
}