import 'package:flutter/material.dart';
import 'package:myapp/offerpages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 96, 59, 45), // Couleur marron
          brightness: Brightness.light, // Mode clair
        ),
        useMaterial3: true, // Active Material 3
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Theme.of(
              context,
            ).colorScheme.primary, // Utilisation de la couleur principale
        title: Image.asset(
          'images/logo.png',
          height: 40,
        ), // Ajustement de la hauteur du logo si besoin
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(label: "Menu", icon: Icon(Icons.coffee)),
                    BottomNavigationBarItem(label: "Offers", icon: Icon(Icons.local_offer)),
          BottomNavigationBarItem(label: "Order", icon: Icon(Icons.shopping_cart)),

        ],
      ),
      body: Offerpages(),

      // const Center(
      // child: Text("Bienvenue au Coffee Shop !"),
      //),
    );
  }
}
