@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 实时交通图层类，继承自 TileLayer
@JS('TileLayer.Traffic')
class Traffic extends TileLayer {
  external Traffic(TrafficLayerOptions opts);

  // 停止自动刷新
  external stopFresh();

  // 获取图层的当前配置选项
  external getOptions();

  // 获取图层的 zIndex
  external getzIndex();

  // 设置图层的 zIndex
  external setzIndex(int zIndex);

  // 获取图层的透明度
  external getOpacity();

  // 设置图层的透明度
  external setOpacity(double opacity);

  // 获取支持的缩放级别
  external getZooms();

  // 设置支持的缩放级别
  external setZooms(List<int> zooms);

  // 显示图层
  external show();

  // 隐藏图层
  external hide();
}

// TrafficLayerOptions 配置类，包含实时交通图层的相关参数
@JS()
@anonymous
class TrafficLayerOptions {
  external factory TrafficLayerOptions({
    bool autoRefresh,
    int interval,
    List<int> zooms,
    double opacity,
    bool visible,
    int zIndex,
    int tileSize,
  });
}
