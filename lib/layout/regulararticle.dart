import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'footer.dart';
import 'header.dart';
import '/main.dart';

class Article {
  final String titleKey;
  final String contentKey;
  final String summaryKey;
  final String link;
  final String imgPath;
  final List<String> imagePaths;

  const Article({
    required this.imgPath,
    required this.titleKey,
    required this.contentKey,
    required this.summaryKey,
    required this.link,
    required this.imagePaths,
  });
}

class InformationPages extends StatefulWidget {
  final Article article;
  final Function(Locale) onLanguageChanged;
  final Locale locale;

  const InformationPages({
    super.key,
    required this.article,
    required this.onLanguageChanged,
    required this.locale,
  });

  @override
  _InformationPagesState createState() => _InformationPagesState();
}

class _InformationPagesState extends State<InformationPages> {
  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
        if (_pageController.hasClients) {
          if (_pageController.page == widget.article.imagePaths.length - 1) {
            _pageController.animateToPage(
              0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          } else {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  String getTitle(BuildContext context, String titleKey) {
    switch (titleKey) {
      case 'titrearticleslidemain0':
        return AppLocalizations.of(context)?.titrearticleslidemain0 ?? '';
      case 'titrearticleslidemain1':
        return AppLocalizations.of(context)?.titrearticleslidemain1 ?? '';
      case 'titrearticleslidemain2':
        return AppLocalizations.of(context)?.titrearticleslidemain2 ?? '';
      default:
        return '';
    }
  }

  String getContent(BuildContext context, String summaryKey) {
    switch (summaryKey) {
      case 'completeeventarticle0':
        return AppLocalizations.of(context)?.completeeventarticle0 ?? '';
      case 'completeeventarticle1':
        return AppLocalizations.of(context)?.completeeventarticle1 ?? '';
      case 'completeeventarticle2':
        return AppLocalizations.of(context)?.completeeventarticle2 ?? '';
      default:
        return '';
    }
  }

@override
Widget build(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  int increasedHeight = screenHeight.round() * 2;

  return Scaffold(
    body: SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: increasedHeight.toDouble(),
        ),
        child: SizedBox(
          height: increasedHeight.toDouble(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Header(
                  onLanguageChanged: (Locale newLocale) {
                    MyApp.of(context)?.setLocale(newLocale);
                    onComplete(newLocale);
                  },
                  locale: const Locale('fr', 'FR'),
                  width: double.infinity,
                  height: 400,
                ),
                SizedBox(
                  height: 400,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.article.imagePaths.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        widget.article.imagePaths[index],
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                ),
              Expanded(
                child: ListView(
                  children: [
                    Card(
                      margin: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 30.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  getTitle(context, widget.article.titleKey),
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 100.0),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 350.0),
                                  child: Text(
                                    textAlign: TextAlign.justify,
                                    getContent(context, widget.article.summaryKey),
                                    style: const TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Footer(locale: const Locale('fr','FRA'), onLanguageChanged: (Locale ) {  },),
                ),
            ],
          ),
        ),
      ),
    ),
    
  );
}

  void onComplete(Locale newLocale) {}
}
