import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

void main(List<String> arguments) {
  consume(DioService());
  consume(HttpService());
}

void consume(JsonInterface service) async {
  final data = await service.fetchJson();
  print(data);
  print('+--------------------------------------------------------+');
}

abstract class JsonInterface{
  Future<Map> fetchJson();
}

class HttpService implements JsonInterface{
  @override
  Future<Map> fetchJson() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    return jsonDecode(response.body);
  }
}

class DioService implements JsonInterface{
  final dio = Dio();

  @override
  Future<Map> fetchJson() async {
    final response = await dio.get('https://jsonplaceholder.typicode.com/todos/1');
    return response.data;
  }
}
