import 'package:flutter/material.dart';
import 'package:hangman/pages/intro.dart';

class Credits extends StatelessWidget {
  const Credits({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("assets/me.jpg"),
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.all(15),
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IntroPage(),
                ),
              );
            },
            child: Container(
              height: 60,
              width: 100,
              color: Colors.white,
              child: const Center(child: Text(
                "Back",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.yellow
                ),

              )),
            ),
          ),
        )
      ],
    );
  }
}
