@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 灵活切片图层，继承自 AMap.TileLayer，开发者可通过构造时传入给其传入 createTile 字段来指定每一个切片的内容
@JS('TileLayer.Flexible')
class Flexible extends TileLayer {
  // 构造函数，传入 FlexibleLayerOptions 参数
  external Flexible(FlexibleLayerOptions opts);

  // 获取当前图层的选项
  external getOptions();

  // 获取当前图层的 zIndex 值
  external getzIndex();

  // 设置当前图层的 zIndex 值
  external setzIndex(int zIndex);

  // 获取当前图层的透明度
  external getOpacity();

  // 设置当前图层的透明度
  external setOpacity(double opacity);

  // 获取当前图层支持的缩放级别范围
  external getZooms();

  // 设置当前图层支持的缩放级别范围
  external setZooms(List<int> zooms);

  // 显示当前图层
  external show();

  // 隐藏当前图层
  external hide();

  // 销毁当前图层
  external destroy();
}

// FlexibleLayerOptions 是传递给 TileLayerFlexible 构造函数的选项类
// cacheSize 类型：Number 缓存瓦片数量
// createTile 类型：function(x, y, z, success, fail) 由开发者实现，由 API 自动调用，xyz 分别为切片横向纵向编号和层级，切片大小 256。假设每次创建的贴片为 A(支持 img 或者 canvas)，当创建或者获取成功时请回调 success(A)，不需要显示或者失败时请回调 fail()
@JS()
@anonymous
class FlexibleLayerOptions {
  external factory FlexibleLayerOptions({
    num cacheSize,
    Function createTile,
    List<int> zooms,
    double opacity,
    bool visible,
    int zIndex,
    int tileSize,
  });
}

// 可选的参数详细描述：
// opts.cacheSize 类型：Number 缓存瓦片数量
// opts.createTile 类型：function(x, y, z, success, fail) 由开发者实现，由 API 自动调用，xyz 分别为切片横向纵向编号和层级，切片大小 256。假设每次创建的贴片为 A(支持 img 或者 canvas)，当创建或者获取成功时请回调 success(A)，不需要显示或者失败时请回调 fail()
// opts.zooms 类型：[Number, Number] default [2,30] 支持的缩放级别范围，默认范围 [2-30]
// opts.opacity 类型：Number default 1 透明度，默认 1
// opts.visible 类型：Boolean default true 是否显示，默认 true
// opts.zIndex 类型：Number default 4 图层叠加的顺序值，1 表示最底层。默认 zIndex：4
// opts.tileSize 类型：Number default 256 切片大小，取值：256，表示切片大小为 256x256，128，表示切片大小为 128x128，64，表示切片大小为 64x64。默认值为 256
