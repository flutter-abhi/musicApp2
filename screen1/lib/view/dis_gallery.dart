import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:screen1/controller/songController.dart';
import 'package:carousel_slider/carousel_slider.dart';
class DisGallery extends StatefulWidget {
  const DisGallery({super.key});

  @override
  State<DisGallery> createState() => _DisGalleryState();
}

class _DisGalleryState extends State<DisGallery> {
  List imgList = [
    "assets/gallerybg.png",
    "assets/homebg.png",
    "assets/gallerybg.png"
  ];
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
                          height: 367,
                        ),
                        Positioned(
                            top: 225,
                            left: 20,
                            child: Text(
                              item["title"],
                              style: const TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )),
                        Positioned(
                          top: 280,
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
          const Positioned(
            top: 400,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Discography",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: 235,
                  ),
                  Text("see all",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(248, 162, 69, 1))),
                ],
              ),
              
            ),
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
}
