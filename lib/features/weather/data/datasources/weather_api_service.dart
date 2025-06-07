import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/weather_dtos.dart';

part 'weather_api_service.g.dart';

@RestApi()
abstract class WeatherApiService {
  factory WeatherApiService(Dio dio, {String baseUrl}) = _WeatherApiService;

  @GET('/timeline/{location}')
  Future<WeatherResponseDto> getCurrentWeather(
    @Path() String location,
    @Query('key') String apiKey,
    @Query('unitGroup') String unitGroup,
    @Query('include') String include,
    @Query('lang') String lang,
  );

  @GET('/timeline/{location}/last5days')
  Future<WeatherResponseDto> getForecast(
    @Path() String location,
    @Query('key') String apiKey,
    @Query('unitGroup') String unitGroup,
    @Query('include') String include,
    @Query('lang') String lang,
  );

  @GET('/timeline/{location}')
  Future<WeatherEventsResponseDto> getWeatherEvents(
    @Path() String location,
    @Query('key') String apiKey,
    @Query('include') String include,
    @Query('events') String events,
    @Query('lang') String lang,
  );
}
