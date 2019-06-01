import 'package:example_flutter/WeatherInfo.dart';
import 'package:example_flutter/modelspostall.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.deepOrange),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
      builder: (context) => WeatherInfo(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Provider Pattern'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              MySpecialHeading(),
              MySpecialContent(),
              Expanded(
                child: GetPostsUi(),
              )
            ],
          ),
        ),
        floatingActionButton: MyFloatingActionButton(),
      ),
    );
  }
}

class MySpecialHeading extends StatelessWidget {
  Color decideColor(WeatherInfo info) {
    return info.temperatureType == "celcius" ? Colors.green : Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    var weatherInfo = Provider.of<WeatherInfo>(context);
    // TODO: implement build
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Consumer<WeatherInfo>(
          builder: (context, weatherInfo, _) => Text(
                weatherInfo.temperatureType,
                style: TextStyle(color: decideColor(weatherInfo)),
              ),
        ));
  }
}

class MySpecialContent extends StatelessWidget {
  Color decideColor(WeatherInfo info) {
    return info.temperatureType == "celcius" ? Colors.green : Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    var weatherInfo = Provider.of<WeatherInfo>(context);
    // TODO: implement build
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Consumer<WeatherInfo>(
          builder: (context, weatherInfo, _) => Text(
                weatherInfo.title,
                style: TextStyle(color: decideColor(weatherInfo)),
              ),
        ));
  }
}

class MyFloatingActionButton extends StatelessWidget {
  Color decideColor(WeatherInfo info) {
    return info.temperatureType == "celcius" ? Colors.green : Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    var weatherInfo = Provider.of<WeatherInfo>(context);

    return FloatingActionButton(
      backgroundColor: decideColor(weatherInfo),
      onPressed: () {
        String newWeatherType =
            weatherInfo.temperatureType == "celcius" ? "far" : "celcius";
        weatherInfo.temperatureType = newWeatherType;
        weatherInfo.titlefunction();
        weatherInfo.listfunction();
      },
      tooltip: "Change Type",
      child: Icon(Icons.change_history),
    );
  }
}

class GetPostsUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var weatherInfo = Provider.of<WeatherInfo>(context);

    return weatherInfo.postalltitle == null
        ? Text("Masih kosong gan")
        : ListView.builder(
            itemCount: weatherInfo.postalltitle.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(weatherInfo.postalltitle[index].title.toString()),
              );
            });
  }
}
