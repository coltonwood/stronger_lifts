import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stronger_lifts/screens/splash/components/carousel-card.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  final controller = PageController(
    initialPage: 0,
    viewportFraction: 0.8,
  );

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 350,
        child: PageView(
          controller: controller,
          children: [
            CarouselCard(
              title: 'Hello! 👋',
              description: 'this is a description',
            ),
            CarouselCard(
              title: 'Take Action',
              description: 'this is a description',
            ),
            CarouselCard(
              title: 'Earn',
              description: 'this is a description',
            ),
            CarouselCard(
              title: 'Redeem',
              description: 'this is a description',
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 20),
        child: SmoothPageIndicator(
          controller: controller,
          count: 4,
          effect: WormEffect(
            activeDotColor: Colors.white,
            dotColor: Colors.green[800],
          ),
        ),
      ),
    ]);
  }
}
