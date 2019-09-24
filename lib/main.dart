import 'package:flutter/material.dart';
import 'package:google_places_picker/google_places_picker.dart';


void main() => runApp( MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() =>  _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _placeName = 'Unknown';

  @override
  initState() {
    super.initState();
    PluginGooglePlacePicker.initialize(
      androidApiKey: "AIzaSyB97ewvzcUHJjeCRILK_70CybDYawlZ-G8",
      //iosApiKey: "YOUR_IOS_API_KEY",
    );
  }

  _showAutocomplete() async {
    String placeName;
//    var locationBias = LocationBias()
//      ..northEastLat = 20.0
//      ..northEastLng = 20.0
//      ..southWestLat = 0.0
//      ..southWestLng = 0.0;
//
//    var locationRestriction = LocationRestriction()
//      ..northEastLat = 20.0
//      ..northEastLng = 20.0
//      ..southWestLng = 0.0
//      ..southWestLat = 0.0;

    var country = "US";

    var place = await PluginGooglePlacePicker.showAutocomplete
      (
        mode:
        PlaceAutocompleteMode.MODE_FULLSCREEN,
        countryCode: country,
//        restriction: locationRestriction,
        typeFilter: TypeFilter.ESTABLISHMENT
    );
    placeName = place.name;
//    if (!mounted)
//      return;

    setState(() {
      _placeName = placeName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:  Scaffold(
        appBar:  AppBar(
          title:  Text('Place picker example app'),
        ),
        body:  Center(
          child:  Column(
            children: <Widget>[
              FlatButton(onPressed: _showAutocomplete,
                  child: Text("Show autocomplete")),
              Row(
                children: <Widget>[
                  Text("Place name: "),
                  Text(_placeName)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

