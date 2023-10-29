import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> _images = [

    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFn052gmIzkpsU3jDfodyJ5BXTj-N0LfeKYQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRk-hDQQ96R3XlUa-v0HXMqrX29MdYyMB9wZw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaQaGukw-qq9TePFjniLxsym0dEqX6VtgRWA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-ndzKZbHHCiATGYqN8YaRcK7k26PIN2NPzA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT97Kq9H_rlfMJpEJsq_Zb3LFngQ0XNdjIlZg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKXnQQDDCe9QfQVi_Dgy-CzkL_xpuHAMm28A&usqp=CAU",

    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThKVKcgVUcBr4OzZUkYCigRBIN_iWW80vxow&usqp=CAU",

  ];

  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < _images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Automatic Image Carousel',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Automatic Image Carousel'),
        ),
        body: Center(
          child: SizedBox(
            height: 400,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _images.length,
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  _images[index],
                  fit: BoxFit.cover,
                );
              },
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}