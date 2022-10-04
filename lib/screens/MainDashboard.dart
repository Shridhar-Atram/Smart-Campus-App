import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class MySlider extends StatefulWidget {
  @override
  _MySliderState createState() => _MySliderState();
  Info Create() => Info();
}

class _MySliderState extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: ListView(
          children: [
            SizedBox(
              height: 400.0,
              width: double.infinity,
              child: Carousel(
                dotSize: 6.0,
                dotSpacing: 15.0,
                dotPosition: DotPosition.bottomCenter,
                images: [
                  Image.asset('assets/images/1.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/2.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/3.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/4.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/5.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/6.jpg', fit: BoxFit.cover),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text:
            'Government College of Engineering, Karad is an autonomous technical institute in the Indian state of Maharashtra. It was established in 1960 and is affiliated to the Shivaji University with an autonomous status under the UGC. The autonomy was granted by the UGC ',
        style: DefaultTextStyle.of(context).style,
        children: const <TextSpan>[
          TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: ' world!'),
        ],
      ),
    );
  }
}
