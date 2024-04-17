import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/blocs/game/game_bloc.dart';
import 'package:flutter_nt_ten/data/repositories/game_repository.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    context.read<GameBloc>();
    // context.read<GameRepository>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("GAME"),
      ),
      body: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          return Column(
            children: [
              Text(
                state.enteredAnswer,
                style: AppTextStyle.interSemiBold.copyWith(
                  fontSize: 45,
                ),
              ),
              Expanded(
                  child: GridView.count(
                crossAxisCount: 4,
                children: List.generate(
                  state.lettersList.length,
                  (index) {
                    return IconButton(
                        onPressed: () {
                          context.read<GameBloc>().add(
                              CollectEnteredLetter(state.lettersList[index]));
                        },
                        icon: Text(state.lettersList[index].toUpperCase()));
                  },
                ),
              ))
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<GameBloc>().add(NextQuestions());
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
