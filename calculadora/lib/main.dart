import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
import 'widgets/calc_button.dart';


void main() {
  runApp(const CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({super.key});

  @override
  State<CalcApp> createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {

  String _history = "";
  String _expression = "";

  void allClear(String text) {
    setState(() {
      _history = "";
      _expression = "";
    });
  }

  void clear(String text) {
    setState(() {
      _expression = "";
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      home: Scaffold(
        backgroundColor: const Color(0xff283637),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _history,
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                        color: const Color(0xFF545F61),),
                        fontSize: 24,
                    ),
                  ),
                          
                ),
              ),
              
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    _expression,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                      ),
                    ),
                  ),
                ),
              ),

              //Primera fila de botones
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    callback: allClear,
                    text: "AC",
                    textSize: 20,
                    bgcolor: 0xFF00BF45,
                  ),
                  CalcButton(
                    callback: clear,
                    text: "C",
                    textSize: 20,
                    bgcolor: 0xFFE3303A,
                  ),
                  CalcButton(
                    callback: numClick,
                    text: "%",
                    textSize: 20,
                    bgcolor: 0xFF6FDBFF,
                  ),
                  CalcButton(
                    callback: numClick,
                    text: "/",
                    textSize: 20,
                    bgcolor: 0xFF6FDBFF,
                  )
                ],
              ),
              //Segunda fila de botones
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    callback: numClick,
                    text: "7",
                    textSize: 20,
                    bgcolor: 0xFF545F61,
                  ),
                  CalcButton(
                    callback: numClick,
                    text: "8",
                    textSize: 20,
                    bgcolor: 0xFF545F61,
                  ),
                  CalcButton(
                    callback: numClick,
                    text: "9",
                    textSize: 20,
                    bgcolor: 0xFF545F61,  
                  ),
                  CalcButton(
                    callback: numClick,
                    text: "*",
                    textSize: 20,
                    bgcolor: 0xFF6FDBFF,
                  )
                ],
              ),
              //Tercera fila de botones
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    callback: numClick,
                    text: "4",
                    textSize: 20,
                    bgcolor: 0xFF545F61,
                  ),
                  CalcButton(
                    callback: numClick,
                    text: "5",
                    textSize: 20,
                    bgcolor: 0xFF545F61,
                  ),
                  CalcButton(
                    callback: numClick,
                    text: "6",
                    textSize: 20,
                    bgcolor: 0xFF545F61,  
                  ),
                  CalcButton(
                    callback: numClick,
                    text: "-",
                    textSize: 20,
                    bgcolor: 0xFF6FDBFF,
                  )
                ],
              ),
              //Cuarta fila de botones
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    callback: numClick,
                    text: "1",
                    textSize: 20,
                    bgcolor: 0xFF545F61,
                  ),
                  CalcButton(
                    callback: numClick,
                    text: "2",
                    textSize: 20,
                    bgcolor: 0xFF545F61,
                  ),
                  CalcButton(
                    callback: numClick,
                    text: "3",
                    textSize: 20,
                    bgcolor: 0xFF545F61,  
                  ),
                  CalcButton(
                    callback: numClick,
                    text: "+",
                    textSize: 20,
                    bgcolor: 0xFF6FDBFF,
                  )
                ],
              ),
              //Quinta fila de botones
              //Segunda fila de botones
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    callback: numClick,
                    text: ".",
                    textSize: 20,
                    bgcolor: 0xFF545F61,
                  ),
                  CalcButton(
                    callback: numClick,
                    text: "0",
                    textSize: 20,
                    bgcolor: 0xFF545F61,
                  ),
                  CalcButton(
                    callback: numClick,
                    text: "00",
                    textSize: 20,
                    bgcolor: 0xFF545F61,  
                  ),
                  CalcButton(
                    callback: evaluate,
                    text: "=",
                    textSize: 20,
                    bgcolor: 0xFF00A3D9,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
