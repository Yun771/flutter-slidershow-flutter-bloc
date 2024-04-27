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
        body: const OnBoarding(),
      ),
    );
  }
}

class OnBoarding extends StatefulWidget {
  const OnBoarding({
    super.key,
  });

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  bool _isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Slideshow(
          primaryBullet: 20,
          secondaryBullet: 10,
          primaryColor: Colors.green,
          secondaryColor: Colors.grey,
          onFinished: () {
            setState(() {
              _isFinished = true;
            });
          },
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
        if (_isFinished)

          // Create widget con la animación de saltar
          const Positioned(
            bottom: 20,
            right: 0,
            child: ExitedButtonOnBoarding(),
          ),
      ],
    );
  }
}

class ExitedButtonOnBoarding extends StatefulWidget {
  const ExitedButtonOnBoarding({
    super.key,
  });

  @override
  State<ExitedButtonOnBoarding> createState() => _ExitedButtonOnBoardingState();
}

class _ExitedButtonOnBoardingState extends State<ExitedButtonOnBoarding>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => Transform.scale(
        scale: 1 + _animation.value * 0.1,
        child: child,
      ),
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
    );
  }
}
