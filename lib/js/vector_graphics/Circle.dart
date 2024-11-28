@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// Circle 类用于创建圆形覆盖物，通过 CircleOptions 配置圆形的样式、位置等信息。
// Circle 类实现了事件监听接口，可以监听相关事件，例如点击、双击等事件。
@JS()
class Circle {
  external Circle(CircleOptions opts);

  // 获取 SVG DOM，返回圆形的 SVG 表示。
  external String get svgDom;

  // 设置圆心位置
  external setCenter(LngLat center);

  // 设置圆半径
  external setRadius(double radius);

  // 获取圆心位置
  external LngLat getCenter();

  // 获取圆半径
  external double getRadius();

  // 判断给定的点是否在圆形区域内
  external bool contains(LngLat point);

  // 设置圆的样式和其他选项
  external setOptions(CircleOptions optsArg);

  // 隐藏圆形覆盖物
  external hide();

  // 设置圆的离地高度
  external setHeight(double height);

  // 获取圆的平面高度
  external double getPlaneHeight();

  // 显示圆形覆盖物
  external show();

  // 获取用户自定义的数据
  external dynamic getExtData();

  // 设置用户自定义的数据
  external setExtData(dynamic extData);

  // 销毁圆形覆盖物
  external destroy();

  // 获取圆形的面积
  external double getArea();

  // 获取当前圆形的所有选项
  external CircleOptions getOptions();
}

// CircleOptions 类用于配置圆形覆盖物的样式和行为。通过这些选项可以自定义圆心、半径、颜色、透明度等属性。
@JS()
@anonymous
class CircleOptions {
  external factory CircleOptions({
    LngLat center, // 圆心位置
    double radius, // 圆半径，单位：米
    int zIndex, // 覆盖物的叠加顺序，默认值为10
    bool bubble, // 是否将事件冒泡到地图上，默认值为false
    String cursor, // 鼠标悬停时的样式
    String strokeColor, // 轮廓线颜色，默认值为#00D3FC
    double strokeOpacity, // 轮廓线透明度，取值范围[0,1]，默认值为0.9
    double strokeWeight, // 轮廓线宽度，默认值为2
    String fillColor, // 填充颜色，默认值为#00B2D5
    double fillOpacity, // 填充透明度，取值范围[0,1]，默认值为0.5
    bool draggable, // 设置圆是否可拖拽，默认值为false
    double height, // 设置圆的离地高度，默认值为0
    dynamic extData, // 用户自定义数据
    String strokeStyle, // 轮廓线样式，取值："solid"（实线）或 "dashed"（虚线）
    List<int> strokeDasharray, // 虚线样式，适用于 strokeStyle 为 "dashed" 时
  });
}
