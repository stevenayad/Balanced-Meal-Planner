import 'package:dio/dio.dart';

class Apiservice {
  final Dio dio = Dio();

  Future<Response> post({
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await dio.post(
        'https://uz8if7.buildship.run/placeOrder',
        data: body,
        options: Options(contentType: Headers.jsonContentType),
      );
      return response;
    } catch (e) {
      print('Dio POST Error: $e');
      rethrow;
    }
  }
}
