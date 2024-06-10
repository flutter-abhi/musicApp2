import 'package:flutter/material.dart';
import 'package:screen1/model/songModel.dart';

class SongController extends ChangeNotifier {
  List<SongModel> songList = [
    SongModel(
        songName: "We Are Chaos",
        image: "assets/mus1.jpeg",
        year: 2023,
        author: "Easy Living",
        duration: 4,
        music: "music/mus1.mp3"),
    SongModel(
        songName: "Smile",
        image: "assets/mus2.jpeg",
        year: 2020,
        author: "Berrechid",
        duration: 3,
        music: "music/mus2.mp3"),
    SongModel(
        songName: "We Are Chaos",
        image: "assets/anime4.png",
        year: 2023,
        author: "Easy Living",
        duration: 4,
        music: "music/mus3.mp3"),
    SongModel(
        songName: "Dead inside",
        image: "assets/dis1.png",
        year: 2020,
        author: "Easy Living",
        duration: 4,
        music: "music/mus4.mp3"),
    SongModel(
        songName: "Alone",
        image: "assets/dis3.jpeg",
        year: 2023,
        author: "Easy Living",
        duration: 3,
        music: "music/mus5.mp3"),
    SongModel(
        songName: "Heartless ",
        image: "assets/dis2.jpeg",
        year: 2022,
        author: "Easy Living",
        duration: 4,
        music: "music/mus6.mp3"),
    SongModel(
        songName: "Dead inside",
        image: "assets/anime3.jpg",
        year: 2020,
        author: "Easy Living",
        duration: 4,
        music: "music/mus7.mp3"),
    SongModel(
        songName: "Alone",
        image: "assets/anime4.png",
        year: 2023,
        author: "Easy Living",
        duration: 3,
        music: "music/mus8.mp3"),
    SongModel(
        songName: "Heartless ",
        image: "assets/anime.jpg",
        year: 2022,
        author: "Easy Living",
        duration: 4,
        music: "music/mus9.mp3"),
    SongModel(
        songName: "Dead inside",
        image: "assets/anime2.jpg",
        year: 2020,
        author: "Easy Living",
        duration: 4,
        music: "music/mus10.mp3"),
  ];

  List<SongModel> discog = [
    SongModel(
        songName: "Dead inside",
        image: "assets/dis1.png",
        year: 2020,
        author: "Easy Living",
        duration: 4,
        music: "music/mus7.mp3"),
    SongModel(
        songName: "Alone",
        image: "assets/dis3.jpeg",
        year: 2023,
        author: "Easy Living",
        duration: 3,
        music: "music/mus8.mp3"),
    SongModel(
        songName: "Heartless ",
        image: "assets/dis2.jpeg",
        year: 2022,
        author: "Easy Living",
        duration: 4,
        music: "music/mus9.mp3"),
    SongModel(
        songName: "Dead inside",
        image: "assets/dis1.png",
        year: 2020,
        author: "Easy Living",
        duration: 4,
        music: "music/mus10.mp3"),
  ];
  SongModel next(SongModel obj) {
    int index = songList.indexOf(obj);
    if (index < songList.length - 1) {
      return songList[index + 1];
    } else {
      return songList[0];
    }
  }

  SongModel back(SongModel obj) {
    int index = songList.indexOf(obj);
    if (index > 0) {
      return songList[index - 1];
    } else {
      return songList[songList.length - 1];
    }
  }

  List subscribeGallery = [
    {"image": "assets/gallerybg.png", "title": "A.L.O.N.E"},
    {"image": "assets/anime.jpg", "title": "one love"},
    {"image": "assets/anime2.jpg", "title": "masum"}
  ];
  SongController();
}
