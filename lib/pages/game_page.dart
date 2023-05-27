import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_toe/custom_widgets/buttons/custom_elevated_button.dart';
import 'package:tic_tac_toe/custom_widgets/dialog/restart_game_dialog.dart';
import 'package:tic_tac_toe/custom_widgets/shadow_box_headline.dart';
import 'package:tic_tac_toe/custom_widgets/square_button.dart';
import 'package:tic_tac_toe/pages/main_page.dart';
import 'package:tic_tac_toe/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool playerTurn = true;
  List<int> playerChosenCells = [];
  List<int> computerChosenCells = [];

  @override
  void initState() {
    super.initState();
  }

  void makePlayerMove(int rowIndex, int columnIndex) {
    final buttonIndex = rowIndex * 3 + columnIndex;
    if (!playerChosenCells.contains(buttonIndex) && !computerChosenCells.contains(buttonIndex) && playerTurn) {
      setState(() {
        playerChosenCells.add(buttonIndex);
        playerTurn = false;
      });
    }
  }

  List<int> getAvailableCells() {
    List<int> availableCells = [];
    for (var i = 0; i < 9; i++) {
      if (!playerChosenCells.contains(i) && !computerChosenCells.contains(i)) {
        availableCells.add(i);
      }
    }

    return availableCells;
  }

  void makeComputerMove(int rowIndex, int columnIndex) {
    // make computer random move
    final random = Random();
    List<int> availableCells = getAvailableCells();
    final randomIndex = random.nextInt(availableCells.length);
    final buttonIndex = availableCells[randomIndex];
    if (!computerChosenCells.contains(buttonIndex) && !playerTurn) {
      setState(() {
        computerChosenCells.add(buttonIndex);
        playerTurn = true;
      });
    }
  }

  bool getGameResult() {
    final List<List<int>> winningConditions = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6] // Diagonals
    ];

    bool gameOver = false;
    Set playerChosenCells = this.playerChosenCells.toSet();
    Set computerChosenCells = this.computerChosenCells.toSet();
    for (final condition in winningConditions) {
      if (playerChosenCells.containsAll(condition)) {
        gameOver = true;
        break;
      } else if (computerChosenCells.containsAll(condition)) {
        gameOver = true;
        break;
      }
    }

    return gameOver;
  }

  void endGame() {
    bool gameOver = getGameResult();
    if (gameOver && !playerTurn) {
      showEndGameDialog(AppLocalizations.of(context)!.youWin);
      return;
    } else if (gameOver && playerTurn) {
      showEndGameDialog(AppLocalizations.of(context)!.youLose);
      return;
    } else {
      showEndGameDialog(AppLocalizations.of(context)!.draw);
      return;
    }
  }

  void showEndGameDialog(String title) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return RestartGameDialog(
          title: title,
          onRestartGame: () {
            restartGame();
          },
        );
      },
    );
  }

  void restartGame() {
    setState(() {
      playerChosenCells = [];
      computerChosenCells = [];
      playerTurn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ShadowBoxHeadline(
                  textColor: TicTacToeColors().orange,
                ),
              ),
              const SizedBox(height: 40),
              Column(
                children: List.generate(3, (rowIndex) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(3, (columnIndex) {
                        return SquareButton(
                          onPressed: () {
                            makePlayerMove(rowIndex, columnIndex);
                            if (getGameResult()) {
                              endGame();
                              return;
                            }

                            if (getAvailableCells().isEmpty) {
                              endGame();
                              return;
                            }

                            if (!playerTurn) {
                              makeComputerMove(rowIndex, columnIndex);
                              if (getGameResult()) {
                                endGame();
                                return;
                              }
                            }
                          },
                          icon: playerChosenCells.contains(rowIndex * 3 + columnIndex)
                              ? SvgPicture.asset('assets/icons/x_icon.svg')
                              : computerChosenCells.contains(rowIndex * 3 + columnIndex)
                                  ? SvgPicture.asset('assets/icons/o_icon.svg')
                                  : null,
                        );
                      }),
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomElevatedButton(
                width: MediaQuery.of(context).size.width * 0.8,
                text: AppLocalizations.of(context)!.restartGame,
                onPressed: () {
                  restartGame();
                },
              ),
              CustomElevatedButton(
                width: MediaQuery.of(context).size.width * 0.8,
                text: AppLocalizations.of(context)!.mainMenu,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MainPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
