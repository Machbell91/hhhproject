import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'layout/footer.dart';
import 'layout/urganncmnt.dart';
import 'layout/header.dart';
import 'main.dart';

class AnncmntmobPages extends StatefulWidget {
  final Function(Locale) onLanguageChanged;
  final Locale locale;
  const AnncmntmobPages({
    super.key,
    required this.onLanguageChanged,
    required this.locale,
  });

  @override
  _AnncmntmobPagesState createState() => _AnncmntmobPagesState();
}

class _AnncmntmobPagesState extends State<AnncmntmobPages> {

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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal:50.0),
              child: Carousel(),
            )
          ],
        ),
      ),
    );
  } else {
    return Scaffold(
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
                            const SizedBox(height: 20.0),
                            Image.asset(
                              'assets/slogocolor.png', 
                              fit: BoxFit.cover, 
                              width: 50, 
                              height: 50,                             
                            ),
                            const SizedBox(height: 100.0),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 170.0),
                              child:Carousel()
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