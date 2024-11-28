@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 路网图层，展示道路信息
@JS('TileLayer.RoadNet')
class RoadNet extends TileLayer {
  external RoadNet(RoadnetLayerOptions opts);

  // 显示图层
  external show();

  // 隐藏图层
  external hide();

  // 获取图层选项
  external RoadnetLayerOptions getOptions();

  // 获取图层的 zIndex
  external int getzIndex();

  // 设置图层的 zIndex
  external setzIndex(int zIndex);

  // 获取图层的透明度
  external double getOpacity();

  // 设置图层的透明度
  external setOpacity(double opacity);

  // 获取支持的缩放级别
  external List<int> getZooms();

  // 设置支持的缩放级别
  external setZooms(List<int> zooms);

  // 销毁图层
  external destroy();
}

// 图层选项
@JS()
@anonymous
class RoadnetLayerOptions {
  external factory RoadnetLayerOptions({
    List<int> zooms,
    double opacity,
    bool visible,
    int zIndex,
    int tileSize,
  });
}
