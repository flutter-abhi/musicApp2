import 'package:flutter/material.dart';
import 'package:screen1/view/dis_gallery.dart';

class HomeDis extends StatefulWidget {
  const HomeDis({super.key});

  @override
  State<HomeDis> createState() => _HomeDisState();
}

class _HomeDisState extends State<HomeDis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
          ),
          Image.asset("assets/homebg.png"),
          const Positioned(
            top: 300,
            child: Padding(
              padding: EdgeInsets.all(60.0),
              child: SizedBox(
                height: 300,
                width: 300,
                child: Text(
                  "Dancing between The shadows  Of rhythm ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Positioned(
            top: 600,
            left: 47,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const DisGallery();
                }));
              },
              child: Container(
                alignment: Alignment.center,
                height: 47,
                width: 260,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 46, 0, 1),
                    borderRadius: BorderRadius.circular(19)),
                child: const Text(
                  "Get started",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Positioned(
            top: 660,
            left: 47,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const DisGallery();
                }));
              },
              child: Container(
                alignment: Alignment.center,
                height: 47,
                width: 260,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(255, 46, 0, 1),
                    ),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(19)),
                child: const Text(
                  "Continue with Email",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 46, 0, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Positioned(
              top: 716,
              left: 50,
              child: Container(
                alignment: Alignment.center,
                height: 47,
                width: 260,
                child: const Text(
                  "by continuing you agree to terms of services and Privacy policy",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(203, 200, 200, 1),
                      fontWeight: FontWeight.w600),
                ),
              ))
        ],
      ),
    );
  }
}
