import 'package:dio/dio.dart';

void main(List<String> arguments) {
  consume(DioService());
}

void consume(DioService service) async {
  final data = await service.getData();
  print(data);
}

class DioService {
  final dio = Dio();

  Future<Map> getData() async {
    final response = await dio.get('https://jsonplaceholder.typicode.com/todos/1');
    return response.data;
  }
}
