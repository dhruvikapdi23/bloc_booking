import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import '../../core/helper/helper.dart';

class CustomCarouselSlider extends StatefulWidget {
  final List<dynamic> data;
  final String type;
  final double width;
  final double height;

  const CustomCarouselSlider({
    super.key,
    required this.data,
    required this.type,
    required this.width,
    required this.height,
  });

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int _currentPosition = 0;

  void _updatePosition(int position) {
    setState(() => _currentPosition = position);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            height: widget.height,
            viewportFraction: .9,
            enlargeFactor: 0,
            enlargeCenterPage: false,
            autoPlay: true,
            autoPlayCurve: Curves.easeIn,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            onPageChanged: (index, reason) => _updatePosition(index),
          ),
          items: widget.data.map((url) {
            dynamic imagePath = url;

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              //margin: const EdgeInsets.symmetric(horizontal: 16),
              child: widget.type == 'assets'
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        imagePath,
                        width: widget.width,
                        height: widget.height,
                        fit: BoxFit.fill,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.memory(
                        getMemoryImage(imagePath),
                        width: widget.width,
                        height: widget.height,
                        fit: BoxFit.cover,
                      ),
                    ),
            );
          }).toList(),
        ),
        Positioned(
          bottom: 20,
          right: 0,
          left: 0,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: DotsIndicator(
                dotsCount: widget.data.length,
                position: _currentPosition,
                decorator: const DotsDecorator(
                  spacing: EdgeInsets.all(2),
                  size: Size.square(6),
                  activeSize: Size(18, 6),
                  activeShape: CircleBorder(),
                  activeColor: Colors.white,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
