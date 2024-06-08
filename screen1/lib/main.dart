import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screen1/controller/songController.dart';
import 'package:screen1/view/homeDis.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return SongController();
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeDis(),
      ),
    );
  }
}
