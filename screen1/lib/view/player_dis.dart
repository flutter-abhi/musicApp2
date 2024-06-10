import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:screen1/controller/songController.dart';

import 'package:screen1/model/songModel.dart';
import "package:linear_progress_bar/linear_progress_bar.dart";
import 'package:audioplayers/audioplayers.dart';

final player = AudioPlayer();
bool isplaying = true;

// ignore: must_be_immutable
class PlayerDisplay extends StatefulWidget {
  SongModel songObj;

  PlayerDisplay({super.key, required this.songObj});

  @override
  State<PlayerDisplay> createState() => _PlayerDisplayState();
}

class _PlayerDisplayState extends State<PlayerDisplay> {
  void initState() {
    player.play(AssetSource(widget.songObj.music));
    isplaying = true;

    super.initState();
  }

  void next() async {
    if (isplaying) {
      await player.play(AssetSource(widget.songObj.music));
    } else {
      await player.pause();
    }
    setState(() {});
  }

  void playSong() async {
    if (isplaying) {
      await player.pause();
    } else {
      await player.play(AssetSource(widget.songObj.music));
    }

    isplaying = !isplaying;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                widget.songObj.image,
                height: 520,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                  top: 430,
                  left: 120,
                  child: Column(
                    children: [
                      Text(
                        widget.songObj.songName,
                        style: const TextStyle(
                            fontSize: 33,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(230, 154, 21, 1)),
                      ),
                      Text(
                        widget.songObj.author,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text(
                  "Dynamic Warmup |",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Text(
                  "${widget.songObj.duration} min",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LinearProgressBar(
              minHeight: 6,
              maxSteps: 6,

              progressType:
                  LinearProgressBar.progressTypeLinear, // Use Linear progress
              currentStep: 1,
              progressColor: const Color.fromRGBO(230, 154, 21, 1),

              backgroundColor: Colors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.shuffle,
                color: Colors.white,
                size: 35,
              ),
              GestureDetector(
                onTap: () async {
                  widget.songObj =
                      Provider.of<SongController>(context, listen: false)
                          .back(widget.songObj);
                  next();
                },
                child: const Icon(
                  Icons.skip_previous_rounded,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              GestureDetector(
                onTap: () {
                  log("$isplaying");
                  playSong();
                },
                child: Icon(
                  (!isplaying)
                      ? Icons.play_circle_fill
                      : Icons.pause_circle_filled_outlined,
                  color: Colors.white,
                  size: 60,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  widget.songObj =
                      Provider.of<SongController>(context, listen: false)
                          .next(widget.songObj);

                  next();
                },
                child: const Icon(
                  Icons.skip_next_rounded,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              const Icon(
                Icons.volume_up_rounded,
                color: Colors.white,
                size: 35,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_outlined,
            ),
            label: 'favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'profile',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: const Color.fromRGBO(248, 162, 69, 1),
        onTap: onItemTapped,
      ),
    );
  }

  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
