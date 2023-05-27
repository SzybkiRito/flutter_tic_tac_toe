import 'package:flutter/material.dart';
import 'package:tic_tac_toe/custom_widgets/buttons/custom_elevated_button.dart';
import 'package:tic_tac_toe/pages/main_page.dart';
import 'package:tic_tac_toe/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RestartGameDialog extends StatefulWidget {
  const RestartGameDialog({super.key, required this.onRestartGame, required this.title});
  final VoidCallback onRestartGame;
  final String title;

  @override
  State<RestartGameDialog> createState() => _RestartGameDialogState();
}

class _RestartGameDialogState extends State<RestartGameDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          color: TicTacToeColors().orange,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Text(
              widget.title.toUpperCase(),
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    height: 1,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: CustomElevatedButton(
                width: MediaQuery.of(context).size.width,
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  widget.onRestartGame();
                },
                text: AppLocalizations.of(context)!.restartGame,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: CustomElevatedButton(
                width: MediaQuery.of(context).size.width,
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MainPage(),
                    ),
                  );
                },
                text: AppLocalizations.of(context)!.mainMenu,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
