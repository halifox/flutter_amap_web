@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

//label标记
@JS()
class ElasticMarker {
  external ElasticMarker(ElasticMarkerOptions opts);
}

// map 类型：Map	要显示该marker的地图对象
// position 类型：(Vector | LngLat)	点标记在地图上显示的位置
// visible 类型：boolean	点标记是否可见，默认为true
// zIndex 类型：number	点标记的叠加顺序
// offset 类型：(Vector | Pixel)	点标记显示位置偏移量
// clickable 类型：boolean	点标记是否可点击
// draggable 类型：boolean	设置点标记是否可拖拽移动
// bubble 类型：boolean	事件是否冒泡，默认为 false
// cursor 类型：string	指定鼠标悬停时的鼠标样式
// topWhenClick 类型：boolean	鼠标点击时marker是否置顶
// zoomStyleMapping 类型：Record<string, number>	表示地图级别与styles中样式的映射，{14:0,15:0,16:1,17:1,}表示14到15级使用styles中的第0个样式，16-17级使用第二个样式
// extData 类型：any	用户自定义属性
// styles 类型：Array<ElasticStyle>	多个不同样式的数组

@JS()
@anonymous
class ElasticMarkerOptions {
  external factory ElasticMarkerOptions({
    AMap map,
    LngLat position,
    bool visible,
    int zIndex,
    List<int> offset,
    bool clickable,
    bool draggable,
    bool bubble,
    String cursor,
    bool topWhenClick,
    dynamic zoomStyleMapping,
    dynamic extData,
    List<ElasticStyle> styles,
  });
}

// icon 类型：ElasticIcon	灵活标注图标样式类型
// label 类型：ElasticLabel	灵活标注文本样式类型
@JS()
@anonymous
class ElasticStyle {
  external factory ElasticStyle({
    ElasticIcon icon,
    ElasticLabel label,
  });
}

// img 类型：string	图标 url
// size 类型：Vector	图标显示大小
// anchor 类型：(Vector | string)	图标锚点
// imageOffset 类型：(Vector | string)	图片偏移量
// imageSize 类型：number	图片大小
// fitZoom 类型：number	最合适的级别，在此级别下显示为原始大小
// scaleFactor 类型：number	地图放大一级的缩放比例系数
// maxScale 类型：number	最大放大比例
// minScale 类型：number	最小放大比例
@JS()
@anonymous
class ElasticIcon {
  external factory ElasticIcon({
    String img,
    List<int> size,
    String anchor,
    List<int> imageOffset,
    int imageSize,
    int fitZoom,
    int scaleFactor,
    int maxScale,
    int minScale,
  });
}

// content 类型：ElasticLabel	文本内容
// position 类型：ElasticLabel	文本位置相对于图标的基准点，可选值：BL、BM、BR、ML、MR、TL、TM、TR分别代表左下角、底部中央、右下角、左侧中央、右侧中央、左上角、顶部中央、右上角
// offset 类型：ElasticLabel	相对position的偏移量
// minZoom 类型：ElasticLabel	label的最小显示级别
@JS()
@anonymous
class ElasticLabel {
  external factory ElasticLabel({
    String content,
    String position,
    List<int> offset,
    int minZoom,
  });
}
