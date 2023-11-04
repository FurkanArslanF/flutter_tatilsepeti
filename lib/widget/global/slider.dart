import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tatilsepeti/entity/dummy.dart';

import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SliderWidgetState();
  }
}

class _SliderWidgetState extends State<SliderWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: imgList
              .map((item) => ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                        item["imageUrl"] as String,
                        fit: BoxFit.cover,
                        width: 100.w,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              imgList[_current]["title"] as String,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              imgList[_current]["subtitle"] as String,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )))
              .toList(),
          carouselController: _controller,
          options: CarouselOptions(
            height: 40.w,
            autoPlay: false,
            enlargeCenterPage: false,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 41.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 3.w,
                  height: 3.w,
                  margin: EdgeInsets.symmetric(vertical: 1.w, horizontal: 1.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black.withOpacity(0.3)),
                    color: Colors.blue.withOpacity(_current == entry.key ? 0.5 : 0),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
