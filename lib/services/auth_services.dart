import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

class Auth {
  static String baseUrl = dotenv.env['BASE_URL'] ?? '';
  static Dio dio = Dio();

  static register(
      {required String username, required String password, required String email, required String name}) async {
    final url = '${baseUrl}auth/register?locale=en';
    return await dio.post(
      url,
      data: {'username': username, 'password': password, 'email': email, 'name': name},
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
  }
}
