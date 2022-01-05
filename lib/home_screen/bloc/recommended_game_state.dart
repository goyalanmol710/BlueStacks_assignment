part of 'recommended_game_cubit.dart';

abstract class RecommendedGameState extends Equatable {
  const RecommendedGameState();
}

class RecommendedGameInitial extends RecommendedGameState {
  @override
  List<Object> get props => [];
}

class RecommendedGameSuccess extends RecommendedGameState {
  final RecommendedGameData? recommendedGameData;

  const RecommendedGameSuccess({this.recommendedGameData});

  @override
  List<Object> get props => [];
}

class RecommendedGameFailure extends RecommendedGameState {
  const RecommendedGameFailure();

  @override
  List<Object> get props => [];
}

class RecommendedGameLoading extends RecommendedGameState {
  const RecommendedGameLoading();

  @override
  List<Object> get props => [];
}
