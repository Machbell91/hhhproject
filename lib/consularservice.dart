import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'layout/footer.dart';
import 'layout/header.dart';
import 'main.dart';

class Article {
  final String titleKey;
  final String summaryKey;
  final String imgPath;

  const Article({
    required this.titleKey,
    required this.summaryKey,
    required this.imgPath,
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


  String getTitle(BuildContext context, String titleKey) {
    switch (titleKey) {
      case 'titreconsulat0':
        return AppLocalizations.of(context)?.titreconsulat0 ?? '';
      case 'titreconsulat1':
        return AppLocalizations.of(context)?.titreconsulat1 ?? '';
      case 'titreconsulat2':
        return AppLocalizations.of(context)?.titreconsulat2 ?? '';
      case 'titreconsulat3':
        return AppLocalizations.of(context)?.titreconsulat3 ?? '';
      case 'titreconsulat4':
        return AppLocalizations.of(context)?.titreconsulat4 ?? '';
      case 'titreconsulat5':
        return AppLocalizations.of(context)?.titreconsulat5 ?? '';
      case 'titreconsulat6':
        return AppLocalizations.of(context)?.titreconsulat6 ?? '';
      case 'titreconsulat7':
        return AppLocalizations.of(context)?.titreconsulat7 ?? '';
      case 'titreconsulat8':
        return AppLocalizations.of(context)?.titreconsulat8 ?? '';
      case 'titreconsulat9':
        return AppLocalizations.of(context)?.titreconsulat9 ?? '';
      default:
        return '';
    }
  }

  String getSum(BuildContext context, String summaryKey) {
    switch (summaryKey) {
      case 'titreconsulat0':
        return AppLocalizations.of(context)?.texteconsulat0 ?? '';
      case 'titreconsulat1':
        return AppLocalizations.of(context)?.texteconsulat1 ?? '';
      case 'titreconsulat2':
        return AppLocalizations.of(context)?.texteconsulat2 ?? '';
      case 'titreconsulat3':
        return AppLocalizations.of(context)?.texteconsulat3 ?? '';
      case 'titreconsulat4':
        return AppLocalizations.of(context)?.texteconsulat4 ?? '';
      case 'titreconsulat5':
        return AppLocalizations.of(context)?.texteconsulat5 ?? '';
      case 'titreconsulat6':
        return AppLocalizations.of(context)?.texteconsulat6 ?? '';
      case 'titreconsulat7':
        return AppLocalizations.of(context)?.texteconsulat7 ?? '';
      case 'titreconsulat8':
        return AppLocalizations.of(context)?.texteconsulat8 ?? '';
      case 'titreconsulat9':
        return AppLocalizations.of(context)?.texteconsulat9 ?? '';
      default:
        print("Clé de résumé inconnue: $summaryKey");
        return '';
    }
  }

  void onComplete(Locale newLocale) {

  }

@override
Widget build(BuildContext context) {

  double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {

      // Version mobile
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              Image.asset(
              'assets/slogocolor.png', 
              fit: BoxFit.cover, 
              width: 75, 
              height: 75,
              ),
              const SizedBox(height: 75.0),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal:50.0),
              child: Text(
              textAlign: TextAlign.justify,
              getSum(context, widget.article.summaryKey),
              style: const TextStyle(fontSize: 13.0),
                ),
              ),
              const SizedBox(height: 75.0),
            ],
          ),
        )
      );

    } else {

  double screenHeight = MediaQuery.of(context).size.height;
  int increasedHeight = screenHeight.round() * 2;

  return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        Flexible(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: increasedHeight.toDouble(),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                                  getTitle(context, widget.article.titleKey),
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                  ),
                    const SizedBox(height: 20.0),
                            Image.asset(
                              'assets/slogocolor.png', 
                              fit: BoxFit.cover, 
                              width: 75, 
                              height: 75,
                            ),
                   const SizedBox(height: 100.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:180.0),
                    child: Text(
                                    textAlign: TextAlign.justify,
                                    getSum(context, widget.article.summaryKey),
                                    style: const TextStyle(fontSize: 16.0),
                                  ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Footer(locale: const Locale('fr','FRA'), onLanguageChanged: (Locale ) {  },),
      ],
    ),
  );
}
}
}