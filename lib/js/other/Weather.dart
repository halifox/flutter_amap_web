@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 天气查询服务，根据城市名称或区域编码返回城市天气预报信息，包括实时天气信息和四天天气预报。
@JS()
class Weather {
  external Weather();

  // 查询实时天气信息，cityName 见 http://restapi.amap.com/v3/config/district?level=city&sublevel=0&extensions=all&output=xml&key=d9fba2f3196b6a4419358693a2b0d9a9
  // 该方法返回当前城市的天气信息
  external getLive(String city, ResultCallback<WeatherLiveResult> callback);

  // 查询四天预报天气，包括查询当天天气信息
  // 该方法返回指定城市的四天天气预报信息
  external getForecast(String city, ResultCallback<WeatherForecastResult> callback);
}
// **WeatherLiveResult** 类型：Function
// 参数说明：
// - err (Object) 正确时为空
// - LiveData (Object) 返回数据
//   - LiveData.info: 类型：String，成功状态文字描述
//   - LiveData.province: 类型：String，省份名
//   - LiveData.city: 类型：String，城市名
//   - LiveData.adcode: 类型：String，区域编码
//   - LiveData.weather: 类型：String，天气现象，详见天气现象列表
//   - LiveData.temperature: 类型：String，实时气温，单位：摄氏度
//   - LiveData.windDirection: 类型：String，风向，风向编码对应描述
//   - LiveData.windPower: 类型：Number，风力，风力编码对应风力级别，单位：级
//   - LiveData.humidity: 类型：String，空气湿度（百分比）
//   - LiveData.reportTime: 类型：String，数据发布的时间
@JS()
@anonymous
class WeatherLiveResult {
  external factory WeatherLiveResult({
    String info,
    String province,
    String city,
    String adcode,
    String weather,
    String temperature,
    String windDirection,
    int windPower,
    String humidity,
    String reportTime,
  });
}

// **WeatherForecastResult** 类型：Function
// 参数说明：
// - err (Object) 正确时为空
// - ForecastData (Object) 返回数据
//   - ForecastData.info: 类型：String，成功状态文字描述
//   - ForecastData.province: 类型：String，省份名
//   - ForecastData.city: 类型：String，城市名
//   - ForecastData.adcode: 类型：String，区域编码
//   - ForecastData.reportTime: 类型：String，数据发布的时间
//   - ForecastData.forecast: 类型：Array，天气预报数组，包括当天至第三天的预报数据
//     - ForecastData.forecast.date: 类型：String，日期，格式为“年-月-日”
//     - ForecastData.forecast.week: 类型：String，星期
//     - ForecastData.forecast.dayWeather: 类型：String，白天天气现象，详见天气现象列表
//     - ForecastData.forecast.nightWeather: 类型：String，夜间天气现象，详见天气现象列表
//     - ForecastData.forecast.dayTemp: 类型：Number，白天温度
//     - ForecastData.forecast.nightTemp: 类型：Number，夜间温度
//     - ForecastData.forecast.dayWindDir: 类型：String，白天风向
//     - ForecastData.forecast.dayWindPower: 类型：String，白天风力
//     - ForecastData.forecast.nightWindPower: 类型：String，夜间风力
@JS()
@anonymous
class WeatherForecastResult {
  external factory WeatherForecastResult({
    String info,
    String province,
    String city,
    String adcode,
    String reportTime,
    List<Forecast> forecast,
  });
}

// 天气预报信息
@JS()
@anonymous
class Forecast {
  external factory Forecast({
    String date,
    String week,
    String dayWeather,
    String nightWeather,
    double dayTemp,
    double nightTemp,
    String dayWindDir,
    String dayWindPower,
    String nightWindPower,
  });
}