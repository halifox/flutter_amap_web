@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 海量点类
@JS()
class MassMarks {
  external MassMarks(List<MassData> data, MassMarkersOptions opts);

  // 设置地图
  external setMap(AMap map);

  // 获取地图
  external AMap getMap();

  // 获取数据
  external List<MassData> getData();

  // 设置数据
  external setData(List<MassData> data);

  // 获取样式
  external MassMarkersStyleOptions getStyle();

  // 设置样式
  external setStyle(MassMarkersStyleOptions style);

  // 设置透明度
  external setOpacity(double opacity);

  // 获取透明度
  external double getOpacity();

  // 设置叠加顺序
  external setzIndex(int zIndex);

  // 获取叠加顺序
  external int getzIndex();

  // 设置缩放级别
  external setZooms(List<int> zooms);

  // 获取支持的缩放级别
  external List<int> getZooms();

  // 显示海量点
  external show();

  // 隐藏海量点
  external hide();

  // 清除海量点
  external clear();
}

// 海量点数据
@JS()
@anonymous
class MassData {
  external factory MassData({
    LngLat lnglat,
    int style,
  });
}

// 海量点样式选项
@JS()
@anonymous
class MassMarkersStyleOptions {
  external factory MassMarkersStyleOptions({
    String url,
    Size size,
    Pixel anchor,
    int zIndex,
    double rotation,
  });
}

// 海量点参数
@JS()
@anonymous
class MassMarkersOptions {
  external factory MassMarkersOptions({
    int zIndex,
    double opacity,
    List<int> zooms,
    String cursor,
    dynamic style,
  });
}
