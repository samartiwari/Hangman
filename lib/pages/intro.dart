import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hangman/pages/credits.dart';
import 'game.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFDEC),
        body: Column(
          children: [
            const SizedBox(height: 130,),
            Center(child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/noose-svgrepo-com.svg",height: 100,),
                const Text("HANGMAN",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF86A788)
                  ),
                ),
              ],
            ),
            ),
            const SizedBox(height: 70),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyGame(),
                  ),
                );
              },
              child: Container(
                height: 90,
                width: 260,
                decoration: BoxDecoration(
                    color: Color(0xffFFE2E2),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: const Center(
                  child: Text(
                    "Start",
                    style: TextStyle(
                        fontSize: 35,
                      color: Color(0xff86A788)
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Credits(),
                  ),
                );
              },
              child: Container(
                height: 90,
                width: 260,
                decoration: BoxDecoration(
                    color: Color(0xffFFE2E2),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: const Center(
                  child: Text(
                    "Credits",
                    style: TextStyle(
                        fontSize: 35,
                        color: Color(0xff86A788)
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            GestureDetector(
              onTap: (){
                SystemNavigator.pop();
              },
              child: Container(
                height: 90,
                width: 260,
                decoration: BoxDecoration(
                    color: Color(0xffFFE2E2),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: const Center(
                  child: Text(
                    "Exit",
                    style: TextStyle(
                        fontSize: 35,
                        color: Color(0xff86A788)
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}
