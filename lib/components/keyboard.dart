import 'package:flutter/material.dart';

class Keyboard extends StatefulWidget {
  Function(String) clicked;
  final List<Color> buttonColors;
  Keyboard({super.key, required this.clicked, required this.buttonColors});

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  List <String> l = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x'];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 24,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
      itemBuilder: (context, index) =>GestureDetector(
        onTap: () {
          setState(() {
            widget.clicked(l[index]);
          });
        },
        child: Container(
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: widget.buttonColors[index],
              borderRadius: BorderRadius.circular(12)
          ),
        child: Center(
            child: Text(
              l[index],
              style: TextStyle(
                fontSize: 20,
              ),
            )
        ),
        ),
      ),

    );
  }
}
