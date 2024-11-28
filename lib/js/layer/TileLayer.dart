@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

//切片图层类，该类为基础类。
@JS()
class TileLayer extends Layer{
  external TileLayer(TileLayerOptions opts);

  external setMap(AMap map);

  external setTileUrl(String url);

  external reload();

  external hide();

  external show();
}

// tileUrl 类型：String	切片取图地址 如：' https://abc{0,1,2,3}.amap.com/tile?x=[x]&y=[y]&z=[z] ' [x] 、 [y] 、 [z] 分别替代切片的xyz。
// zooms 类型：[Number, Number]default [2,30]	支持的缩放级别范围，默认范围 [2-30]
// dataZooms 类型：[Number, Number]default [2,30]	数据支持的缩放级别范围，默认范围 [2-30]
// opacity 类型：Numberdefault 1	透明度，默认 1
// visible 类型：Booleandefault true	是否显示，默认 true
// zIndex 类型：Numberdefault 4	图层叠加的顺序值，1 表示最底层。默认 zIndex：4
// tileSize 类型：Numberdefault 256	切片大小，取值： 256，表示切片大小为256 256， 128，表示切片大小为128 128， 64，表示切片大小为64*64。默认值为256
@JS()
@anonymous
class TileLayerOptions {
  external factory TileLayerOptions({
    String tileUrl,
    List<int> zooms,
    List<int> dataZooms,
    int opacity,
    bool visible,
    int zIndex,
    int tileSize,
  });
}