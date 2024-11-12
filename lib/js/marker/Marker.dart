@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

//点标记
@JS()
class Marker {
  external factory Marker(MarkerOptions opt);

  /// 唤起高德地图客户端标注页
  external void markOnAMAP(Map<String, dynamic> obj);

  /// 获取Marker的锚点位置
  external String getAnchor();

  /// 设置Marker的锚点位置
  external void setAnchor(String anchor);

  /// 获取Marker的偏移量
  external Pixel getOffset();

  /// 设置Marker的偏移量
  external void setOffset(Pixel offset);

  /// 设置Marker的动画效果
  /// 可选值：
  /// "AMAP_ANIMATION_NONE" - 无动画效果
  /// "AMAP_ANIMATION_DROP" - 点标掉落效果
  /// "AMAP_ANIMATION_BOUNCE" - 点标弹跳效果
  external void setAnimation(String animate);

  /// 获取Marker的动画效果类型
  external String getAnimation();

  /// 设置Marker是否支持鼠标单击事件
  external void setClickable(bool clickable);

  /// 获取Marker是否支持鼠标单击事件
  external bool getClickable();

  /// 获取Marker的位置
  external LngLat getPosition();

  /// 设置Marker的位置
  external void setPosition(LngLat lnglat);

  /// 设置Marker的旋转角度
  external void setAngle(double angle);

  /// 设置Marker的文本标签
  external void setLabel(Map<String, dynamic> label);

  /// 获取Marker的文本标签内容
  external Map<String, dynamic> getLabel();

  /// 获取Marker的旋转角度
  external double getAngle();

  /// 设置Marker的叠加顺序
  external void setzIndex(int index);

  /// 获取Marker的叠加顺序
  external int getzIndex();

  /// 设置Marker的图标
  external void setIcon(dynamic content);

  /// 获取Marker的图标
  external dynamic getIcon();

  /// 设置Marker是否可拖拽
  external void setDraggable(bool draggable);

  /// 获取Marker是否可拖拽
  external bool getDraggable();

  /// 隐藏Marker
  external void hide();

  /// 显示Marker
  external void show();

  /// 设置鼠标悬停时的光标样式
  external void setCursor(String cursor);

  /// 设置Marker的显示内容，可以是HTML字符串或HTML DOM对象
  external void setContent(dynamic html);

  /// 获取Marker的显示内容
  external String getContent();

  /// 让Marker沿指定路径移动
  external void moveAlong(
      List<LngLat> path, double speed, Function f, bool circulable);

  /// 让Marker移动到指定位置
  external void moveTo(LngLat lnglat, double speed, Function f);

  /// 停止Marker的动画
  external void stopMove();

  /// 暂停Marker的动画
  external void pauseMove();

  /// 恢复Marker的动画
  external void resumeMove();

  /// 设置Marker所在的地图
  external void setMap(Map map);

  /// 获取Marker所在的地图
  external Map getMap();

  /// 设置Marker的鼠标滑过提示文本
  external void setTitle(String title);

  /// 获取Marker的鼠标滑过提示文本
  external String getTitle();

  /// 设置Marker是否置顶
  external void setTop(bool isTop);

  /// 获取Marker是否置顶
  external bool getTop();

  /// 设置Marker的阴影图标
  external void setShadow(Icon icon);

  /// 获取Marker的阴影图标
  external Icon getShadow();

  /// 设置Marker的可点击区域
  external void setShape(MarkerShape shape);

  /// 获取Marker的可点击区域
  external MarkerShape getShape();

  /// 设置用户自定义属性
  external void setExtData(dynamic ext);

  /// 获取用户自定义属性
  external dynamic getExtData();
}

// map 类型：Map	要显示该marker的地图对象
// position 类型：LngLat	点标记在地图上显示的位置，默认为地图中心点
// anchor 类型：String	设置点标记锚点。可选值：'top-left'|'top-center'|'top-right'|'middle-left'|'center'|'middle-right'|'bottom-left'|'bottom-center'|'bottom-right'
// offset 类型：Pixel	点标记显示位置偏移量，默认值为Pixel(-10,-34)
// icon 类型：String/Icon	需在点标记中显示的图标
// content 类型：String/Object	点标记显示内容，可以是HTML要素字符串或HTML DOM对象
// topWhenClick 类型：Boolean	鼠标点击时marker是否置顶，默认false
// bubble 类型：Boolean	是否将覆盖物的鼠标或touch事件冒泡到地图上，默认false
// draggable 类型：Boolean	设置点标记是否可拖拽移动，默认为false
// raiseOnDrag 类型：Boolean	设置拖拽点标记时是否开启点标记离开地图的效果
// cursor 类型：String	指定鼠标悬停时的鼠标样式
// visible 类型：Boolean	点标记是否可见，默认为true
// zIndex 类型：Number	点标记的叠加顺序，默认zIndex：100
// angle 类型：Number	点标记的旋转角度
// autoRotation 类型：Boolean	是否自动旋转，默认为false
// animation 类型：String	点标记的动画效果，默认值：'AMAP_ANIMATION_NONE'
// shadow 类型：Icon	点标记阴影，不设置则无阴影
// title 类型：String	鼠标滑过点标记时的文字提示
// clickable 类型：Boolean	点标记是否可点击
// shape 类型：MarkerShape	设置Marker的可点击区域
// extData 类型：Any	用户自定义属性
// label 类型：Map	文本标注，包含content, offset, direction
@JS()
@anonymous
class MarkerOptions {
  external factory MarkerOptions({
    Map map,
    LngLat position,
    String anchor,
    Pixel offset,
    dynamic icon,
    dynamic content,
    bool topWhenClick,
    bool bubble,
    bool draggable,
    bool raiseOnDrag,
    String cursor,
    bool visible,
    int zIndex,
    double angle,
    bool autoRotation,
    String animation,
    Icon shadow,
    String title,
    bool clickable,
    MarkerShape shape,
    dynamic extData,
    Map label,
  });
}

// AMap.MarkerShape(opt: MarkerShapeOptions)	构造一个Marker可点击区域对象，通过MarkerShapeOptions设置可点击区域属性
@JS()
class MarkerShape {
  external factory MarkerShape(MarkerShapeOptions opt);
}

// coords 类型：Array.<Number>	可点击区域组成元素数组，存放图形的像素坐标等信息，取决于type类型
// type 类型：String	可点击区域类型，可选值：'circle'|'poly'|'rect'
@JS()
@anonymous
class MarkerShapeOptions {
  external factory MarkerShapeOptions({
    List<double> coords,
    String type,
  });
}

// content 类型：string	文本标注的内容
// offset 类型：(Pixel | Vector2 | Array<number>)	为偏移量。如设置了 direction，以 direction 方位为基准点进行偏移。
// direction 类型：string	文本标注方位 可选值：'top'|'right'|'bottom'|'left'|'center'，默认值: 'right'。
@JS()
@anonymous
class Label {
  external factory Label({
    String content,
    List<int> offset,
    String direction,
  });
}
