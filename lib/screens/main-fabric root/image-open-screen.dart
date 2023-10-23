import 'package:flutter/material.dart';

class ImageOpenScreen extends StatefulWidget {
  final String image;
  const ImageOpenScreen({super.key, required  this.image});

  @override
  State<ImageOpenScreen> createState() => _ImageOpenScreenState();
}

class _ImageOpenScreenState extends State<ImageOpenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: GestureDetector(
        onTap: () {},
        child: Image.asset(
         widget.image,height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}
