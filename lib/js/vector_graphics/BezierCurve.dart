@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 贝塞尔曲线类，支持多种样式的绘制，配置项包括路径、颜色、透明度等。
// 通过BezierCurveOptions传入配置，创建贝塞尔曲线对象。
// 支持路径、样式、动画等配置。
@JS()
class BezierCurve {
  external BezierCurve(BezierCurveOptions opts);

  // 设置贝塞尔曲线的配置项
  external void setOptions(BezierCurveOptions optsArg);

  // 生成贝塞尔曲线的缓冲区
  external void generateBuffer(gl);

  // 获取贝塞尔曲线的路径
  external List<LngLat> getPath();

  // 设置贝塞尔曲线的路径
  external void setPath(List<LngLat> path);

  // 获取贝塞尔曲线的边界框
  external Bounds getBounds();

  // 隐藏贝塞尔曲线
  external void hide();

  // 显示贝塞尔曲线
  external void show();

  // 设置贝塞尔曲线的高度
  external void setHeight(double height);

  // 获取贝塞尔曲线当前的折线高度
  external double getPolylineHeight();

  // 获取贝塞尔曲线的自定义属性
  external dynamic getExtData();

  // 设置贝塞尔曲线的自定义属性
  external void setExtData(dynamic extData);

  // 销毁贝塞尔曲线对象
  external void destroy();

  // 获取贝塞尔曲线的配置项
  external BezierCurveOptions getOptions();

  // 判断指定的点是否在贝塞尔曲线内
  external bool contains(LngLat point);

  // 获取贝塞尔曲线的长度
  external double getLength();
}

// 配置项：包含路径、样式、透明度等，用于自定义贝塞尔曲线的绘制
@JS()
@anonymous
class BezierCurveOptions {
  external factory BezierCurveOptions({
    // 贝塞尔曲线的路径，支持多种方式，如[ [lng, lat], [lng, lat, lng, lat], ...]
    // 可包含控制点和途经点，路径描述为二维数组
    dynamic path,

    // 贝塞尔曲线的叠加顺序，数值越大，曲线越靠前
    int zIndex,

    // 是否将事件冒泡到地图上
    bool bubble,

    // 鼠标悬停时的样式
    String cursor,

    // 贝塞尔曲线的颜色，默认值为#00D3FC
    String strokeColor,

    // 贝塞尔曲线的透明度，取值范围[0,1]，默认为0.5
    double strokeOpacity,

    // 贝塞尔曲线的线条宽度，默认值为2
    double strokeWeight,

    // 描边线的宽度，默认值为1
    double borderWeight,

    // 是否显示描边，默认为false
    bool isOutline,

    // 描边线的颜色，默认值为#00B2D5，仅在isOutline为true时有效
    String outlineColor,

    // 贝塞尔曲线的高度，默认为0，若大于0则会离地绘制
    double height,

    // 是否允许拖拽贝塞尔曲线，默认为false
    bool draggable,

    // 自定义属性，可以存储任意数据，如Polygon的id等
    dynamic extData,

    // 线条样式，默认是实线('solid')，可选虚线('dashed')
    String strokeStyle,

    // 虚线样式，当strokeStyle为'dashed'时有效，描述虚线的线段和空隙
    List<int> strokeDasharray,

    // 折线的拐点样式，默认为'miter'尖角，可选'round'圆角和'bevel'斜角
    String lineJoin,

    // 折线两端的样式，默认为'butt'无头，可选'round'圆头和'square'方头
    String lineCap,

    // 是否绘制成大地线，默认为false
    bool geodesic,

    // 是否显示方向箭头，默认为false，建议折线宽度大于6时使用
    bool showDir,
  });
}
