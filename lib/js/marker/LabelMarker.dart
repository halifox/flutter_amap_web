@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// LabelMarker 类：支持大量点标注和文本标注的绘制，基于 AMap.LabelsLayer 图层绘制。

@JS()
class LabelMarker {
  external LabelMarker(LabelMarkerOptions opt);

  // 获取标注位置
  external LngLat getPosition();

  // 设置标注位置
  external void setPosition(dynamic position);

  // 获取标注 name 字段
  external String getName();

  // 设置标注 name 字段
  external void setName(String name);

  // 获取 LabelMarker 的叠加顺序
  external int getzIndex();

  // 设置 LabelMarker 的叠加顺序
  external void setzIndex(int zIndex);

  // 获取显示级别范围
  external List<int> getZooms();

  // 设置显示级别范围
  external void setZooms(List<int> zooms);

  // 获取透明度
  external double getOpacity();

  // 设置透明度
  external void setOpacity(double opacity);

  // 获取该标注的避让优先级
  external int getRank();

  // 设置该标注的避让优先级
  external void setRank(int rank);

  // 获得文字样式和内容
  external TextOptions getText();

  // 设置文字样式和内容
  external void setText(TextOptions text);

  // 获取图标样式
  external IconOptions getIcon();

  // 设置图标样式
  external void setIcon(IconOptions icon);

  // 获取该标注是否可见
  external bool getVisible();

  // 是否置顶该标注
  external void setTop(bool isTop);

  // 获取该标注用户自定义数据
  external dynamic getExtData();

  // 设置该标注用户自定义数据
  external void setExtData(dynamic data);

  // 获取该标注的所有属性
  external LabelMarkerOptions getOptions();

  // 显示标注
  external void show();

  // 隐藏标注
  external void hide();
}

// position 类型：String | Array | Lnglat	标注的位置
// zooms 类型：Array	标注显示级别范围， 可选值：[3,20]
// opacity 类型：Number	标注透明度
// zIndex 类型：Number	标注叠加顺序（自v1.4.15 新增）
// rank 类型：Number	用于避让优先级，数字越大优先级越高，默认值为 1（自v1.4.15 新增）
// name 类型：string	该标注的名称，用于标识，非用于显示（自v1.4.15 新增）
// icon 类型：Object	配置标注中的图标，Object 取值请参见下方 IconOptions
// text 类型：Object	配置标注中的文字，Object 取值请参见下方 TextOptions
@JS()
@anonymous
class LabelMarkerOptions {
  external factory LabelMarkerOptions({
    dynamic position,
    List<int> zooms,
    double opacity,
    int zIndex,
    int rank,
    String name,
    IconOptions icon,
    TextOptions text,
  });
}

// image 类型：String	图标地址
// size 类型：Size	图标大小，默认值：[36, 36]
// clipOrigin 类型：Array | Pixel	图标所用图片偏移量
// anchor 类型：String	图标锚点。 可选值： 'top-left'| 'top-center'| 'top-right'| 'middle-left'| 'center'| 'middle-right'| 'bottom-left'| 'bottom-center'| 'bottom-right' 。默认值：'top-left'
// retina 类型：Boolean	高清屏支持，默认值： true
@JS()
@anonymous
class IconOptions {
  external factory IconOptions({
    String image,
    List<int> size,
    dynamic clipOrigin,
    String anchor,
    bool retina,
  });
}

// content 类型：String	文字内容
// direction 类型：String	相对于图标的方位。 可选值： 'top' 'right' 'bottom' 'left' 'center' 。默认值：'top'
// offset 类型：Array | Pixel	相对 direction 的位置偏移
// zooms 类型：Array	文字显示范围，可选值：[3,20]
// style 类型：Object	文字样式，Object 取值见下方 StyleOptions
@JS()
@anonymous
class TextOptions {
  external factory TextOptions({
    String content,
    String direction,
    dynamic offset,
    List<int> zooms,
    StyleOptions style,
  });
}

// fontSize 类型：Number	文字大小，默认值：12
// fontFamily 类型：String	文字字体
// fontWeight 类型：String	文字粗细。 可选值： 'normal'| 'lighter'| 'bold' 。默认值：'normal'
// fillColor 类型：String	文字颜色
// strokeColor 类型：String	文字描边颜色
// strokeWidth 类型：Number	文字描边宽度，注：只有描边颜色没有描边宽度时，默认描边宽度为 1
// padding 类型：String | Array	文字 padding
// 支持以下几种格式：
// '5' | '5 10' | '5 10 20' | '5 10 5 10' | [5] | [5, 10] | [5, 10, 5] | [5, 10, 5, 10]
// 默认值为 [3, 3, 3, 3]（自v1.4.15 新增）
// backgroundColor 类型：String	文字背景颜色（自v1.4.15 新增）
@JS()
@anonymous
class StyleOptions {
  external factory StyleOptions({
    double fontSize,
    String fontFamily,
    String fontWeight,
    String fillColor,
    String strokeColor,
    double strokeWidth,
    dynamic padding,
    String backgroundColor,
  });
}
