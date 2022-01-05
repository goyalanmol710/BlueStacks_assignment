import 'package:bluestacks_assignment/data/model/recommended_game_model.dart';
import 'package:bluestacks_assignment/home_screen/bloc/recommended_game_cubit.dart';
import 'package:bluestacks_assignment/home_screen/widget/game_count_widget.dart';
import 'package:bluestacks_assignment/home_screen/widget/recommended_game_widget.dart';
import 'package:bluestacks_assignment/home_screen/widget/user_details_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecommendedGameCubit(),
      child: const HomeScreenView(),
    );
  }
}

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  late RecommendedGameCubit recommendedGameCubit;
  late TextEditingController searchController;
  RecommendedGameData? recommendedGameData;

  @override
  void initState() {
    searchController = TextEditingController();
    recommendedGameCubit = BlocProvider.of<RecommendedGameCubit>(context);
    recommendedGameCubit.getRecommendedGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecommendedGameCubit, RecommendedGameState>(
        listener: (context, recommendedGameState) {
      if (recommendedGameState is RecommendedGameSuccess) {
        recommendedGameData = recommendedGameState.recommendedGameData;
      }
    }, builder: (context, recommendedGameState) {
      if (recommendedGameState is RecommendedGameSuccess) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            title: const Text(
              'Flyingwolf',
              style: TextStyle(color: Colors.black),
            ),
            // actions: const <Widget>[
            //   Padding(
            //     padding: EdgeInsets.only(right: 16.0),
            //     child: Image(
            //       image: AssetImage('assets/images/profile.png'),
            //       width: 30,
            //     ),
            //   ),
            // ],
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const UserDetailsWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  const GameCountWidget(),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Recommended for you',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    children: recommendedGameList(
                        recommendedGameState.recommendedGameData!.tournaments!),
                  ),
                ],
              ),
            ),
          )),
        );
      } else {
        return Container(
          child: const Center(child: CircularProgressIndicator()),
          height: double.infinity,
          color: Colors.white,
        );
      }
    });
  }

  List<Widget> recommendedGameList(List<Tournaments> listOfTournaments) {
    List<Widget> list = [];
    for (var element in listOfTournaments) {
      list.add(RecommmendedGameWidget(
        tournaments: element,
      ));
    }
    return list;
  }
}
