import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ContainerCambio(),
    debugShowCheckedModeBanner: false,
  ));
}

class ContainerCambio extends StatefulWidget {
  const ContainerCambio({super.key});

  @override
  State<ContainerCambio> createState() => _ContainerCambioState();
}

class _ContainerCambioState extends State<ContainerCambio> {
  double size = 100; // tamaño inicial
  Color color = Colors.teal; // color inicial
  String texto = 'Valor inicial'; // texto inicial
  String emoji = '😀'; // emoji inicial
  Color colorTexto = Colors.white; // texto del color

  void incrementar() {
    setState(() {
      if (size < 300) {
        size += 20;
        texto = 'Estoy creciendo';
        emoji = '🥳';
        color = (color == Colors.yellow) ? Colors.teal : Colors.yellow;
        colorTexto = (colorTexto == Colors.white) ? Colors.black : Colors.white;
      }
    });
  }

  void decrementar() {
    setState(() {
      if (size > 100) {
        size -= 20;
        texto = 'Estoy encogiendo';
        emoji = '😒';
        color = (color == Colors.yellow) ? Colors.teal : Colors.yellow;
        colorTexto = (colorTexto == Colors.white) ? Colors.black : Colors.white;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Limbert Olmos Mercado - Práctica 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Container Dinámico',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15), // Espacio entre el nombre y el container
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: size,
              height: size,
              color: color,
              child: Center(
                child: Column(   
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      emoji,
                      style: const TextStyle(fontSize: 24),
                    ),
                    Text(
                      texto,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: colorTexto,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: size == 300 ? null : incrementar,
                  child: const Text("+"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: size == 100 ? null : decrementar,
                  child: const Text("-"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
