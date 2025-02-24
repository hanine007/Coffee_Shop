import 'package:flutter/material.dart';
import 'package:myapp/datamanger.dart';
import 'package:myapp/offerpages.dart';
import 'package:myapp/Orderpages.dart';
import 'package:myapp/Menupages.dart';

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
          seedColor: const Color.fromARGB(255, 96, 59, 45), // Marron principal
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
  int selectedIndex = 0;
  var data = Datamanger();

  // Liste des pages associées aux onglets
  final List<Widget> pages = [
    //Liste de pages[]
    // const Center(child: Text("Menu Page", style: TextStyle(fontSize: 20))),
    const Menupages(),
    const Offerpages(),
    const orderpages(),
    //const Center(child: Text("Order Page", style: TextStyle(fontSize: 20))),
  ];

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Image.asset('images/logo.png', height: 40),
      ),
      body: pages[selectedIndex], // Affiche la page correspondante

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTabTapped, // Met à jour l'onglet sélectionné
        selectedItemColor: Colors.amber.shade400,
        unselectedItemColor: Colors.brown.shade300,
        items: const [
          BottomNavigationBarItem(label: "Menu", icon: Icon(Icons.coffee)),
          BottomNavigationBarItem(
            label: "Offers",
            icon: Icon(Icons.local_offer),
          ),
          BottomNavigationBarItem(
            label: "Order",
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
    );
  }
}
