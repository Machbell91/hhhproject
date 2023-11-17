import 'dart:async';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; 
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';



class AnimatedSlider extends StatefulWidget {
  const AnimatedSlider({super.key, required int height, required int width});

  @override
  _AnimatedSliderState createState() => _AnimatedSliderState();
}

class _AnimatedSliderState extends State<AnimatedSlider> {
  late PageController _pageController;
  late double _currentPage;
  late Timer _timer;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 1,
    );

    _currentPage = _pageController.initialPage.toDouble();

    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 6) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage.toInt(),
        duration: const Duration(milliseconds: 500), 
        curve: Curves.easeInOut,
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.width < 600 ? 250 : 300,
          width: 1300,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: PageView.builder(
            controller: _pageController,
            itemCount: 7,
            itemBuilder: (context, index) {
              return _buildPage(context, index % 7); 
            },
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page.toDouble();
              });
            },
            allowImplicitScrolling: true,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DotsIndicator(
              dotsCount: 7,
              position: _currentPage.toInt(),
              decorator: const DotsDecorator(
                color: Colors.black87,
                activeColor: Colors.redAccent,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPage(BuildContext context, int index) {
    String imagePath;
    if (index == 0) {
      imagePath = "assets/mainpics/ht.png";
    } else {
      switch (index) {
        case 1:
          imagePath = "assets/mainpics/ile-a-vache_16-16.jpg";
          break;
        case 2:
          imagePath = "assets/mainpics/haitianmenu.webp";
          break;
        case 3:
          imagePath = "assets/mainpics/painting.jpg";
          break;
        case 4:
          imagePath = "assets/mainpics/muzik.jpeg";
          break;
        case 5:
          imagePath = "assets/mainpics/barbancourt.webp";
          break;
        case 6:
          imagePath = "assets/mainpics/sa-vie-est-un-roman.jpg";
          break;
        default:
          imagePath = "";
      }
    }

    return Row(
  children: [
    Image.network(
    imagePath,
    width: MediaQuery.of(context).size.width < 600 ? 250 : null,
    ),
    const SizedBox(width: 30),
Expanded(
  flex: 3,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Text(
          getTitle(context, index),
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: MediaQuery.of(context).size.width < 600 ? 13 : 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const SizedBox(height: 10),
      Container(
        height: 1,
        color: const Color.fromARGB(255, 0, 0, 0),
        width: 100,
      ),
      const SizedBox(height: 30),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Text(
          getText(context, index),
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: MediaQuery.of(context).size.width < 600 ? 11 : 20,
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    ],
  ),
),
],
);

  }

  String getTitle(BuildContext context, int index) {
    switch (index) {
      case 0:
        return AppLocalizations.of(context)!.titreslidemainO;
      case 1:
        return AppLocalizations.of(context)!.titreslidemain1;
      case 2:
        return AppLocalizations.of(context)!.titreslidemain2;
      case 3:
        return AppLocalizations.of(context)!.titreslidemain3;
      case 4:
        return AppLocalizations.of(context)!.titreslidemain4;
      case 5:
        return AppLocalizations.of(context)!.titreslidemain5;
      case 6:
        return AppLocalizations.of(context)!.titreslidemain6;
      default:
        return '';
    }
  }

  String getText(BuildContext context, int index) {
    switch (index) {
      case 0:
        return AppLocalizations.of(context)!.texteslidemainO;
      case 1:
        return AppLocalizations.of(context)!.texteslidemain1;
      case 2:
        return AppLocalizations.of(context)!.texteslidemain2;
      case 3:
        return AppLocalizations.of(context)!.texteslidemain3;
      case 4:
        return AppLocalizations.of(context)!.texteslidemain4;
      case 5:
        return AppLocalizations.of(context)!.texteslidemain5;
      case 6:
        return AppLocalizations.of(context)!.texteslidemain6;
      default:
        return '';
    }
  }
}