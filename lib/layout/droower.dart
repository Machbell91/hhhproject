import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final localizations = AppLocalizations.of(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: Text(localizations!.translateNavigationItem('accueil')),
            onTap: () {
              // Navigation vers page Accueil
            },
          ),
          ListTile(
            title: Text(localizations.translateNavigationItem('actualites')), 
            onTap: () {
              // Navigation vers page Actualités
            },
          ),
          ListTile(
            title: Text(localizations.translateNavigationItem('ambassade')),
            onTap: () {
              // Navigation vers page Ambassade
            },
          ),
          ListTile(
            title: Text(localizations.translateNavigationItem('presence')),
            onTap: () {
              // Navigation vers page Présence
            },  
          ),
          ListTile(
            title: Text(localizations.translateNavigationItem('relation')),
            onTap: () {
              // Navigation vers page Relations
            },
          ),
          ListTile(
            title: Text(localizations.translateNavigationItem('espacePresse')),
            onTap: () {
              // Navigation vers page Espace presse
            },
          ),
          ListTile(
            title: Text(localizations.translateNavigationItem('venir')), 
            onTap: () {
              // Navigation vers page Venir
            },
          ),
          ListTile(
            title: Text(localizations.translateNavigationItem('decouvrir')),
            onTap: () {
             // Navigation vers page Découvrir
            }, 
          ),
        ],
      ),
    );

  }

}