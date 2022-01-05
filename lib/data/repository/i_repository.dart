

import 'package:bluestacks_assignment/data/model/recommended_game_model.dart';
import 'package:bluestacks_assignment/data/model/location_model.dart';
import 'package:bluestacks_assignment/data/model/post_panchang_model.dart';

abstract class IRepository {
  Future<RecommendedGameData?>? getRecommendedGame();
  Future<List<LocationData>?>? getLocationDetails();
  Future<PostPanchangData?>? postPanchangCall(Map<String, String> map);
}
