import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'layout/footer.dart';
import 'layout/header.dart';
import 'main.dart';

class FlagcoatPages extends StatefulWidget {
  final Function(Locale) onLanguageChanged;
  final Locale locale;
  const FlagcoatPages({
    super.key,
    required this.onLanguageChanged,
    required this.locale,
  });

  @override
  _FlagcoatPagesState createState() => _FlagcoatPagesState();
}

class _FlagcoatPagesState extends State<FlagcoatPages> {

  void onComplete(Locale newLocale) {}
  
  @override
  Widget build(BuildContext context) {

  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth < 600) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Image.asset(
              'assets/slogocolor.png',
              width: 75,
              height: 75,
            ),
            const SizedBox(height: 75.0),
                  Image.asset(
                  'assets/flaghaiti.png',  
                    width: 150, 
                    height: 200,
            ),
            const SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:50.0),
              child: Text(
                AppLocalizations.of(context)?.flagcoat ?? '', 
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 14), 
              ),
            )
          ],
        ),
      ),
    );
  } else { return Scaffold(
      body: Column(
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
                              AppLocalizations.of(context)?.flagcoat1 ?? '',
                              style: const TextStyle(                              
                                fontSize: 20.0,                                 
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Image.asset(
                              'assets/flaghaiti.png', 
                              fit: BoxFit.cover, 
                              width: 500, 
                              height: 300,
                              
                            ),
                            const SizedBox(height: 100.0),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 370.0),
                              child: Text(
                                textAlign: TextAlign.justify,
                                AppLocalizations.of(context)?.flagcoat ?? '', 
                                style: const TextStyle(fontSize: 18.0),
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
    );   
  }
}
}