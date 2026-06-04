import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {

  final Function callback;
  final String text;
  final double textSize;
  final int bgcolor;

  const CalcButton({
    super.key,
    required this.callback,
    required this.text,
    required this.textSize,
    required this.bgcolor,
  });

  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        child: TextButton(
          onPressed: () => {
            callback(text),
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(16),
            textStyle: const TextStyle(fontSize: 20),
            backgroundColor: Color(bgcolor),
          ),
          child: Text(
            text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: textSize,
              ),
            ),
            
          ),
        ),
      ),
    );
  }
}