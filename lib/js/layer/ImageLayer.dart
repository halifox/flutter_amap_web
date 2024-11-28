@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 图片图层类，用户可以将一张静态图片作为图层添加在地图上，图片图层会随缩放级别而自适应缩放。
@JS()
class ImageLayer {
  external ImageLayer(ImageLayerOptions opts);

  // 获取图片图层的 URL
  external String getImageUrl();

  // 设置图片图层的 URL
  external setImageUrl(String url);

  // 获取图片图层的范围
  external List<double> getBounds();

  // 设置图片图层的范围
  external setBounds(List<double> bounds);

  // 获取图片图层的配置项
  external ImageLayerOptions getOptions();

  // 获取图片图层的层级
  external int getzIndex();

  // 设置图片图层的层级
  external setzIndex(int zIndex);

  // 获取图片图层的透明度
  external double getOpacity();

  // 设置图片图层的透明度
  external setOpacity(double opacity);

  // 获取图片图层的缩放等级范围
  external List<int> getZooms();

  // 设置图片图层的缩放等级范围
  external setZooms(List<int> zooms);

  // 显示图片图层
  external show();

  // 隐藏图片图层
  external hide();
}

// ImageLayerOptions 是 ImageLayer 构造函数的配置参数
// opts.url 类型：String 图片地址链接
// opts.zooms 类型：[Number, Number] 默认 [2, 30] 图层缩放等级范围，默认 [2, 30]
// opts.bounds 类型：([Number, Number, Number, Number] | Bounds) 图片的范围大小经纬度，如果传递数字数组类型: [minlng,minlat,maxlng,maxlat]
// opts.opacity 类型：Number 默认 1 图层透明度，默认为 1
// opts.visible 类型：Boolean 默认 true 图层是否可见，默认为 true
// opts.zIndex 类型：Number 默认 6 图层的层级，默认为 6
@JS()
@anonymous
class ImageLayerOptions {
  external factory ImageLayerOptions({
    String url,
    List<int> zooms,
    dynamic bounds,
    double opacity,
    bool visible,
    int zIndex,
  });
}
