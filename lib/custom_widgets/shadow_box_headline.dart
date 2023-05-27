import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils/colors.dart';

class ShadowBoxHeadline extends StatelessWidget {
  const ShadowBoxHeadline({
    super.key,
    required this.textColor,
  });
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 239,
      decoration: BoxDecoration(
        color: TicTacToeColors().whiteGray,
        boxShadow: [
          BoxShadow(
            color: TicTacToeColors().blackShadow,
            spreadRadius: 4,
            blurRadius: 10,
            offset: const Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Tic", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20, color: textColor)),
                Text(
                  "Tac",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: textColor,
                      ),
                ),
                Text("Toe", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20, color: textColor)),
              ],
            ),
            Text(
              "XO",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: textColor,
                    fontSize: 15,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
