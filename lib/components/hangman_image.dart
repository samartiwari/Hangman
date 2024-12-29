import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HangmanImage extends StatelessWidget {
  int state;
  HangmanImage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    List<String> url = [
      "assets/hangman.svg","assets/hangman (2).svg",
      "assets/hangman (3).svg","assets/hangman (4).svg",
      "assets/hangman (5).svg","assets/hangman (6).svg",
      "assets/hangman (7).svg","assets/hangman (8).svg"
    ];
    return SvgPicture.asset(url[state],height: 260,);
  }
}
