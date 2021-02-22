import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:live_app/model/pageable.dart';
import 'package:live_app/model/school.dart';
import 'package:live_app/state/AppData.dart';
import 'package:live_app/utils/websocket/stomp_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

BaseOptions options = new BaseOptions(
  connectTimeout: 30000, // 调用深圳办公室的主机特别慢
  receiveTimeout: 30000,
);

//Dio dio = new Dio(options);

var _server = '';
var _token = '';

Dio _dio = Dio(options);

class ApiUtils {
  static init() {
    /*//不是release，设置抓包 todo 此处修改代理地址
    if (!kReleaseMode) {
      //设置代理 抓包用
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.findProxy = (uri) {
          //测试人员的主机ip+端口
          //192.168.58.236:8888
          //192.168.58.11:8888
          return "PROXY 192.168.58.11:8888";
        };
      };
    }*/

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) {
          // 检查网络
          print("### ${options.method} url = ${options.uri} query data = ${options.data}");
//          print("### request data = ${options.data}");
        },
        onResponse: (Response response) async {
          if (response.statusCode != 200) {
            print("### request response data = ${response.toString()}");
          }
          if (response.statusCode == 401) {
            print('######### TODO 401 error ');
          }
          return response; // continue
        },
        onError: (DioError e) async {
          if (e.type == DioErrorType.DEFAULT) {
            print(e.error);
            if (e.error is SocketException) {
              print("########## API UTILS TODO SocketException");
            }
          } else if (e.type == DioErrorType.RESPONSE) {
            print(e.response.data);
            print(e.error);
          }
          // Do something with response error
          if (e is SocketException) {
            print('网络错误： ${e.message}');
          }
          print(
              "############### Dio ERROR: ${e.request.uri} ${e.request.queryParameters} ${e.request.data} ${e.message}");
//          print("ERROR ${e.response.statusCode} ${e.response.data}");
          throw e; //continue
        },
      ),
    );
  }

  static Future get(String url, {Map<String, dynamic> params, Pageable pageable}) async {
    url = _server + url;
    if (pageable != null) {
      if (params == null) {
        params = {};
      }
      if (pageable.number != null) {
        params["page"] = pageable.number;
      }
      if (pageable.size != null) {
        params["size"] = pageable.size;
      }
      if (pageable.sort != null && pageable.sort.isNotEmpty) {
        params["sort"] = pageable.sort;
      }
    }
//    print('request url = $url query = $params');
    var response = await _dio.get(url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: _token},
        ),
        queryParameters: params);
    return response.data;
  }

  static Future post(String url, Map<String, dynamic> params) async {
    url = _server + url;
    print('request url = $url');
    var response = await _dio.post(url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: _token},
        ),
        data: params);
    return response.data;
  }

  static Future postObject(String url, data) async {
    url = _server + url;
    print('request url = $url');
    var response = await _dio.post(url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: _token},
        ),
        data: data);
    return response.data;
  }

  static Future put(String url, data) async {
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      url = _server + url;
    }
    print('put url = $url data=${data.toString()}');
    var response = await _dio.put(url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: _token},
        ),
        data: data);
    return response.data;
  }

  static Future delete(String url, String data) async {
    if (!url.startsWith("http://") && !url.startsWith("https://")) {
      url = _server + url;
    }
    print('delete url = $url');
    var response = await _dio.delete(url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: _token},
        ),
        data: data);
    return response.data;
  }

  static Future<bool> login(
      School school, String loginServer, String username, String password) async {
    var params = {'username': username, 'password': password};
    try {
      var url = loginServer + '/api/users/login';
      var response = await _dio.post(url, data: params);
      String data = response.data;
      if (data == null || data.isEmpty) {
        // todo 教育局版本 zuul exception
        print("access_token 为空");
        return false;
      }

      _setHost(loginServer);
      _token = 'Bearer ' + response.data;

      // 保存学校信息
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('school', jsonEncode(school));
      // print("school info = ${jsonEncode(school)}");

      // 保存用户名和密码
      prefs.setString("username", username);
      prefs.setString("password", password);

      prefs.setString('token', _token);
      print('token = $_token');
    } catch (e) {
      print(e);
      return false;
    }

    return true;
  }





}
