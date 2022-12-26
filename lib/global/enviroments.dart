import 'dart:io';

class Enviroments {
  static String apiUrl = Platform.isAndroid
      ? 'http://192.168.1.101:4000/api'
      : 'http://localhost:4000/api';
  static String socketUrl = Platform.isAndroid
      ? 'http://192.168.1.101:4000'
      : 'http://localhost:4000';
}
