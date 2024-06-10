import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screen1/controller/songController.dart';
import 'package:screen1/view/player_dis.dart';

class SeeMore extends StatefulWidget {
  const SeeMore({super.key});

  @override
  State<SeeMore> createState() => _SeeMoreState();
}

class _SeeMoreState extends State<SeeMore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        // reverse: true,
        child: SizedBox(
          width: 400,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: Provider.of<SongController>(context).songList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PlayerDisplay(
                          songObj: Provider.of<SongController>(context)
                              .songList[index]);
                    }));
                  },
                  child: SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          Provider.of<SongController>(context)
                              .songList[index]
                              .image,
                          height: 72,
                          width: 67,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Provider.of<SongController>(context)
                                  .songList[index]
                                  .songName,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 13),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "   ${Provider.of<SongController>(context).songList[index].year} *",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                Text(
                                  Provider.of<SongController>(context)
                                      .songList[index]
                                      .author,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 218, 214, 214),
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 140,
                        ),
                        const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
