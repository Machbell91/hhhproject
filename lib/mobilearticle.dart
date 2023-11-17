import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'layout/footer.dart';
import 'layout/header.dart';
import 'main.dart';

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

class Artika2 extends StatefulWidget {
  final double maxHeight;
  final Locale locale;

  const Artika2({Key? key, this.maxHeight = double.infinity, required this.locale, required Null Function(dynamic locale) onLanguageChanged})
      : super(key: key);

  @override
  State<Artika2> createState() => _ArtikaState();

  static _ArtikaState? of(BuildContext context) {
    return context.findAncestorStateOfType<_ArtikaState>();
  }

  void onLanguageChanged(Locale newLocale) {}
}

class _ArtikaState extends State<Artika2> {
  final List<Article> articles = [
    const Article(
      imgPath: 'assets/articlepictures/franco/1.jpeg',
      titleKey: 'titrearticleslidemain0',
      contentKey: 'textearticleslidemain0',
      summaryKey: 'completeeventarticle0',
      link: 'https://www.example.com/article1',
      imagePaths: [
        "assets/articlepictures/franco/2.jpeg",
        "assets/articlepictures/franco/3.jpeg",
        "assets/articlepictures/franco/4.jpeg",
        "assets/articlepictures/franco/5.jpeg",
        "assets/articlepictures/franco/6.jpeg",
        "assets/articlepictures/franco/7.jpeg",
        "assets/articlepictures/franco/8.jpeg",
        "assets/articlepictures/franco/9.jpeg",
        "assets/articlepictures/franco/10.jpeg",
        "assets/articlepictures/franco/11.jpeg",
        "assets/articlepictures/franco/12.jpeg",
        "assets/articlepictures/franco/13.jpeg",
        "assets/articlepictures/franco/14.jpeg",
        "assets/articlepictures/franco/15.jpeg",
        "assets/articlepictures/franco/16.jpeg",
        "assets/articlepictures/franco/17.jpeg",
      ],
    ),
    const Article(
      imgPath: 'assets/articlepictures/grulac2/1.jpeg',
      titleKey: 'titrearticleslidemain1',
      contentKey: 'textearticleslidemain1',
      summaryKey: 'completeeventarticle1',
      link: 'https://www.example.com/article2',
      imagePaths: [
        "assets/articlepictures/grulac2/1.jpeg",
        "assets/articlepictures/grulac2/2.jpeg",
      ],
    ),
    const Article(
      imgPath: 'assets/articlepictures/Kidsforest/1.jpeg',
      titleKey: 'titrearticleslidemain2',
      contentKey: 'textearticleslidemain2',
      summaryKey: 'completeeventarticle2',
      link: 'https://www.example.com/article3',
      imagePaths: [
        "assets/articlepictures/Kidsforest/1.jpeg",
        "assets/articlepictures/Kidsforest/2.jpeg",
        "assets/articlepictures/Kidsforest/3.jpeg",
      ],
    ),
  ];

  void onLanguageChanged(Locale newLocale) {
    setState(() {
    });
  }

  void onComplete(Locale newLocale) {
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  for (var article in articles)
                    Card(
                      margin: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            article.imgPath,
                            fit: BoxFit.cover,
                            height: 200, 
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  getTitle(context, article.titleKey),
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  getContent(context, article.contentKey),
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                                const SizedBox(height: 8.0),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ArticleDetailPage2(
                                          article: article,
                                          onLanguageChanged:
                                              onLanguageChanged,
                                          locale: widget.locale,
                                        ),
                                      ),
                                    );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(
                                            255, 217, 146, 201)),
                                  ),
                                  child: Text(
                                    AppLocalizations.of(context)?.lirePlus ?? '',
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
          );
        } else {
          return Scaffold(
            body: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 800.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Header(
                      onLanguageChanged: (Locale newLocale) {
                        onLanguageChanged(newLocale);
                      },
                      locale: widget.locale,
                      width: double.infinity,
                      height: 400,
                    ),
                    for (var article in articles)
                      Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 400,
                              child: PageView.builder(
                                controller: PageController(),
                                itemCount: article.imagePaths.length,
                                itemBuilder: (context, index) {
                                  return Image.asset(
                                    article.imagePaths[index],
                                    fit: BoxFit.cover,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const SizedBox(height: 30.0),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 40.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                getTitle(
                                                    context, article.titleKey),
                                                style: const TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 100.0),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 370.0),
                                                child: Text(
                                                  textAlign: TextAlign.justify,
                                                  getContent(context,
                                                      article.summaryKey),
                                                  style: const TextStyle(
                                                      fontSize: 16.0),
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
                          ],
                        ),
                      ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Footer(
                        locale: const Locale('fr', 'FRA'),
                        onLanguageChanged: (Locale) {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
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

  String getContent(BuildContext context, String contentKey) {
    switch (contentKey) {
      case 'textearticleslidemain0':
        return AppLocalizations.of(context)?.textearticleslidemain0 ?? '';
      case 'textearticleslidemain1':
        return AppLocalizations.of(context)?.textearticleslidemain1 ?? '';
      case 'textearticleslidemain2':
        return AppLocalizations.of(context)?.textearticleslidemain2 ?? '';
      default:
        return '';
    }
  }
}

class ArticleDetailPage2 extends StatefulWidget {
  final Article article;
  final Function(Locale) onLanguageChanged;
  final Locale locale;

  const ArticleDetailPage2({
    Key? key,
    required this.article,
    required this.onLanguageChanged,
    required this.locale,
  }) : super(key: key);

  @override
  _ArticleDetailPage2State createState() => _ArticleDetailPage2State();
}

class _ArticleDetailPage2State extends State<ArticleDetailPage2> {

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
  body: LayoutBuilder(
    builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return Column(
          children: [
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
              child: SingleChildScrollView(
                child: Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          getTitle(context, widget.article.titleKey),
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,                          
                          ),
                        ),
                        const SizedBox(height: 100.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            textAlign: TextAlign.justify,
                            getContent(context, widget.article.summaryKey),
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      } else {
          return SingleChildScrollView(
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
                                        textAlign: TextAlign.justify,
                                        getTitle(context, widget.article.titleKey),
                                        style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 100.0),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 370.0),
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
          );
        }
      },
    ),
  );
}

void onComplete(Locale newLocale) {}

}
