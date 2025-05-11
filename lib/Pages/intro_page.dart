import 'package:flutter/material.dart';
import 'package:vehicall/Pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              //LoGo
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset('lib/images/Logo_Final.png', height: 100),
              ),

              const SizedBox(height: 2),

              //text
              const Text(
                'VehiCall',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xFF000000),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 13),

              //subText
              const Text(
                '"Drive Your Way — Rent the Ride, Skip the Hassle."',
                style: TextStyle(fontSize: 13, color: Colors.black),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 400),

              GestureDetector(
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(18.10),
                      child: Text(
                        'Rent Now!',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
