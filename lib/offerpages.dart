import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

class Offerpages extends StatelessWidget {
  const Offerpages({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView( // permet de scroller
      children: [
        const Offer(title: "My great Offers", description: "buy me one coffe"),
        const Offer(title: "My great Offers", description: "buy me one coffe"),
        const Offer(title: "My great Offers", description: "buy me one coffe"),
        const Offer(title: "My great Offers", description: "buy me one coffe"),
        const Offer(title: "My great Offers", description: "buy me one coffe"),
      ],
    ); //retourn Offer avec title et description
  }
}

class Offer extends StatelessWidget {
  final String title;
  final String description;

  // Suggested code may be subject to a license. Learn more: ~LicenseLog:2631166862.
  // Suggested code may be subject to a license. Learn more: ~LicenseLog:903314924.
  // Suggested code may be subject to a license. Learn more: ~LicenseLog:3521524211.
  // Suggested code may be subject to a license. Learn more: ~LicenseLog:2338909650.
  // Suggested code may be subject to a license. Learn more: ~LicenseLog:2508969276.
  // Suggested code may be subject to a license. Learn more: ~LicenseLog:2885955329.
  const Offer({
    super.key,
    required this.title,
    required this.description,
  }); // Constructor with required parameters for title and description

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 7,
          color: Colors.amber.shade50,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background.png"),
                fit: BoxFit.cover,
              ),
            ),

            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.amber.shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          description,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.amber.shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
