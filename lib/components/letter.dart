import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Letter extends StatelessWidget {
  String let;
  bool known;
  Letter({super.key,required this.let,required this.known});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 55,
        //color: Colors.yellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                let,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: known ? Colors.black : Color(0xfffffdec),
                ),
              ),
              SvgPicture.asset("assets/underline_new.svg",)
            ],
          ),
      ),
    );
  }
}
