import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'layout/footer.dart';
import 'layout/header.dart';
import 'main.dart';

class HaitienBrefPages extends StatefulWidget {
  final Function(Locale) onLanguageChanged;
  final Locale locale;
  const HaitienBrefPages({
    super.key,
    required this.onLanguageChanged,
    required this.locale,
  });

  @override
  _HaitienBrefPagesState createState() => _HaitienBrefPagesState();
}

class _HaitienBrefPagesState extends State<HaitienBrefPages> {

  void onComplete(Locale newLocale) {}

  @override
  Widget build(BuildContext context) {
    
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                  'assets/images/haiti.png',
                  width: 600,
                  height: 700,
                  alignment: Alignment.topCenter,
                            ),
                  const SizedBox(height: 50.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      AppLocalizations.of(context)?.haitibref0 ?? '',
                      style: const TextStyle(fontSize: 14.0),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                const SizedBox(height: 75.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0), 
                    child: Text(
                      AppLocalizations.of(context)?.haitibref1 ?? '',
                      style: const TextStyle(fontSize: 14.0),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(height: 75.0),
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
                            Text(
                              AppLocalizations.of(context)?.haitienbref ?? '',
                              style: const TextStyle(                              
                                fontSize: 20.0,                                 
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            const Text(
                              "Haïti est un pays situé dans les Caraïbes. Il est bordé par la République dominicaine au nord, la mer des Caraïbes à l'est, l'océan Atlantique au sud et le golfe du Mexique à l'ouest.",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            const SizedBox(height: 100.0),
                            
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 370.0),
                              child: Text(
                                textAlign: TextAlign.justify,
                                AppLocalizations.of(context)?.haitibref0 ?? '', 
                                
                                style: const TextStyle(fontSize: 18.0),
                                
                              ),
                            ),
                              const SizedBox(height: 50.0),
                              Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 370.0),
                              child: Text(
                                textAlign: TextAlign.justify,
                                AppLocalizations.of(context)?.haitibref1 ?? '', 
                                
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
});
}
}