@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 标注层，负责管理地图中的标注
@JS()
class LabelsLayer {
  // 构造函数，接受一个 LabelsLayerOptions 对象作为参数
  // 标注层初始化时，您可以设置可见性、透明度、叠加顺序等选项
  external LabelsLayer(LabelsLayerOptions opts);

  // 获取标注层是否避让
  external bool getCollision();

  // 设置标注层是否避让
  external setCollision(bool collision);

  // 获取标注层内标注是否允许被其他标注层避让
  external bool getAllowCollision();

  // 设置标注层内标注是否允许被其他标注层避让
  external setAllowCollision(bool allowCollision);

  // 获取标注层透明度
  external double getOpacity();

  // 设置标注层透明度
  external setOpacity(double opacity);

  // 获取标注层的展示层级范围
  external List<num> getZooms();

  // 设置标注层的展示层级范围
  external setZooms(List<num> zooms);

  // 获取标注层与其它图层的叠加顺序
  external int getzIndex();

  // 设置标注层与其它图层的叠加顺序
  external setzIndex(int zIndex);

  // 添加标注
  external add(List labelMarkers);

  // 移除标注
  external remove(List labelMarkers);

  // 清除所有标注
  external clear();

  // 显示标注层
  external show();

  // 隐藏标注层
  external hide();

  // 获取所有标注层的覆盖物
  external getAllOverlays();
}

// 标注层的选项类，定义了标注层的可配置参数
@JS()
@anonymous
class LabelsLayerOptions {
  // 构造函数，用于配置标注层的选项
  external factory LabelsLayerOptions({
    // 标注层是否可见，默认值为 true
    bool visible,

    // 标注层与其它图层的叠加顺序，默认值为 120
    int zIndex,

    // 标注层透明度，范围从 0（完全透明）到 1（完全不透明）
    double opacity,

    // 标注层内的标注是否避让
    bool collision,

    // 标注层内的标注是否允许其它标注层避让
    bool allowCollision,

    // 标注层展示的层级范围，[minZoom, maxZoom]，控制标注层在哪些缩放级别下显示
    List<num> zooms,
  });
}
