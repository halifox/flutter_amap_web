@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 构造多边形对象，通过EllipseOptions指定多边形样式
// AMap.Ellipse 类用于在地图上绘制椭圆，提供多种可配置的样式选项
@JS()
class Ellipse {
  external Ellipse(EllipseOptions opts);

  // 设置椭圆的中心点
  // 设置椭圆圆心坐标
  external setCenter(LngLat center);

  // 设置椭圆的半径
  // 设置椭圆的横向和纵向半径，单位：米
  external setRadius(List<int> radius);

  // 设置椭圆的高度
  // 设置椭圆离地的绘制高度，默认为0，单位：米
  external setHeight(double height);

  // 获取椭圆的中心点
  // 返回椭圆的圆心坐标
  external LngLat getCenter();

  // 获取椭圆的半径
  // 返回椭圆的横向和纵向半径
  external List<int> getRadius();

  // 生成缓冲区
  // 在 WebGL 上生成椭圆的缓冲区，通常用于绘制
  external generateBuffer(dynamic gl);

  // 隐藏椭圆
  // 隐藏当前椭圆对象
  external hide();

  // 设置椭圆的样式参数
  // 设置或修改椭圆的样式选项
  external setOptions(EllipseOptions optsArg);

  // 获取椭圆的平面高度
  // 获取当前椭圆平面高度值
  external double getPlaneHeight();

  // 显示椭圆
  // 显示当前椭圆对象
  external show();

  // 获取椭圆的自定义数据
  // 获取用户自定义属性，支持任意数据类型
  external dynamic getExtData();

  // 设置椭圆的自定义数据
  // 设置用户自定义属性，支持任意数据类型
  external setExtData(dynamic extData);

  // 销毁椭圆对象
  // 移除并销毁当前椭圆对象
  external destroy();

  // 获取椭圆的面积
  // 返回椭圆的面积值
  external double getArea();

  // 判断点是否在椭圆内
  // 判断指定的点是否位于当前椭圆内
  external bool contains(LngLat point);

  // 获取椭圆的当前配置
  // 获取当前椭圆对象的所有配置项
  external EllipseOptions getOptions();
}

// Ellipse 的样式配置选项
@JS()
@anonymous
class EllipseOptions {
  external factory EllipseOptions({
    dynamic center, // 类型：LngLatLike，椭圆圆心
    List<int> radius, // 类型：[number, number]，椭圆的半径，单位：米
    int zIndex, // 类型：number，椭圆的叠加顺序，默认为 10
    bool bubble, // 类型：boolean，是否冒泡事件，默认为 false
    String cursor, // 类型：string，自定义鼠标悬停样式
    String strokeColor, // 类型：string，线条颜色，默认值为 #00D3FC
    double strokeOpacity, // 类型：number，线条透明度，取值范围 [0,1]，默认为 0.9
    int strokeWeight, // 类型：number，线条宽度，默认为 2
    String fillColor, // 类型：string，填充颜色，默认值为 #00B2D5
    double fillOpacity, // 类型：number，填充透明度，默认为 0.5
    bool draggable, // 类型：boolean，是否可拖拽，默认为 false
    double height, // 类型：number，椭圆的高度，默认值为 0
    dynamic extData, // 类型：object，自定义属性，支持任意数据类型
    String strokeStyle, // 类型：string，轮廓线样式，默认为 solid（实线）
    List<int> strokeDasharray, // 类型：Array<number>，虚线样式，strokeStyle 为 dashed 时有效
  });
}