import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.width, required this.text, required this.onPressed});
  final double width;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: TicTacToeColors().whiteGray,
          foregroundColor: Colors.black,
        ),
        child: Text(
          text.toUpperCase(),
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black,
              ),
        ),
      ),
    );
  }
}
