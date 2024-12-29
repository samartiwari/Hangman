import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hangman/components/hangman_image.dart';
import 'dart:math';
import 'package:hangman/components/letter.dart';
import 'package:hangman/pages/intro.dart';
import 'package:hangman/utility/dialogbox_for_loss.dart';
import '../components/keyboard.dart';
import '../utility/dialogbox.dart';

//reverse true false of guess
//color palatte

class MyGame extends StatefulWidget {
  MyGame({super.key});

  @override
  State<MyGame> createState() => _MyGameState();
}

class _MyGameState extends State<MyGame> {
  int stateOfHangman = 0;
  int stateOfLetters = 0;
  String hiddenWord = (all.where((word) => word.length <= 13).toList())[Random().nextInt(all.where((word) => word.length <= 13).length)];
  late List<bool> knownList = List.generate(hiddenWord.length, (index) => false);
  late List<Letter> letter = List.generate(hiddenWord.length,
  (index) => Letter(
  let: hiddenWord[index],
  known: knownList[index],
  )
  );
  late List<Color> clickedLetters = List.generate(26, (index)=>Color(0xffFFE2E2));

  void startNewGame(){
    stateOfHangman = 0;
    stateOfLetters = 0;
    hiddenWord = all[Random().nextInt(all.length)];
    knownList = List.generate(hiddenWord.length, (index) => false);
    letter = List.generate(hiddenWord.length,
            (index) => Letter(
          let: hiddenWord[index],
          known: knownList[index],
        )
    );
    clickedLetters = List.generate(26, (index)=>Color(0xffFFE2E2));

    setState(() {
    });
  }

  void onClicked(String letterPressed){
    setState(() {
      if(clickedLetters[letterPressed.codeUnitAt(0) - 'a'.codeUnitAt(0)]!=Color(0xffFFE2E2)){
        return;
      }
      int counter = 0;
      for(int i=0;i<hiddenWord.length;i++){
        if(hiddenWord[i]==letterPressed){
          knownList[i] = true;
          stateOfLetters++;
          counter++;
        }
        letter = List.generate(hiddenWord.length,
        (index) => Letter(
          let: hiddenWord[index],
          known: knownList[index],
                  )
        );
      }
      if(counter!=0){
        clickedLetters[letterPressed.codeUnitAt(0) - 'a'.codeUnitAt(0)] = Colors.green;
      }
      else{
        stateOfHangman++;
        clickedLetters[letterPressed.codeUnitAt(0) - 'a'.codeUnitAt(0)] = Colors.red;
      }
      if(stateOfLetters==hiddenWord.length){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialogbox(onNewGame: startNewGame,);  // Show your custom dialog here
          },
        );
      }
      if(stateOfHangman==7){
        showDialog(
            context: context,
            builder: (BuildContext context){
              return DialogboxForLoss(onNewGame: startNewGame,secret: hiddenWord,);
            }
        );
      }
      print(stateOfLetters);
      print("state of hangman is:");
      print(stateOfHangman);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffdec),
      body: Column(
        children: [
          const SizedBox(height: 120,),
          SizedBox(
            width: 212,
            child: Align(
              alignment: Alignment.bottomLeft,
                child: HangmanImage(
                    state: stateOfHangman
                )
            ),
          ),
          const SizedBox(height: 35,),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,// Horizontal scrolling
                itemCount: hiddenWord.length,
                itemBuilder: (context, index) {
                  return letter[index];
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50,right: 50,),
            child: SizedBox(
              height: 250,
                child: Keyboard(
                  clicked: onClicked ,
                  buttonColors: clickedLetters,
                )
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children:[
                GestureDetector(
                  onTap: ()=>onClicked("y"),
                  child: Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: clickedLetters[24],
                    ),
                    child: const Center(child: Text("y",style: TextStyle(fontSize: 20),)),
                  ),
                ),
                SizedBox(width: 5,),
                GestureDetector(
                  onTap: ()=>onClicked("z"),
                  child: Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: clickedLetters[25],
                    ),
                    child: Center(child: Text("z",style: TextStyle(fontSize: 20),)),
                  ),
                ),
              ]
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IntroPage(),
                  ),
                );
                  },
                child: Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Color(0xff86A788),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                ),
              ),
              GestureDetector(
                onTap: startNewGame,
                child: Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Color(0xff86A788),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: Text(
                      "Reset",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}
