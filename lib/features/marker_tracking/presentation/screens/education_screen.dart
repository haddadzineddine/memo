import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:untitled/features/marker_tracking/presentation/screens/home_screen.dart';

class EducationScreen extends StatefulWidget {
  List<CameraDescription>? cameras;
  EducationScreen({Key? key, required this.cameras}) : super(key: key);

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  late List<CameraDescription> _cameras = widget.cameras!;

  final List<List<String>> imgList = [
    [
      "assets/images/haz_tooth.png",
      "إنه وقت غسل الأسنان",
      "شاهد ميمو كيف يغسل أسنانه"
    ],
    [
      "assets/images/yaghsel_fi_snanou.png",
      "إنه وقت غسل الأسنان",
      "شاهد ميمو كيف يغسل أسنانه"
    ],
    ["assets/images/jumping2.png", "ميمو سعيد 😁", ""],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 48, bottom: 24, left: 12, right: 12),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                    image: AssetImage('assets/images/avatar.png'),
                    height: 64,
                    width: 64),
                Text(
                  'هيا نتعلم',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: 'poppins',
                      color: Colors.black),
                ),
                Icon(
                  Icons.menu,
                  size: 38,
                )
              ],
            ),
            CarouselSlider(
              options: CarouselOptions(
                  height: 600,
                  autoPlay: true,
                  aspectRatio: 1.0,
                  enlargeCenterPage: false,
                  enableInfiniteScroll: false),
              items: imgList
                  .map((item) => Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 24),
                            child: Column(
                              children: [
                                Text(
                                  item[1].toString(),
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: 'poppins',
                                      color: Colors.black),
                                ),
                                Text(
                                  item[2].toString(),
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      fontFamily: 'poppins',
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 24),
                            width: 150,
                            height: 400,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(item[0].toString()),
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        ],
                      ))
                  .toList(),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(cameras: _cameras)),
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff6FB353)),
                  borderRadius: BorderRadius.circular(36),
                ),
                child: Center(
                  child: Text(
                    'العودة إلى الرئيسية',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xff6FB353),
                      fontFamily: 'poppins',
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
