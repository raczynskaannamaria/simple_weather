import 'package:simple_weather/domain/models/weather_model.dart';

import '../../data/remote_data_sources/weather_remote_data_source.dart';

class WeatherRepository {
  WeatherRepository(this._weatherRemoteDataSource);
  final WeatherRemoteDataSource _weatherRemoteDataSource;
  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    final json = await _weatherRemoteDataSource.getWeatherData(
      city: city,
    );
    if (json == null) {
      return null;
    }

    return WeatherModel.fromJson(json);
  }
}
