@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// Polyline 构造折线对象，支持 lineString 和 MultiLineString
@JS()
class Polyline {
  external Polyline(PolylineOptions opts);

  // 隐藏折线
  external hide();

  // 显示折线
  external show();

  // 获取自定义属性
  external getExtData();

  // 获取折线配置
  external getOptions();

  // 获取折线路径
  external getPath();

  // 设置自定义属性
  external setExtData(dynamic extData);

  // 设置折线高度
  external setHeight(double height);

  // 销毁折线对象
  external destroy();

  // 获取折线的包围盒
  external getBounds();

  // 设置折线路径
  external setPath(List<LngLat> path);

  // 移动折线位置
  external moveWithPos(double dx, double dy);

  // 获取折线的长度
  external getLength(bool isTerrain);

  // 获取折线的终点距离
  external getEndDistance();

  // 生成缓冲区
  external generateBuffer(gl);

  // 设置折线选项
  external setOptions(PolylineOptions optsArg);

  // 判断点是否在折线内
  external contains(LngLat point);

  // 获取折线高度
  external getPolylineHeight();
}

// PolylineOptions 配置折线的属性
@JS()
@anonymous
class PolylineOptions {
  external factory PolylineOptions({
    List<LngLat> path,
    int zIndex,
    bool bubble,
    String cursor,
    String strokeColor,
    double strokeOpacity,
    int strokeWeight,
    bool isOutline,
    int borderWeight,
    String outlineColor,
    bool draggable,
    double height,
    dynamic extData,
    String strokeStyle,
    List<int> strokeDasharray,
    String lineJoin,
    String lineCap,
    bool geodesic,
    bool showDir,
  });
}
