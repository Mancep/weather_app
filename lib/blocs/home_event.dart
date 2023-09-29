part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LocationEvent extends HomeEvent {
  final String lat;
  final String lon;

  LocationEvent(this.lat, this.lon);
  @override
  // TODO: implement props
  List<Object?> get props => [lat, lon];
}

class CityEvent extends HomeEvent {
  final String city;

  CityEvent(this.city);
  @override
  // TODO: implement props
  List<Object?> get props => [city];
}

class ResetWeatherEvent extends HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
