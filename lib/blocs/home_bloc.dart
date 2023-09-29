import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/api_current.dart';
import 'package:weather_app/services/api_service.dart';
import 'package:weather_app/services/current_service.dart';
import 'package:weather_app/services/weather_service.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final WeatherService _apiService = ApiService();
  final CurrentService _currentService = ApiCurrent();

  HomeBloc() : super(WeatherInitialState()) {
    on<CityEvent>((event, emitter) async {
      try {
        emit(WeatherLoadingState());
        final response = await _apiService.getWeatherData(event.city);
        if (response.statusCode == 200) {
          WeatherModel weathers =
              WeatherModel.fromJson(jsonDecode(response.body));
          emit(WeatherLoadedState(weathers));
        } else {
          emit(WeatherFailState('Fail'));
        }
      } catch (error) {
        emit(WeatherFailState('Unable to fetch weather data'));
        print(error);
      }
    });
    on<LocationEvent>((event, emitter) async {
      try {
        emit(WeatherLoadingState());
        final response =
            await _currentService.getCurrentData(event.lat, event.lon);
        if (response.statusCode == 200) {
          WeatherModel weathers =
              WeatherModel.fromJson(jsonDecode(response.body));
          emit(WeatherLoadedState(weathers));
        } else {
          emit(WeatherFailState('Fail'));
        }
      } catch (error) {
        emit(WeatherFailState('Unable to fetch weather data'));
        print(error);
      }
    });
  }
}
