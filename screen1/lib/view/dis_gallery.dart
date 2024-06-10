import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:screen1/controller/songController.dart';
import 'package:screen1/view/player_dis.dart';
import 'package:screen1/view/see_more.dart';

class DisGallery extends StatefulWidget {
  const DisGallery({super.key});

  @override
  State<DisGallery> createState() => _DisGalleryState();
}

class _DisGalleryState extends State<DisGallery> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 450,
              enlargeCenterPage: true,
              autoPlay: true,
              disableCenter: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 1,
            ),
            items: Provider.of<SongController>(context)
                .subscribeGallery
                .map((item) => SizedBox(
                        child: Stack(
                      children: [
                        Image.asset(
                          item["image"],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 340,
                        ),
                        Positioned(
                            top: 210,
                            left: 20,
                            child: Text(
                              item["title"],
                              style: const TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )),
                        Positioned(
                          top: 260,
                          left: 23,
                          child: Container(
                            alignment: Alignment.center,
                            height: 37,
                            width: 127,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: const Color.fromRGBO(255, 46, 0, 1),
                                borderRadius: BorderRadius.circular(19)),
                            child: const Text(
                              "Subscribe",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    )))
                .toList(),
          ),
          Positioned(
            top: 350,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      "Discography",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.red),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SeeMore();
                        }));
                      },
                      child: const Text(
                        "see all",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(248, 162, 69, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 390,
            child: SizedBox(
              height: 250,
              width: 400,
              child: ListView.separated(
                  physics: const ScrollPhysics(parent: null),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PlayerDisplay(
                              songObj: Provider.of<SongController>(context)
                                  .discog[index]);
                        }));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              Provider.of<SongController>(context)
                                  .discog[index]
                                  .image,
                              height: 140,
                              width: 119,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              Provider.of<SongController>(context)
                                  .discog[index]
                                  .songName,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            Text(
                              "${Provider.of<SongController>(context).discog[index].year}",
                              style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 25,
                    );
                  },
                  itemCount:
                      Provider.of<SongController>(context).discog.length),
            ),
          ),
          const Positioned(
              top: 570,
              child: Text(
                "Popular songs",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              )),

          //popular songs Listview
          Positioned(
              top: 600,
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 120,
                  width: 400,
                  child: ListView.builder(
                      itemCount:
                          Provider.of<SongController>(context).songList.length,
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
                            height: 75,
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
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          Provider.of<SongController>(context)
                                              .songList[index]
                                              .author,
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 218, 214, 214),
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
              ))
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
}
