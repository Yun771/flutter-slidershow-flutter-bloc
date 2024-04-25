import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_boarding/widget/slide_show.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Stack(
          children: [
            Slideshow(
              primaryBullet: 20,
              secondaryBullet: 10,
              primaryColor: Colors.green,
              secondaryColor: Colors.grey,
              slides: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/1.svg',
                        height: 300,
                      ),
                      const Text(
                          'Tempor non duis id voluptate tempor eu fugiat aliqua commodo. Consequat laborum qui nisi magna ex incididunt amet deserunt labore. Minim qui culpa reprehenderit cupidatat amet.'),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/2.svg'),
                      const Text(
                          'Tempor non duis id voluptate tempor eu fugiat aliqua commodo. Consequat laborum qui nisi magna ex incididunt amet deserunt labore. Minim qui culpa reprehenderit cupidatat amet.'),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/3.svg'),
                      const Text(
                          'Tempor non duis id voluptate tempor eu fugiat aliqua commodo. Consequat laborum qui nisi magna ex incididunt amet deserunt labore. Minim qui culpa reprehenderit cupidatat amet.'),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/4.svg'),
                      const Text(
                          'Tempor non duis id voluptate tempor eu fugiat aliqua commodo. Consequat laborum qui nisi magna ex incididunt amet deserunt labore. Minim qui culpa reprehenderit cupidatat amet.'),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/5.svg'),
                      const Text(
                          'Tempor non duis id voluptate tempor eu fugiat aliqua commodo. Consequat laborum qui nisi magna ex incididunt amet deserunt labore. Minim qui culpa reprehenderit cupidatat amet.'),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              right: 0,
              child: Ink(
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Salir'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
