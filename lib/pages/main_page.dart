import 'package:flutter/material.dart';
import 'package:tic_tac_toe/custom_widgets/shadow_box_headline.dart';
import 'package:tic_tac_toe/custom_widgets/shadow_box_icon_button.dart';
import 'package:tic_tac_toe/pages/game_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ShadowBoxHeadline(
                textColor: Colors.black,
              ),
              const SizedBox(height: 80),
              ShadowBoxIconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GamePage(),
                    ),
                  );
                },
                svgIconPath: 'assets/icons/play_icon.svg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
