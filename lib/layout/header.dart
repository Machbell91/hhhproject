import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '/consularservice.dart';
import '/flagcoat.dart';
import '/haitienbref.dart';
import '/invest.dart';
import '/nationalhym.dart';
import 'package:url_launcher/url_launcher.dart';
import '/ambassador.dart';
import '/contactus.dart';
import '/main.dart';


class Header extends StatefulWidget {
  final Function(Locale) onLanguageChanged;
  final TextEditingController textController = TextEditingController();
  final Locale locale;
  

  Header({super.key, required this.onLanguageChanged, required this.locale, required double width, required int height});

  @override
  _HeaderState createState() => _HeaderState();
  
  void onComplete(Locale locale) {}
}

class _HeaderState extends State<Header> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  void onLanguageSelected(String lang) {
 void onLanguageSelected(String lang) {
    widget.onLanguageChanged(Locale(lang));
    widget.onComplete(Locale(lang)); 
  } 
}


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? localizations = AppLocalizations.of(context);

    return Container(
      constraints: const BoxConstraints(minHeight: 400),
      margin: const EdgeInsets.only(
        bottom: 5,
      ),
      padding: const EdgeInsets.only(
        top: 1, 
        bottom: 5,
      ),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
         
            TextButton(
              onPressed: () {
                widget.onLanguageChanged(const Locale('ht', 'HT')); 
              },
              child: Text(
                localizations?.kreyol ?? '',
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
              TextButton(
              onPressed: () {
                widget.onLanguageChanged(const Locale('fr', 'FR')); 
              },
                child: Text(
                  localizations?.francais ?? '',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              TextButton(
                onPressed: () {
                  widget.onLanguageChanged(const Locale('ja', 'JP'));
                },
                child: Text(
                  localizations?.japon ?? '',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              TextButton(
                onPressed: () {
                  widget.onLanguageChanged(const Locale('ko', 'KR'));
                },
                child: Text(
                  localizations?.coreen ?? '',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              TextButton(
                    onPressed: () {
                      widget.onLanguageChanged(const Locale('zh', 'CN'));
                    },
                child: Text(
                  localizations?.chinois ?? '',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              TextButton(
                onPressed: () {
                  widget.onLanguageChanged(const Locale('en', 'US'));
                },
                child: Text(
                  localizations?.anglais ?? '',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/flaghaiti.png',
                      height: 40,
                      width: 40,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      localizations?.ambassade ?? '',
                      style: TextStyle(
                        fontSize: 14.0 *
                            (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      localizations?.dHaiti ?? '',
                      style: TextStyle(
                        fontSize: 14.0 *
                            (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 3, width: 3),
                    Text(
                      localizations?.auJapon ?? '',
                      style: TextStyle(
                        fontSize: 14.0 *
                            (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      localizations?.lUnion ?? '',
                      style: TextStyle(
                        fontSize: 10.0 *
                            (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Bodoni moda',
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      localizations?.fait ?? '',
                      style: TextStyle(
                        fontSize: 10.0 *
                            (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Bodoni moda',
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      localizations?.laForce ?? '',
                      style: TextStyle(
                        fontSize: 10.0 *
                            (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Bodoni moda',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      localizations?.haitiAuJapon ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0 *
                            (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      localizations?.ambassadeDHaitiAuJapon ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.0 *
                            (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(width: 15),
                    Image.asset(
                      'assets/japanflag.png',
                      height: 40,
                      width: 40,
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: SizedBox(
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: localizations?.rechercher ?? '',
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Animation gradient
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: SizedBox(
              height: 5,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.red, Colors.blue],
                  ),
                ),
              ),
            ),
          ),
          // Navigation
          NavigationLinks(onLanguageChanged: (locale) {  },),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: 5,
            margin: const EdgeInsets.symmetric(vertical: 0.1),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.white, Colors.red, Colors.white],
                stops: [0.2, 0.5, 0.8],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
class NavigationLinks extends StatefulWidget {
  const NavigationLinks({super.key, required Null Function(dynamic locale) onLanguageChanged});

  @override
  _NavigationLinksState createState() => _NavigationLinksState();
}

class _NavigationLinksState extends State<NavigationLinks> {
  Map<String, List<String>> submenus = {
    'consulat': [
      'titreconsulat0',
      'titreconsulat1',
      'titreconsulat2',
      'titreconsulat3',
      'titreconsulat4',
      'titreconsulat5',
      'titreconsulat6',
      'titreconsulat7',
      'titreconsulat8',
      'titreconsulat9',
    ],
    'venir': [
      'investhaiti',
      'investors',
    ],
    'ambassade': [
      'ambassador',
      'contactus',
    ],
    'decouvrir': [
      'flagcoat1',
      'nationalhymn',
      'haitienbref',
    ],
  };

  List<String> itemKeys = [
    'accueil',
    //'actualite',
    'ambassade',
    'consulat',
    //'presence',
    //'relation',
    //'espacePresse',
    'venir',
    'decouvrir',
  ];

  int selectedIndex = -1;

  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  Widget buildMenuItem(String item, int index) {
  List<String> submenu = submenus[item] ?? [];
  double verticalSpacing = 20.0;
  print("Item: $item");
  print("Submenu: $submenu");

  return Container(
    margin: EdgeInsets.symmetric(horizontal: 16,vertical: verticalSpacing),
    child: submenu.isEmpty
        ? GestureDetector(
            onTap: () {
              if (item == 'accueil') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(onComplete: (lang) {  }, onLanguageChanged: (locale) {  }, locale: const Locale('fr','FRA'),),
                  ),
                );
              } else {
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 22),
              child: Text(
                AppLocalizations.of(context)?.translateNavigationItem(item) ?? item,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          )
        : PopupMenuButton<String>(
            constraints: const BoxConstraints(maxWidth: 160),
            onSelected: (String value) {
              setState(() {
                selectedIndex = index;
              });
                if (value == 'investhaiti') {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => 
                    InvestPages(
                    key: key,
                    onLanguageChanged: (locale) {}, 
                    locale: const Locale('fr', 'FR'),
                    ),),  
                  );
                }
                if (value == 'ambassador') {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => 
                    AmbadorPages(
                    key: key,
                    onLanguageChanged: (locale) {}, 
                    locale: const Locale('fr', 'FR'),
                    ),),  
                  );
                }
                if (value == 'contactus') {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => 
                    ContactusPages(
                    key: key,
                    onLanguageChanged: (locale) {}, 
                    locale: const Locale('fr', 'FR'),
                    ),),  
                  );
                }
                                if (value == 'flagcoat1') {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => 
                    FlagcoatPages(
                    key: key,
                    onLanguageChanged: (locale) {}, 
                    locale: const Locale('fr', 'FR'),
                    ),),  
                  );
                }
                                if (value == 'nationalhymn') {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => 
                    NationalHymnPages(
                    key: key,
                    onLanguageChanged: (locale) {}, 
                    locale: const Locale('fr', 'FR'),
                    ),),  
                  );
                }
                                if (value == 'haitienbref') {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => 
                    HaitienBrefPages(
                    key: key,
                    onLanguageChanged: (locale) {}, 
                    locale: const Locale('fr', 'FR'),
                    ),),  
                  );
                }
                    if (value == 'investors') {
                      launchUrl(Uri.parse("https://cfihaiti.com/index.php/fr/"));
                    }
                if (value.startsWith("titreconsulat")) {               
                  Article article = Article(
                    titleKey: value, 
                    summaryKey: value, 
                    imgPath: '',
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InformationPages(
                        article: article,
                        onLanguageChanged: (_) {}, 
                        locale: const Locale("fr", "FR"),
                      )  
                    )
                  );
                }
              },
            itemBuilder: (BuildContext context) {
              return submenu.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(
                    AppLocalizations.of(context)?.translateNavigationItem(choice) ?? choice,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                );
              }).toList();
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: index == selectedIndex ? Colors.black : Colors.transparent, width: 2),
                  right: BorderSide(color: index == selectedIndex ? Colors.black : Colors.transparent, width: 2),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                AppLocalizations.of(context)?.translateNavigationItem(item) ?? item,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
  );
}
@override
Widget build(BuildContext context) {
  bool isWideScreen = MediaQuery.of(context).size.width > 600;

  return Padding(
    padding: EdgeInsets.symmetric(vertical: isWideScreen ? 0 :8),
    child: isWideScreen
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: itemKeys.asMap().entries.map((MapEntry<int, String> entry) {
              return buildMenuItem(entry.value, entry.key);
            }).toList(),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: itemKeys.asMap().entries.map((MapEntry<int, String> entry) {
              return buildMenuItem(entry.value, entry.key);
            }).toList(),
          ),
  );
}
}