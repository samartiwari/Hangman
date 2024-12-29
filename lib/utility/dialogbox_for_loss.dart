import 'package:flutter/material.dart';

class DialogboxForLoss extends StatelessWidget {
  String secret;
  VoidCallback onNewGame;
  DialogboxForLoss({super.key, required this.onNewGame, required this.secret});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)
      ),
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            const Text(
              "You Lost!",
              style: TextStyle(
                  fontSize: 45
              ),
            ),
            Text("The word was:  "+secret),
            const SizedBox(height: 30,),
            GestureDetector(
              onTap:(){
                Navigator.of(context).pop();
                onNewGame();
              },
              child: Container(
                height: 35,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(child: Text(
                  "New Game?",
                  style: TextStyle(
                      fontSize: 18
                  ),

                )
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}
