@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 建筑楼块 3D 图层
@JS()
class Buildings extends TileLayer {
  external Buildings(BuildingLayerOpts opts);

  // 设置楼块样式
  external setStyle(BuildingStyleOptions styleOpts);

  // 获取当前图层的配置选项
  external getOptions();

  // 获取图层的层级
  external getzIndex();

  // 设置图层的层级
  external setzIndex(int zIndex);

  // 获取图层的透明度
  external getOpacity();

  // 设置图层的透明度
  external setOpacity(double opacity);

  // 获取图层的缩放等级范围
  external getZooms();

  // 设置图层的缩放等级范围
  external setZooms(List<int> zooms);

  // 显示图层
  external show();

  // 隐藏图层
  external hide();

  // 销毁图层
  external destroy();
}

// 图层配置选项
@JS()
@anonymous
class BuildingLayerOpts {
  external factory BuildingLayerOpts({
    dynamic wallColor,
    dynamic roofColor,
    double heightFactor,
    BuildingStyleOptions styleOpts,
    List<int> zooms,
    double opacity,
    bool visible,
    int zIndex,
  });
}

// 楼块样式选项
@JS()
@anonymous
class BuildingStyleOptions {
  external factory BuildingStyleOptions({
    String fenceColor,
    double fenceWidth,
  });
}
