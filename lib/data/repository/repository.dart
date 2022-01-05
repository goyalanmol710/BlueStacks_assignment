

import 'package:bluestacks_assignment/core/services/services.dart';
import 'package:bluestacks_assignment/data/model/recommended_game_model.dart';
import 'package:bluestacks_assignment/data/model/location_model.dart';
import 'package:bluestacks_assignment/data/model/post_panchang_model.dart';
import 'package:bluestacks_assignment/data/repository/i_repository.dart';

class Repository implements IRepository {
  Services service = Services();

  @override
  Future<RecommendedGameData?>? getRecommendedGame() async {
    final result = await service.getRecommendedGame();

    if (result.code == 0) {
      return result.data!;
      //Before return the values we will save (in separate thread)
    } else {
      return null;
    }
  }

  @override
  Future<List<LocationData>?>? getLocationDetails() async {
    final result = await service.getLocationDetails();

    if (result.httpStatusCode == 200) {
      return result.data!;
      //Before return the values we will save (in separate thread)
    } else {
      return null;
    }
  }

  @override
  Future<PostPanchangData?>? postPanchangCall(Map<String, String> map) async {
    final result = await service.postPanchangCall(map);

    if (result.httpStatusCode == 200) {
      return result.data!;
      //Before return the values we will save (in separate thread)
    } else {
      return null;
    }
  }
}
