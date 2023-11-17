import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatefulWidget {
  final Function(Locale) onLanguageChanged;
  final Locale locale;

  const Footer({
    Key? key,
    required this.onLanguageChanged,
    required this.locale,
  }) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  bool _isFooterVisible = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = MediaQuery.of(context).size.width;

        return Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isFooterVisible = !_isFooterVisible;
                });
              },
              child: Text(_isFooterVisible ? 'Masquer' : 'Afficher'),
            ),
            Visibility(
              visible: _isFooterVisible,
              child: Container(
                color: const Color.fromARGB(255, 243, 215, 243),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SingleChildScrollView(
                    scrollDirection: screenWidth < 1200 ? Axis.horizontal : Axis.vertical,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _columnWithImage(context),
              
                        _buildHoverableColumn(
                          context,
                          AppLocalizations.of(context)?.haitiAuJapon ?? '',
                          [
                            AppLocalizations.of(context)?.contactus ?? '',
                            AppLocalizations.of(context)?.mentionsLegales ?? '',
                          ],
                          '/liens_utiles',
                        ),
                     
                        _buildHoverableColumn(
                          context,
                          AppLocalizations.of(context)?.confidentialite ?? '',
                          [
                            AppLocalizations.of(context)?.politiqueConfidentialite ?? '',
                            AppLocalizations.of(context)?.gestionCookies ?? '',
                            AppLocalizations.of(context)?.accessibiliteNonConforme ?? '',
                          ],
                          '/politique_confidentialite',
                        ),
                       
                        _buildHoverableColumn(
                          context,
                          AppLocalizations.of(context)?.outils ?? '',
                          [
                            AppLocalizations.of(context)?.augmenterDiminuerPolice ?? '',
                          ],
                          '/outils',
                        ),
                       
                        _buildHoverableColumn(
                          context,
                          AppLocalizations.of(context)?.liensInstitutionnels ?? '',
                          [
                            "http://www.gouv.ht/",
                            "http://www.primature.gouv.ht/",
                            "http://www.maeci.gouv.ht/",
                            "http://www.mef.gouv.ht/",
                            "http://www.justice.gouv.ht/",
                          ],
                          '/liens_institutionnels',
                        ),
                       
                        _buildHoverableColumn(
                          context,
                          AppLocalizations.of(context)?.liensInstitutionnels ?? '',
                          [
                            "http://www.mtpc.gouv.ht/",
                            "http://www.mdi.gouv.ht/",
                            "http://www.culture.gouv.ht/",
                            "http://www.menfp.gouv.ht/",
                            "http://www.mhave.gouv.ht/",
                          ],
                          '/liens_institutionnels_2',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _columnWithImage(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/outils');
          },
          child: Container(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/ht.png',
              height: 120,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHoverableColumn(
    BuildContext context,
    String title,
    List<String> items,
    String route,
  ) {
    List<String> first5Items = items.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, route);
          },
          child: MouseRegion(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 63, 115),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _buildItemWidgets(context, first5Items),
        ),
      ],
    );
  }

  List<Widget> _buildItemWidgets(BuildContext context, List<String> items) {
    return items.map((item) {
      return Column(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              child: Text(
                item,
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () => _launchURL(item),
            ),
          ),
          const SizedBox(height: 5),
        ],
      );
    }).toList();
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}