import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_toe/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShadowBoxIconButton extends StatelessWidget {
  const ShadowBoxIconButton({super.key, required this.onPressed, required this.svgIconPath});
  final VoidCallback onPressed;
  final String svgIconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 240,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            height: 100,
            child: IconButton(
              onPressed: onPressed,
              icon: SvgPicture.asset(
                svgIconPath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            AppLocalizations.of(context)!.click.toUpperCase(),
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  height: 1,
                ),
          ),
          Text(
            AppLocalizations.of(context)!.andPlay.toUpperCase(),
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.black,
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                ),
          ),
        ],
      ),
    );
  }
}
