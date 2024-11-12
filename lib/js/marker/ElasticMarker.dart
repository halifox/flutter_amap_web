@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// ElasticMarker 类：灵活点标记，支持随着地图级别变化而改变图标和大小的点标记。

@JS()
@anonymous
class ElasticMarker {
  external factory ElasticMarker({ElasticMarkerOptions opt});

  // 唤起高德地图客户端标注页
  // obj: 必须包含 name（String）和 position（LngLat）
  external void markOnAMAP(Map<String, dynamic> obj);

  // 设置点标记是否支持鼠标单击事件
  external void setClickable(bool clickable);

  // 获取点标记是否支持鼠标单击事件
  external bool getClickable();

  // 获取点标记的位置
  external LngLat getPosition();

  // 设置点标记位置
  external void setPosition(LngLat lnglat);

  // 设置点标记的叠加顺序
  external void setzIndex(int index);

  // 获取点标记的叠加顺序
  external int getzIndex();

  // 设置点标记对象是否可拖拽移动
  external void setDraggable(bool draggable);

  // 获取点标记对象是否可拖拽移动
  external bool getDraggable();

  // 点标记隐藏
  external void hide();

  // 点标记显示
  external void show();

  // 设置鼠标悬停时的光标
  external void setCursor(String cursor);

  // 为Marker指定目标显示地图
  external void setMap(Map map);

  // 获取Marker所在地图对象
  external Map getMap();

  // 设置鼠标滑过点标时的文字提示
  external void setTitle(String title);

  // 获取点标记的文字提示
  external String getTitle();

  // 设置是否将Marker置顶
  external void setTop(bool isTop);

  // 获取是否为置顶状态
  external bool getTop();

  // 设置用户自定义属性
  external void setExtData(dynamic ext);

  // 获取用户自定义属性
  external dynamic getExtData();
}

// styles 类型：Array	多个不同样式的数组，每个样式包含图标和文本配置
// zoomStyleMapping 类型：Object	表示地图级别与styles中样式对应关系的映射
// map 类型：Map	要显示该标记的地图对象
// position 类型：LngLat	点标记在地图上显示的位置，默认为地图中心点
// topWhenClick 类型：Boolean	鼠标点击时marker是否置顶，默认false
// bubble 类型：Boolean	是否将覆盖物的鼠标或touch等事件冒泡到地图上，默认false
// draggable 类型：Boolean	设置点标记是否可拖拽移动，默认为false
// cursor 类型：String	指定鼠标悬停时的鼠标样式，IE仅支持cur/ani/ico格式
// visible 类型：Boolean	点标记是否可见，默认为true
// zIndex 类型：Number	点标记的叠加顺序，默认zIndex：100
// clickable 类型：Boolean	点标记是否可点击
// extData 类型：Any	用户自定义属性，支持任意数据类型，如Marker的id等
@JS()
@anonymous
class ElasticMarkerOptions {
  external factory ElasticMarkerOptions({
    List<dynamic> styles,
    dynamic zoomStyleMapping,
    AMap map,
    LngLat position,
    bool topWhenClick,
    bool bubble,
    bool draggable,
    String cursor,
    bool visible,
    int zIndex,
    bool clickable,
    dynamic extData,
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
