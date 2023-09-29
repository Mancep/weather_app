part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class WeatherInitialState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WeatherLoadingState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WeatherLoadedState extends HomeState {
  final WeatherModel weathers;

  WeatherLoadedState(this.weathers);
  @override
  // TODO: implement props
  List<Object?> get props => [weathers];
}

class WeatherFailState extends HomeState {
  final String error;

  WeatherFailState(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

class SuccessGetLocation extends HomeState {
  final double lat;
  final double lon;

  SuccessGetLocation(this.lat, this.lon);

  @override
  // TODO: implement props
  List<Object?> get props => [lat, lon];
}

class LoadWeather extends HomeState {
  final List<Weather> weathers;

  LoadWeather(this.weathers);

  @override
  // TODO: implement props
  List<Object?> get props => [weathers];
}
