import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String? location = ''; //location nam for UI
  String? time = ''; //the time in that location
  String? flag = ''; //url to an asset flag icon
  String url = '';
  bool? isDaytime; //location url for api endpoint
  WorldTime({required this.location, required this.flag, required this.url});
  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(datetime); //create datetime object
      now = now.add(Duration(hours: int.parse(offset)));
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = "could not get data";
    }
  }
}
