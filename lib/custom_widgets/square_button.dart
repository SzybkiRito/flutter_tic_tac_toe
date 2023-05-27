import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_toe/utils/colors.dart';

class SquareButton extends StatefulWidget {
  const SquareButton({super.key, required this.onPressed, this.icon});
  final VoidCallback onPressed;
  final SvgPicture? icon;

  @override
  State<SquareButton> createState() => _SquareButtonState();
}

class _SquareButtonState extends State<SquareButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 112,
      height: 113,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: TicTacToeColors().whiteGray,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          elevation: 2,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget.icon ?? const SizedBox(),
        ),
      ),
    );
  }
}
