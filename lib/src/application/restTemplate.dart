import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class RestTemplate extends GetConnect {
  final String name;
  static const String TAG = "TAG";
  static const String AuthXPOT = "AuthXPOT";
  RestTemplate() : name = 'Não autenticada';
  RestTemplate.auth() : name = 'Autenticada' {
    httpClient.addRequestModifier((Request request) {
      request.headers['aUTH'] = 'TOKENX';
      return request;
    });
  }
}
