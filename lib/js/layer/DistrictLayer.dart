@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// AMap.DistrictLayer 图层，提供行政区划层的显示功能，支持设置图层样式、层级、透明度等属性
@JS()
class DistrictLayer extends TileLayer {
  external DistrictLayer(DistrictLayerOptions opts);

  // 设置显示的国家 SOC 国家代码、名称，Bounds对照表下载
  external setSOC(String SOC);

  // 设置显示的行政区域编码
  external setDistricts(String adcodes);

  // 获取显示的行政区域编码
  external getDistricts();

  // 设置图层样式
  external setStyles(DistrictLayerStyle styles);

  // 获取图层样式
  external getStyles();

  // 设置行政区划编码
  external setAdcode(String adcodes);

  // 获取图层初始化选项
  external getOptions();

  // 获取图层的层级
  external getzIndex();

  // 设置图层的层级
  external setzIndex(int zIndex);

  // 获取图层透明度
  external getOpacity();

  // 设置图层透明度
  external setOpacity(double opacity);

  // 获取图层缩放等级范围
  external getZooms();

  // 设置图层缩放等级范围
  external setZooms(List<int> zooms);

  // 显示图层
  external show();

  // 隐藏图层
  external hide();
}

// 图层初始化参数，包含行政区编码、缩放等级范围等选项
@JS()
@anonymous
class DistrictLayerOptions {
  external factory DistrictLayerOptions({
    String adcode,
    String SOC,
    int depth,
    int zIndex,
    double opacity,
    bool visible,
    List<int> zooms,
    DistrictLayerStyle styles,
  });
}

// 图层样式设置，包括各行政区边界线的颜色、宽度等
@JS()
@anonymous
class DistrictLayerStyle {
  external factory DistrictLayerStyle({
    dynamic strokeWidth,
    dynamic zIndex,
    dynamic coastlineStroke,
    dynamic nationStroke,
    dynamic provinceStroke,
    dynamic cityStroke,
    dynamic countyStroke,
    dynamic fill,
  });
}
