@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// Canvas图层类，用户可以将一个 Canvas 作为图层添加在地图上，Canvas图层会随缩放级别而自适应缩放。
@JS()
class CanvasLayer {
  // 构造函数，接收 ImageLayerOptions 参数来初始化 CanvasLayer。
  external CanvasLayer(ImageLayerOptions opts);

  // 设置 Canvas 对象
  // 参数 canvas：HTMLCanvasElement 类型，Canvas DOM 对象。
  external setCanvas(dynamic canvas);

  // 获取 Canvas 图层对应的 DOM 元素。
  external dynamic getElement();

  // 获取当前 Canvas 图层的经纬度范围。
  external List<num> getBounds();

  // 设置 Canvas 图层的经纬度范围。
  // 参数 bounds：支持传入 [minlng, minlat, maxlng, maxlat] 或 Bounds 类型。
  external setBounds(List<num> bounds);

  // 刷新 Canvas 图层。
  external reFresh();

  // 获取 Canvas 图层的设置项。
  external ImageLayerOptions getOptions();

  // 获取 Canvas 图层的层级。
  external int getzIndex();

  // 设置 Canvas 图层的层级。
  // 参数 zIndex：指定图层的层级，数值越大，图层显示越在前面。
  external setzIndex(int zIndex);

  // 获取 Canvas 图层的透明度。
  external double getOpacity();

  // 设置 Canvas 图层的透明度。
  // 参数 opacity：透明度值，范围是 [0, 1]，1 表示完全不透明，0 表示完全透明。
  external setOpacity(double opacity);

  // 获取 Canvas 图层的缩放级别范围。
  external List<num> getZooms();

  // 设置 Canvas 图层的缩放级别范围。
  // 参数 zooms：一个包含两个数值的数组，表示图层的缩放级别范围。
  external setZooms(List<num> zooms);

  // 显示 Canvas 图层。
  external show();

  // 隐藏 Canvas 图层。
  external hide();
}
