import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:math';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MobileHomePage extends StatefulWidget {
  final Function(String) onComplete;
  final BuildContext appContext;
  final Function(Locale) setLocale;
  final Function(int) onLanguageChanged;

  const MobileHomePage({super.key, 
    required this.onComplete,
    required this.appContext,
    required this.setLocale,
    required this.onLanguageChanged,
  });

  @override
  _MobileHomePageState createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  final ValueNotifier<int> _selectedLanguageNotifier = ValueNotifier<int>(0);
  final ValueNotifier<int?> _hoveredFlagNotifier = ValueNotifier<int?>(null);

  final List<String> languages = [
    'Kreyòl',
    'Français',
    'English',
    '日本語',
    '한국어',
    '中国语文',
  ];

  final List<String> languageCodes = [
    'ht',
    'fr',
    'en',
    'ja',
    'ko',
    'zh',
  ];

  late List<String> flagPaths;
  String _randomImagePath = '';

  @override
  void initState() {
    super.initState();

    flagPaths = [
      "assets/mobilepicturehomepage/flaghaiti.png",
      "assets/mobilepicturehomepage/franceflag.png",
      "assets/mobilepicturehomepage/flaguk.png",
      "assets/mobilepicturehomepage/japanflag.png",
      "assets/mobilepicturehomepage/floagcoree.png",
      "assets/mobilepicturehomepage/flagchine.png",
    ];

    final random = Random();
    final imageNumber = random.nextInt(6) + 1;
    _randomImagePath = 'assets/images/image_$imageNumber.png';
  }

  void navigateToCurrentPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NarrowLayout(
          onLanguageChanged: (locale) {
            
          },
          locale: const Locale('fr', 'FR'), 
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(_randomImagePath),
            ValueListenableBuilder<int>(
              valueListenable: _selectedLanguageNotifier,
              builder: (context, value, child) {
                return Text(
                  appLocalizations?.mowbeel ?? '', 
                  locale: Locale(languageCodes[value]),
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    color: Colors.black,
                    letterSpacing: 0.5,
                    height: 1.5,
                  ),
                );
              },
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                children: List.generate(
                  languages.length,
                  (index) => MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (_) {
                      setState(() {
                        _hoveredFlagNotifier.value = index;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        _hoveredFlagNotifier.value = null;
                      });
                    },
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedLanguageNotifier.value = index;
                          MyApp.of(context)?.setLocale(Locale(languageCodes[index]));
                        });
                        Future.delayed(const Duration(seconds: 1), () {
                          navigateToCurrentPage();
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _hoveredFlagNotifier.value == index ? Colors.blueAccent : Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: _hoveredFlagNotifier.value == index ? Colors.blue.withOpacity(0.3) : Colors.transparent,
                        ),
                        child: Image.asset(
                          flagPaths[index],
                          fit: BoxFit.contain,
                          height: 35 / 2,
                          width: 35 / 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                AppLocalizations.of(context)?.bottomrights?? '',
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 13), 
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
