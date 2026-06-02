import 'package:flutter/material.dart';

void main() {
  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Pantalla uno
      home: const PantallaUno(),
    );
  }
}

// Pantalla uno
class PantallaUno extends StatelessWidget {
  const PantallaUno({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        title: const Text("Pantalla: 1"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          onPressed: (){
            Navigator.push(
              context, 
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const PantallaDos(),
                transitionDuration: const Duration(seconds: 1), // 👈 duración de 3 segundos
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0); // empieza fuera de la pantalla (derecha)
                  const end = Offset.zero;        // termina en posición normal
                  const curve = Curves.easeInOut; // curva de animación

                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            );
          },
          child: const Text("Ir a Pantalla 2"),
        ), 
      ),
    );
  }
}

// Pantalla dos
class PantallaDos extends StatelessWidget {
  const PantallaDos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      appBar: AppBar(
        title: const Text("Pantalla 2"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              }, 
              child: const Text("Volver a Pantalla 1")
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => const PantallaTres(),
                    transitionDuration: const Duration(seconds: 1), // 👈 duración de 3 segundos
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0); // empieza fuera de la pantalla (derecha)
                      const end = Offset.zero;        // termina en posición normal
                      const curve = Curves.easeInOut; // curva de animación

                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: const Text('Ir a Pantalla 3'),
            ),
          ],
        )  
      )
    );
  }
}

// Pantalla tres
class PantallaTres extends StatelessWidget {
  const PantallaTres({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text("Pantalla 3"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          }, 
          child: const Text("Volver a Pantalla 2")
        ),
      )
    );
  }
}