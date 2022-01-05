import 'dart:convert';

import 'package:bluestacks_assignment/data/model/location_model.dart';
import 'package:bluestacks_assignment/data/model/post_panchang_model.dart';
import 'package:bluestacks_assignment/data/model/recommended_game_model.dart';
import 'package:http/http.dart' as http;

class Services {
  Future<RecommendedGameModel> getRecommendedGame() async {
    final response = await http
        .get(Uri.parse("http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=10&status=all"));
    final data = await json.decode(response.body);
    return Future.delayed(const Duration(milliseconds: 10))
        .then((value) => RecommendedGameModel.fromJson(data));
  }

  Future<LocationModel> getLocationDetails() async {
    final response = await http.get(Uri.parse(
        "https://www.astrotak.com/astroapi/api/location/place?inputPlace=Delhi"));
    final data = await json.decode(response.body);
    return Future.delayed(const Duration(milliseconds: 10))
        .then((value) => LocationModel.fromJson(data));
  }

  Future<PostPanchangModel> postPanchangCall(Map<String, String> map) async {
    final response = await http.post(
      Uri.parse(
          "https://www.astrotak.com/astroapi/api/horoscope/daily/panchang"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(map),
    );
    final data = await json.decode(response.body);
    return Future.delayed(const Duration(milliseconds: 10))
        .then((value) => PostPanchangModel.fromJson(data));
  }
}
