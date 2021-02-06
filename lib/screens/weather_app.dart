import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_ys/Widgets/build_transformation';
import 'package:flutter_svg/svg.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:weather_ys/Widgets/single_weather_app.dart';
import 'package:weather_ys/Widgets/slide_dot.dart';
import 'package:weather_ys/models/weather_locations.dart';

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  int _currentpage = 0;
  String bgImg;

  _onPageChanged(int index){
    setState(() {
      _currentpage = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(locationList[_currentpage].weatherType == 'Sunny') {
      bgImg = 'android/assets/sunny_img.jpg';
    }else if(locationList[_currentpage].weatherType == 'Night') {
      bgImg = 'android/assets/night_img.jpg';
    }else if(locationList[_currentpage].weatherType == 'Rainy') {
      bgImg = 'android/assets/rain_img.jpg';
    }else if(locationList[_currentpage].weatherType == 'Cloudy') {
      bgImg = 'android/assets/cloudy_img.jpg';
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
        ),
        actions: [
          Container(
              margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: GestureDetector(
                onTap: () => print('Menu icon Clicked'),
                child: SvgPicture.asset(
                  'android/assets/menu.svg',
                  height: 40,
                  width: 40,
                  color: Colors.white,
                ),
              ))
        ],
      ),
      body: Container (
        child: Stack(
          children: [
            Image.asset(
              bgImg,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black38), // To prove opacity of container
            ),
            Container(
              margin: EdgeInsets.only(top: 100,left: 15,), // to provide margin left , right , top , bottom
              child: Row(
              children: [
                for(int i=0; i<locationList.length; i++)
                  if(i==_currentpage)
                  SliderDot(true)
                else
                  SliderDot(false)
               ],
              ),
            ),

            TransformerPageView(
              scrollDirection: Axis.horizontal,
              transformer: ScaleAndFadeTransformer(),
              viewportFraction: 0.8,
              onPageChanged: _onPageChanged,
              itemCount: locationList.length,
              itemBuilder: (ctx,i) => SingleWeather(i),
    ),
    ],

    ),

    ),
    );

  }
}
