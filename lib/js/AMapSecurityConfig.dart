import 'package:flutter_web_amap/amap.dart';

@JS('window._AMapSecurityConfig')
external set AMapSecurityConfig(SecurityConfig value);

@JS()
@anonymous
class SecurityConfig {
  external factory SecurityConfig({String securityJsCode});
}

void setAMapSecurityConfig(String securityJsCode) {
  AMapSecurityConfig = SecurityConfig(securityJsCode: securityJsCode);
}
