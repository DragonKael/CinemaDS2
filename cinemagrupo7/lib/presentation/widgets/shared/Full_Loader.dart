import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Loading...',
      'Please wait',
      'Cargando Peliculas',
      'Cargando Populares',
      'Llamando a tu novia',
      'Preparando canchita',
      'Esto esta demorando mas de lo debido'
    ];

    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere Profavor'),
          const SizedBox(
            height: 10,
          ),
          const CircularProgressIndicator(
            strokeWidth: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder(
              stream: getLoadingMessages(),
              builder: (contex, snapshot) {
                if (!snapshot.hasData) return const Text('Cargando.......');
                return Text(snapshot.data!);
              })
        ],
      ),
    );
  }
}
