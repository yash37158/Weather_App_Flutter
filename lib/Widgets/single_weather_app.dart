import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_ys/models/weather_locations.dart';

class SingleWeather extends StatelessWidget {
  final int index;
  SingleWeather(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 100),
                    Text(
                      locationList[index].city,
                      style: GoogleFonts.lato(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      locationList[index].dateTime,
                      style: GoogleFonts.lato(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    Text(
                      locationList[index].temparature,
                      style: GoogleFonts.lato(
                        fontSize: 85,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          locationList[index].iconUrl,
                          height: 30,
                          width: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          locationList[index].weatherType,
                          style: GoogleFonts.lato(
                              fontSize: 22, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 40),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white70)),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Wind',
                      style: GoogleFonts.lato(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(locationList[index].wind.toString(),
                        style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Text('kmph',
                        style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Stack(
                      children: [
                        Container(
                          height: 5,
                          width: 50,
                          color: Colors.white30,
                        ),
                        Container(
                          height: 5,
                          width: 10,
                          color: Colors.blue[300],
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Rain',
                      style: GoogleFonts.lato(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(locationList[index].rain.toString(),
                        style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Text('%',
                        style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Stack(
                      children: [
                        Container(
                          height: 5,
                          width: 50,
                          color: Colors.white30,
                        ),
                        Container(
                          height: 5,
                          width: 7,
                          color: Colors.red[400],
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Humidiity',
                      style: GoogleFonts.lato(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(locationList[index].humidity.toString(),
                        style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Text('%',
                        style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Stack(
                      children: [
                        Container(
                          height: 5,
                          width: 50,
                          color: Colors.white30,
                        ),
                        Container(
                          height: 5,
                          width: 15,
                          color: Colors.green[300],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
