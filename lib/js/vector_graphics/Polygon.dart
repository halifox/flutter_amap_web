@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 构造多边形对象，通过PolygonOptions指定多边形样式
@JS()
class Polygon {
  external Polygon(PolygonOptions opts);

  // 成员函数
  external hide();

  external show();

  external getExtData();

  external setExtData(dynamic extData);

  external getOptions();

  external setOptions(PolygonOptions opts);

  external getPath();

  external setHeight(double height);

  external setExtrusionHeight(double extrusionHeight);

  external getExtrusionHeight();

  external getBounds();

  external destroy();

  external getArea(bool isTerrain);

  external contains(LngLat originPoint);

  external setPath(List<LngLat> path);

  external getPlaneHeight();
}

// PolygonOptions
// path 类型：(Array<LngLat> | Array<Array<LngLat>> | Array<Array<Array<LngLat>>>) 多边形轮廓线的节点坐标数组。
// 支持单个普通多边形({Array })，单个带孔多边形({Array<Array >})，多个带孔多边形({Array<Array<Array >>})
// zIndex 类型：number 默认10 多边形覆盖物的叠加顺序。
// bubble 类型：boolean 默认false 是否将覆盖物的鼠标或touch等事件冒泡到地图上
// cursor 类型：string? 指定鼠标悬停时的鼠标样式
// strokeColor 类型：string 默认#00D3FC 线条颜色，使用16进制颜色代码赋值
// strokeOpacity 类型：number 默认0.9 轮廓线透明度
// strokeWeight 类型：number 默认2 轮廓线宽度
// fillColor 类型：string 默认#00B2D5 多边形填充颜色
// fillOpacity 类型：number 默认0.5 多边形填充透明度
// draggable 类型：boolean 默认false 设置多边形是否可拖拽
// height 类型：number 默认0 设置polygon是否离地绘制
// extrusionHeight 类型：number 默认0 设置多边形是否拉伸为立面体
// wallColor 类型：(Array<String> | String) 默认#00D3FC polygon立面体侧面颜色
// roofColor 类型：(Array<String> | String) 默认#00B2D5 polygon立面体顶面颜色
// extData 类型：object? 用户自定义属性
// strokeStyle 类型：("solid" | "dashed") 默认solid 轮廓线样式
// strokeDasharray 类型：Array<number>? 勾勒形状轮廓的虚线和间隙的样式
@JS()
@anonymous
class PolygonOptions {
  external factory PolygonOptions({
    List<dynamic> path,
    int zIndex,
    bool bubble,
    String cursor,
    String strokeColor,
    double strokeOpacity,
    double strokeWeight,
    String fillColor,
    double fillOpacity,
    bool draggable,
    double height,
    double extrusionHeight,
    dynamic wallColor,
    dynamic roofColor,
    dynamic extData,
    String strokeStyle,
    List<int> strokeDasharray,
  });
}
