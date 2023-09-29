import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    super.key,
    required this.temp,
    required this.description,
    required this.name,
    required this.icon,
  });

  final int temp;
  final String description;
  final String name;
  final String icon;

  Icon getWeatherIcon(String iconId) {
    iconId = iconId.substring(0, 2);
    Icon icons = Icon(
      Icons.wb_sunny_rounded,
      size: 200,
      color: Colors.orange,
    );
    if (iconId == '02' || iconId == '03' || iconId == '04') {
      icons = Icon(
        Icons.wb_cloudy_rounded,
        size: 200,
        color: Colors.white,
      );
    } else if (iconId == '09' || iconId == '10') {
      icons = Icon(
        Icons.cloudy_snowing,
        size: 200,
        color: Colors.grey,
      );
    } else if (iconId == '11') {
      icons = Icon(
        Icons.thunderstorm,
        size: 200,
        color: Colors.grey,
      );
    } else if (iconId == '13') {
      icons = Icon(
        Icons.waves_rounded,
        size: 200,
        color: Colors.grey,
      );
    }
    return icons;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "TODAY'S FORECAST",
            style: TextStyle(
              color: Color(0xFF618264),
              fontFamily: 'poppins',
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: Stack(
              alignment:
                  Alignment.topLeft, // Menempatkan teks ke ujung kanan bawah
              children: [
                getWeatherIcon(icon),
                Container(
                  margin: EdgeInsets.only(
                      top: 120.0, left: 130.0), // Jarak dari bawah dan kanan
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$temp\u00B0",
                        style: TextStyle(
                          color: Color(0xFF618264),
                          fontWeight: FontWeight.w500,
                          fontSize: 80,
                        ),
                      ),
                      Text(
                        description,
                        style: TextStyle(
                          color: Color(0xFF618264),
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          height: 0.1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            name,
            style: TextStyle(
              color: Color(0xFF618264),
              fontFamily: 'poppins',
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
          Text(
            DateFormat('EEEE').format(DateTime.now()).toUpperCase() + ", TODAY",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'poppins',
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
