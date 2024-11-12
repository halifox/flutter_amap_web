@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 文本标记
// Text 类：继承自Marker，支持纯文本标记，具有Marker的大部分属性、方法和事件。
// 该类用于在地图上创建文本标记，可以设置样式、位置、动画效果等。

@JS("Text")
@anonymous
class TextMarker {
  external factory TextMarker({TextOptions opt});

  // 获取文本内容
  // 返回：String - 文本标记的内容
  external String getText();

  // 修改文本内容
  // text 类型：String - 设置新的文本内容
  external void setText(String text);

  // 设置文本样式
  // style 类型：Map<String, String> - 样式对象，类似CSS样式表（例如：{'background-color': 'red'}）
  external void setStyle(Map<String, String> style);

  // 唤起高德地图客户端标注页
  // obj 类型：Map<String, dynamic> - 必须包含 name（String）和 position（LngLat）
  external void markOnAMAP(Map<String, dynamic> obj);

  // 获取Text的锚点（控制文本的对齐方式）
  // 返回：String - 锚点的值，可能的值有：'top-left'|'top-center'|'top-right'|'middle-left'|'center'|'middle-right'|'bottom-left'|'bottom-center'|'bottom-right'
  external String getAnchor();

  // 设置Text的锚点
  // anchor 类型：String - 锚点的位置，可以选择的值有：'top-left'|'top-center'|'top-right'|'middle-left'|'center'|'middle-right'|'bottom-left'|'bottom-center'|'bottom-right'
  external void setAnchor(String anchor);

  // 获取文本标记的偏移量
  // 返回：Pixel - 偏移量对象，表示文本相对于其位置的偏移
  external Pixel getOffset();

  // 设置文本标记的偏移量
  // offset 类型：Pixel - 偏移量对象，指定文本相对于其位置的偏移
  external void setOffset(Pixel offset);

  // 设置点标记的动画效果
  // animate 类型：String - 动画效果类型，默认为 "AMAP_ANIMATION_NONE"
  // 可选值：
  // "AMAP_ANIMATION_NONE" - 无动画效果
  // "AMAP_ANIMATION_DROP" - 点标掉落效果
  // "AMAP_ANIMATION_BOUNCE" - 点标弹跳效果
  external void setAnimation(String animate);

  // 获取点标记的动画效果类型
  // 返回：String - 当前点标记的动画效果类型
  external String getAnimation();

  // 设置点标记是否支持鼠标单击事件
  // clickable 类型：bool - 如果为true，则支持鼠标点击事件；否则不支持
  external void setClickable(bool clickable);

  // 获取点标记是否支持鼠标单击事件
  // 返回：bool - 如果支持鼠标单击事件返回true，否则返回false
  external bool getClickable();

  // 获取点标记的位置
  // 返回：LngLat - 当前点标记的坐标位置
  external LngLat getPosition();

  // 设置点标记位置
  // lnglat 类型：LngLat - 设置点标记的新位置坐标
  external void setPosition(LngLat lnglat);

  // 设置点标记的旋转角度
  // angle 类型：Number - 旋转角度，单位：度（0-360度）
  external void setAngle(double angle);

  // 获取点标记的旋转角度
  // 返回：Number - 当前点标记的旋转角度，单位：度（0-360度）
  external double getAngle();

  // 设置点标记的叠加顺序
  // index 类型：Number - 叠加顺序，最先添加的点标记在最底层，索引越大越靠前
  external void setzIndex(int index);

  // 获取点标记的叠加顺序
  // 返回：Number - 当前点标记的叠加顺序
  external int getzIndex();

  // 设置点标记对象是否可拖拽移动
  // draggable 类型：bool - 如果为true，则允许拖拽移动点标记
  external void setDraggable(bool draggable);

  // 获取点标记对象是否可拖拽移动
  // 返回：bool - 如果点标记可拖拽返回true，否则返回false
  external bool getDraggable();

  // 点标记隐藏
  external void hide();

  // 点标记显示
  external void show();

  // 设置鼠标悬停时的光标
  // cursor 类型：String - 设置鼠标悬停时的光标样式，例如："pointer" 或自定义样式
  external void setCursor(String cursor);

  // 以指定的速度，点标记沿指定的路径移动
  // path 类型：List<LngLat> - 路径坐标数组
  // speed 类型：Number - 移动速度，单位：千米/小时
  // f 类型：Function - 变化曲线函数，缺省为 function(k) { return k; }
  // circlable 类型：bool - 是否循环执行动画，默认为false
  external void moveAlong(
      List<LngLat> path, double speed, Function f, bool circlable);

  // 以给定速度移动点标记到指定位置
  // lnglat 类型：LngLat - 指定的目标位置坐标
  // speed 类型：Number - 移动速度，单位：千米/小时
  // f 类型：Function - 变化曲线函数，缺省为 function(k) { return k; }
  external void moveTo(LngLat lnglat, double speed, Function f);

  // 点标记停止动画
  external void stopMove();

  // 暂定点标记的动画效果
  external void pauseMove();

  // 重新开始点标记的动画效果
  external void resumeMove();

  // 为Marker指定目标显示地图
  // map 类型：Map - 指定的目标地图对象。如果为null，则从地图中移除当前Marker
  external void setMap(Map map);

  // 获取Marker所在地图对象
  // 返回：Map - 当前点标记所在的地图对象
  external Map getMap();

  // 设置鼠标滑过点标时的文字提示
  // title 类型：String - 鼠标滑过点标时显示的文字提示
  external void setTitle(String title);

  // 获取点标记的文字提示
  // 返回：String - 当前点标记的文字提示
  external String getTitle();

  // 设置是否将Marker置顶
  // isTop 类型：bool - 如果为true，则点标记显示在最前面；否则取消置顶
  external void setTop(bool isTop);

  // 获取是否为置顶状态
  // 返回：bool - 如果点标记处于置顶状态，返回true；否则返回false
  external bool getTop();

  // 设置阴影效果
  // icon 类型：Icon - 设置点标记的阴影图标
  external void setShadow(Icon icon);

  // 获取阴影图标
  // 返回：Icon - 当前点标记的阴影图标
  external Icon getShadow();

  // 设置用户自定义属性
  // ext 类型：dynamic - 可以为任意类型，用于存储自定义数据，如Marker的ID等
  external void setExtData(dynamic ext);

  // 获取用户自定义属性
  // 返回：dynamic - 获取点标记的用户自定义属性
  external dynamic getExtData();
}

// text 类型：String	标记显示的文本内容
// map 类型：Map	要显示该标记的地图对象
// position 类型：LngLat	点标记在地图上显示的位置，默认为地图中心点
// anchor 类型：String	设置文本标记锚点。默认值：'center'，可选值：'top-left'|'top-center'|'top-right'|'middle-left'|'center'|'middle-right'|'bottom-left'|'bottom-center'|'bottom-right'
// offset 类型：Pixel	点标记显示位置偏移量，默认值为Pixel(0,0)
// topWhenClick 类型：Boolean	鼠标点击时是否置顶，默认false
// bubble 类型：Boolean	是否将覆盖物的鼠标或touch等事件冒泡到地图上，默认false
// draggable 类型：Boolean	设置点标记是否可拖拽移动，默认为false
// raiseOnDrag 类型：Boolean	设置拖拽点标记时是否开启点标记离开地图的效果
// cursor 类型：String	指定鼠标悬停时的鼠标样式，IE仅支持cur/ani/ico格式
// visible 类型：Boolean	点标记是否可见，默认为true
// zIndex 类型：Number	点标记的叠加顺序，默认zIndex：100
// angle 类型：Number	点标记的旋转角度，广泛用于改变车辆行驶方向
// autoRotation 类型：Boolean	是否自动旋转，默认为false
// animation 类型：String	点标记的动画效果，默认值："AMAP_ANIMATION_NONE" 可选值："AMAP_ANIMATION_DROP"，"AMAP_ANIMATION_BOUNCE"
// shadow 类型：Icon	点标记阴影
// title 类型：String	鼠标滑过点标记时的文字提示
// clickable 类型：Boolean	点标记是否可点击
// extData 类型：Any	用户自定义属性，支持任意数据类型，如Marker的id等
@JS()
@anonymous
class TextMarkerOptions {
  external factory TextMarkerOptions({
    String text,
    AMap map,
    LngLat position,
    String anchor,
    Pixel offset,
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
    dynamic extData,
  });
}
