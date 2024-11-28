@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// MoveAnimation 用于实现点标记沿线段或者路径轨迹移动的动画基类，可用于满足轨迹回放、实时轨迹等场景。
// MoveAnimation 无需单独声明或初始化，Marker、Text、LabelMarker 均已继承了 MoveAnimation 的实现。
@JS()
class MoveAnimation {
  external MoveAnimation();

  // 静态方法：moveTo(targetPosition, opts)
  // 用于将标记移动到目标位置
  external static moveTo(LngLat targetPosition, MoveAnimationOptions opts);

  // 静态方法：moveAlong(path, opts)
  // 用于让标记沿着路径移动
  external static moveAlong(List<LngLat> path, MoveAnimationOptions opts);

  // 静态方法：startMove()
  // 开始移动
  external static startMove();

  // 静态方法：stopMove()
  // 停止移动
  external static stopMove();

  // 静态方法：resumeMove()
  // 恢复移动
  external static resumeMove();
}

// MoveAnimation 的选项类，用于配置动画的相关选项
@JS()
@anonymous
class MoveAnimationOptions {
  external factory MoveAnimationOptions({
    double speed,  // 动画速度
    bool loop,     // 是否循环播放
    bool autoStart, // 是否自动开始
  });
}


