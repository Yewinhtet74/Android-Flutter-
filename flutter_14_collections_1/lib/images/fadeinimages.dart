import 'package:flutter/material.dart';

class FadeInImages extends StatefulWidget {
  const FadeInImages({super.key});

  @override
  State<FadeInImages> createState() => _FadeInImagesState();
}

class _FadeInImagesState extends State<FadeInImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: FadeInImage.assetNetwork(
          height: double.infinity,
          fadeInDuration: Duration(seconds: 1),
          fadeInCurve: Curves.easeIn,
          placeholder: 'assets/bp.jpg', 
          image: 'https://www.pixelstalk.net/wp-content/uploads/images6/Blackpink-Wallpaper-Free-Download.jpg',
          fit: BoxFit.cover
          ,
        ),
      ),
    );
  }
}