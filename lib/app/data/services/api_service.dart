import 'package:dio/dio.dart';
import '../../config.dart';
import '../models/user_model.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://reqres.in/api',
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 3),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'x-api-key': AppConfig.apiKey,
    },
  ));

  Future<List<User>> fetchUsers({int page = 1, int perPage = 10}) async {
    try {
      final response = await _dio.get(
        '/users',
        queryParameters: {'page': page, 'per_page': perPage},
      );

      List<dynamic> data = response.data['data'];
      if (data.isEmpty) {
        return [];
      }
      return data.map((json) => User.fromJson(json)).toList();

    } on DioException catch (e) {
      String errorMessage = "Failed to load users.";
      if (e.response != null) {
        print('Error Response data: ${e.response?.data}');
        errorMessage = 'Error: ${e.response?.data['error'] ?? 'Request failed'}';
      } else {
        errorMessage = 'Error sending request: ${e.message}';
      }
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}