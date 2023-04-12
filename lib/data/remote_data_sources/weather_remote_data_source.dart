import 'package:dio/dio.dart';

class WeatherRemoteDataSource {
  Future<Map<String, dynamic>?> getWeatherData({
    required String city,
  }) async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
          'http://api.weatherapi.com/v1/current.json?key=48778bb3f9784ab28ff182912231104&q=$city&aqi=no');
      return response.data;
    } on DioError catch (error) {
      if (error.response == null) {
        throw Exception('Unknown error');
      } else {
        throw Exception(error.response!.data['error']['message']);
      }
    }
  }
}
