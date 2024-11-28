@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 室内图层，用于在适当级别展示室内地图，并提供显示商铺tip、切换楼层等功能
@JS()
class IndoorMap extends TileLayer {
  external IndoorMap(IndoorMapOptions opts);

  // 显示指定 POI 室内信息
  external showIndoorMap(String indoorid, [int floor, String shopid]);

  // 切换楼层
  external showFloor(int floor);

  // 显示室内图层
  external show();

  // 隐藏室内图层
  external hide();

  // 设置地图
  external setMap(AMap map);

  // 设置图层叠加顺序
  external setzIndex(int index);

  // 显示楼层切换控件
  external showFloorBar();

  // 隐藏楼层切换控件
  external hideFloorBar();

  // 设置图层透明度
  external setOpacity(double opacity);

  // 获取图层透明度
  external getOpacity();

  // 显示商铺标签
  external showLabels();

  // 隐藏商铺标签
  external hideLabels();

  // 获取选中的建筑ID
  external getSelectedBuildingId();

  // 获取选中的建筑
  external getSelectedBuilding();
}

// opts 参数信息
@JS()
@anonymous
class IndoorMapOptions {
  external factory IndoorMapOptions({
    num zIndex,
    num opacity,
    String cursor,
    bool hideFloorBar,
  });
}
