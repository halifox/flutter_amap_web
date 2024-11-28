@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 卫星图层类，继承自 TileLayer
@JS('TileLayer.Satellite')
class Satellite extends TileLayer {
  external Satellite(SatelliteLayerOptions opts);

  // 获取当前图层的选项
  external dynamic getOptions();

  // 获取当前图层的 zIndex
  external int getzIndex();

  // 设置图层的 zIndex
  external setzIndex(int zIndex);

  // 获取当前图层的透明度
  external double getOpacity();

  // 设置图层的透明度
  external setOpacity(double opacity);

  // 获取支持的缩放级别范围
  external List<int> getZooms();

  // 设置缩放级别范围
  external setZooms(List<int> zooms);

  // 显示图层
  external show();

  // 隐藏图层
  external hide();

  // 销毁图层
  external destroy();
}

// 卫星图层选项
@JS()
@anonymous
class SatelliteLayerOptions {
  external factory SatelliteLayerOptions({
    List<int> zooms, // 支持的缩放级别范围
    double opacity, // 透明度
    bool visible, // 是否显示
    int zIndex, // 图层叠加顺序
    int tileSize, // 切片大小
  });
}
