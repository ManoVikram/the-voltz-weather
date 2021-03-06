import 'package:flutter/material.dart';

import '../../constants.dart';

import '../models/models.dart';

import './hourly_data_details.dart';

class HourlyData extends StatelessWidget {
  const HourlyData({
    Key? key,
    required this.hourlyWeatherDetails,
  }) : super(key: key);

  final HourlyWeatherInfo hourlyWeatherDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: defaultPadding),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: defaultPadding / 2,
            horizontal: defaultPadding * 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Today",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // ! I will add this later after completing this screen
              // ! along with fetching data from the API!
              /* GestureDetector(
                onTap: () {},
                child: Row(
                  children: const [
                    Text(
                      "7 days",
                      style: TextStyle(
                        color: Colors.white60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.navigate_next_outlined,
                      color: Colors.white60,
                    ),
                  ],
                ),
              ), */
              SizedBox.shrink(),
            ],
          ),
        ),
        const SizedBox(height: defaultPadding),
        SizedBox(
          height: 90,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: hourlyWeatherDetails.hourlyWeatherInfo.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  if (index == 0) const SizedBox(width: defaultPadding),
                  HourlyDataDetails(
                    temperature: hourlyWeatherDetails
                        .hourlyWeatherInfo[index].hourlyTemperature
                        .toInt(),
                    // image: "assets/images/Cloudy.png",
                    image: hourlyWeatherDetails
                        .hourlyWeatherInfo[index].weatherIcon,
                    time:
                        "${hourlyWeatherDetails.hourlyWeatherInfo[index].hourlyTimestamp.hour}:00",
                  ),
                  if (index ==
                      hourlyWeatherDetails.hourlyWeatherInfo.length - 1)
                    const SizedBox(width: defaultPadding * 0.5),
                ],
              );
            },
          ),
        ),
        /* SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              HourlyDataDetails(
                temperature: 13,
                image: "assets/images/Cloudy.png",
                time: "10:00",
              ),
              HourlyDataDetails(
                temperature: 21,
                image: "assets/images/Cloudy.png",
                time: "11:00",
              ),
              HourlyDataDetails(
                temperature: 23,
                image: "assets/images/Cloudy.png",
                time: "12:00",
              ),
              HourlyDataDetails(
                temperature: 31,
                image: "assets/images/Cloudy.png",
                time: "13:00",
              ),
            ],
          ),
        ), */
      ],
    );
  }
}
