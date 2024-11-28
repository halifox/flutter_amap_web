@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 为了满足基于矢量瓦片块的数据可视化、矢量瓦片边界展示等开发需求，提供了简易矢量瓦片图层。
@JS()
class MapboxVectorTileLayer {
  external MapboxVectorTileLayer(MapboxVTLayerOptions opts);

  // 设置图层样式
  external setStyles(MapboxVTLayerStyle styles);

  // 通过矩形过滤
  external filterByRect(Polygon rect, String type);

  // 获取图层样式
  external MapboxVTLayerStyle getStyles();

  // 绑定事件
  external on(String type, Function fn, dynamic option);

  // 隐藏图层
  external hide();

  // 显示图层
  external show();

  // 获取图层的选项
  external MapboxVTLayerOptions getOptions();

  // 获取图层的层级
  external int getzIndex();

  // 设置图层层级
  external setzIndex(int zIndex);

  // 获取图层透明度
  external double getOpacity();

  // 设置图层透明度
  external setOpacity(double opacity);

  // 获取图层的缩放范围
  external List<int> getZooms();

  // 设置图层缩放范围
  external setZooms(List<int> zooms);
}

// 图层初始化参数
@JS()
@anonymous
class MapboxVTLayerOptions {
  external factory MapboxVTLayerOptions({
    int zIndex,
    double opacity,
    String url,
    bool visible,
    List<int> zooms,
    List<int> dataZooms,
    MapboxVTLayerStyle styles,
  });
}

// 图层样式
@JS()
@anonymous
class MapboxVTLayerStyle {
  external factory MapboxVTLayerStyle({
    PolygonStyle polygon,
    LineStyle line,
    PointStyle point,
    PolyhedronStyle polyhedron,
  });
}

// 面类型的样式
@JS()
@anonymous
class PolygonStyle {
  external factory PolygonStyle({
    String sourceLayer,
    String color,
    double borderWidth,
    List<double> dash,
    String borderColor,
    List<dynamic> injection,
    bool visible,
  });
}

// 线类型数据的样式
@JS()
@anonymous
class LineStyle {
  external factory LineStyle({
    String sourceLayer,
    String color,
    double lineWidth,
    List<dynamic> dash,
    List<dynamic> injection,
    bool visible,
  });
}

// 点类型数据的样式
@JS()
@anonymous
class PointStyle {
  external factory PointStyle({
    String sourceLayer,
    double radius,
    String color,
    double borderWidth,
    String borderColor,
    List<dynamic> injection,
    bool visible,
  });
}

// 多面体类型的样式
@JS()
@anonymous
class PolyhedronStyle {
  external factory PolyhedronStyle({
    String sourceLayer,
    String topColor,
    String sideColor,
    String texture,
    List<dynamic> injection,
    bool visible,
  });
}
