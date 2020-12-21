
//Rahmani:  I did this course till sec 154(Dr. Angela course) and could not match my longitude,
// latitude and API key with this app and also "weatherData" can not been updated.
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const apiKey = 'your API';
// your API  Key

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    super.initState();
    getLocationData();
  }
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

  NetworkHelper networkHelper = NetworkHelper(''
      'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&long=${location.longitude}&appid=$apiKey&units=metric');

  var weatherData = await networkHelper.getData();
  
  Navigator.push(context, MaterialPageRoute(builder: (context){
    return LocationScreen(
      locationWeather: weatherData,);
    }));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: SpinKitFadingFour(
          color: Colors.yellow,
          size: 100.0,
        ),
      ),
    );
  }
}
