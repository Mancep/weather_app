import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/widgets/weather_widget.dart';
import 'package:geolocator/geolocator.dart';
import '../blocs/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const nameRoute = '/';

  final cityLocation = TextEditingController();

  late String lat;

  late String lon;

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Please Enable Location Services');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    final homeBloc = HomeBloc();
    _getCurrentLocation().then(
      (value) {
        lat = '${value.latitude}';
        lon = '${value.longitude}';
      },
    );
    return Scaffold(
      backgroundColor: Color(0xFFD0E7D2),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: homeBloc,
        builder: (context, state) {
          return SingleChildScrollView(
            child: Center(
              child: Container(
                padding: EdgeInsets.only(top: 50),
                width: 300,
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'City'),
                      controller: cityLocation,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        homeBloc.add(CityEvent(cityLocation.text.trim()));
                      },
                      child: Text('Get Weather by City Name'),
                    ),
                    Container(
                      height: 500,
                      child: state is WeatherLoadingState
                          ? const CircularProgressIndicator()
                          : state is WeatherLoadedState
                              ? WeatherWidget(
                                  temp: state.weathers.main.temp.round(),
                                  description:
                                      state.weathers.weather[0].description,
                                  name: state.weathers.name,
                                  icon: state.weathers.weather[0].icon,
                                )
                              : state is WeatherFailState
                                  ? Text(state.error)
                                  : SizedBox.shrink(),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        homeBloc.add(LocationEvent(lat, lon));
                      },
                      child: Text('Get Weather by Current Location'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
