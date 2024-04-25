import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_boarding/cubit/slideshow_cubit.dart';

class Slideshow extends StatelessWidget {
  const Slideshow({
    super.key,
    required this.slides,
    this.dotsTop = false,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.primaryBullet = 12,
    this.secondaryBullet = 12,
  });

  final List<Widget> slides;
  final bool dotsTop;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SlideshowCubit(),
      child: SafeArea(
        child: Center(
          child: Builder(builder: (context) {
            context.read<SlideshowCubit>().setState(
                  primaryColor: primaryColor,
                  secondaryColor: secondaryColor,
                  primaryBullet: primaryBullet,
                  secondaryBullet: secondaryBullet,
                );
            return _BuildStructureSlideshow(
              slides: slides,
              dotsTop: dotsTop,
            );
          }),
        ),
      ),
    );
  }
}

class _BuildStructureSlideshow extends StatelessWidget {
  const _BuildStructureSlideshow({
    required this.slides,
    required this.dotsTop,
  });
  final bool dotsTop;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (dotsTop) _Dots(dots: slides.length),
        Expanded(child: _Slides(slides: slides)),
        if (!dotsTop) _Dots(dots: slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int dots;

  const _Dots({required this.dots});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlideshowCubit, SlideshowState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              dots,
              (index) => _Dot(index: index),
            ),
          ),
        );
      },
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final state = context.read<SlideshowCubit>().state;
    double tamano;
    Color color;

    if (state.currentPage >= index - 0.5 && state.currentPage <= index + 0.5) {
      tamano = state.primaryBullet;
      color = state.primaryColor;
    } else {
      tamano = state.secondaryBullet;
      color = state.secondaryColor;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: tamano,
      height: tamano,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides({required this.slides});

  @override
  State<_Slides> createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final PageController pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      context.read<SlideshowCubit>().currentPage(pageController.page ?? 0);
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: widget.slides.map((slide) => _Slide(slide: slide)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide({required this.slide});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}
