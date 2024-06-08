import 'package:flutter/material.dart';
import 'package:screen1/model/songModel.dart';

class SongController extends ChangeNotifier {
  List<SongModel> songsList = [];
  List subscribeGallery = [
    {"image": "assets/gallerybg.png", "title": "A.L.O.N.E"},
    {"image": "assets/anime.jpg", "title": "one love"},
    {"image": "assets/anime2.jpg", "title": "masum"}
  ];
  SongController();
}
