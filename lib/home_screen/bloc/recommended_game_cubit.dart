import 'package:bloc/bloc.dart';
import 'package:bluestacks_assignment/data/model/recommended_game_model.dart';
import 'package:bluestacks_assignment/data/repository/repository.dart';
import 'package:equatable/equatable.dart';
part 'recommended_game_state.dart';

class RecommendedGameCubit extends Cubit<RecommendedGameState> {
  RecommendedGameCubit() : super(RecommendedGameInitial());
  Repository repository = Repository();
  RecommendedGameData? recommendedGameData;

  getRecommendedGame() async {
    if (state is RecommendedGameInitial) {
      emit(const RecommendedGameLoading());
      final result = await repository.getRecommendedGame();
      if (result != null) {
        recommendedGameData = result;
        emit(RecommendedGameSuccess(
            recommendedGameData: recommendedGameData));
      } else {
        emit(const RecommendedGameFailure());
      }
    }
  }
}
