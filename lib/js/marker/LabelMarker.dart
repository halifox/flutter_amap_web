@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

//label标记
@JS()
class LabelMarker {
  external LabelMarker(LabelMarkerOptions opts);
}

// name 类型：string	标注名称，作为标注标识，并非最终在地图上显示的文字内容，显示文字内容请设置 opts.text.content
// position 类型：(Vector2 | LngLat)	标注位置
// zooms 类型：Vector2	标注显示级别范围， 可选值： [2,20]
// opacity 类型：number	标注透明度，默认值: 1
// rank 类型：number	避让优先级，获取标注的优先级，该优先级用于 labelsLayer 支持避让时，rank 值大的标注会避让掉 rank 值低的标注。默认值：1
// zIndex 类型：number	同一 LabelsLayer 内标注显示层级，数字越大越靠前，默认值: 1
// visible 类型：boolean	标注是否可见， 默认值: true
// extData 类型：any	用户自定义类型数据，可将自定义数据保存在该属性上，方便后续操作使用。
// icon 类型：IconOptions	标注图标设置
// text 类型：TextOptions	标注文本设置
@JS()
@anonymous
class LabelMarkerOptions {
  external factory LabelMarkerOptions({
    String name,
    LngLat position,
    List<int> zooms,
    int opacity,
    int rank,
    int zIndex,
    bool visible,
    dynamic extData,
    IconOptions icon,
  });
}

// 标注图标设置
// image 类型：string	图标 url。
// size 类型：(Vector2 | Size)	图标大小，默认值： [36, 36]
// clipOrigin 类型：(Vector2 | Pixel)	图标所在图片偏移位置，默认值: [0, 0]
// clipSize 类型：(Vector2 | Size)	图标所在图片裁剪大小，若未设置，则使用图片大小
// offset 类型：(Vector2 | Pixel)	图标所在图片偏移量,默认值 [0, 0]
// anchor 类型：(Vector2 | Pixel | string)	图标锚点，锚点位置对应设置的 position 位置。可选值：'top-left'| 'top-center'|'top-right'|'middle-left'|'center'| 'middle-right'| 'bottom-left'| 'bottom-center'| 'bottom-right' 。默认值：'top-left'。
@JS()
@anonymous
class IconOptions {
  external factory IconOptions({
    String image,
    List<int> size,
    List<int> clipOrigin,
    List<int> clipSize,
    List<int> offset,
    dynamic /*List<int>|String*/ anchor,
  });
}

// 标注文本设置
// content 类型：string	文本标注的内容，该属性为直接显示在标注上的文本内容。
// direction 类型：string	文本标注方位。若设置了 icon，则 direction 是以 icon 为中心的偏移，若未设置 icon，则相对 position 偏移。 可选值：'top'|'right'|'bottom'|'left'|'center'。默认值: right
// offset 类型：(Pixel | Vector2)	为偏移量，在 direction 基础上的偏移。默认值 [0, 0]
// zooms 类型：Vector2	文本显示级别范围，可单独设置文本显示范围
// style 类型：TextStyleOptions	文本样式设置
@JS()
@anonymous
class TextOptions {
  external factory TextOptions({
    String content,
    String direction,
    List<int> offset,
    List<int> zooms,
    TextStyleOptions style,
  });
}

// 文本样式设置
// fontSize 类型：number	文字大小，默认值： 12
// fillColor 类型：string	文字颜色
// strokeColor 类型：string	文字描边颜色
// padding 类型：(string | Array<(string | number)>)	文字 padding。默认值： [3, 3, 3, 3]
// backgroundColor 类型：string	文字背景颜色
// borderColor 类型：string	文字背景描边颜色
// borderWidth 类型：number	文字背景描边粗细
// fold 类型：boolean	文字是否折行（6个字一折行）
@JS()
@anonymous
class TextStyleOptions {
  external factory TextStyleOptions({
    int fontSize,
    String fillColor,
    String strokeColor,
    List<int> padding,
    String backgroundColor,
    String borderColor,
    int borderWidth,
    bool fold,
  });
}
