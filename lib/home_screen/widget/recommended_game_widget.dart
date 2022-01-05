import 'package:bluestacks_assignment/data/model/recommended_game_model.dart';
import 'package:flutter/material.dart';

class RecommmendedGameWidget extends StatelessWidget {
  final Tournaments tournaments;
  const RecommmendedGameWidget({Key? key, required this.tournaments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.25),
            offset: const Offset(
              15.0,
              20.0,
            ),
            blurRadius: 45.0,
            spreadRadius: 0,
          ), //BoxShadow
        ],
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                tournaments.coverUrl!,
                height: 170,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              )),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(bottom: (Radius.circular(20)))),
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 2 / 3,
                      child: Text(
                        tournaments.name ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      tournaments.gameName ?? '',
                      style: const TextStyle(color: Color(0xFF424242)),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                const Icon(Icons.keyboard_arrow_right)
              ],
            ),
          )
        ],
      ),
    );
  }
}
