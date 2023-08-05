import 'package:flutter/material.dart';

class AboutDialogs extends StatefulWidget {
  const AboutDialogs({super.key});

  @override
  State<AboutDialogs> createState() => _AboutDialogsState();
}

class _AboutDialogsState extends State<AboutDialogs> {

  void _showaboutdialog(){
    showAboutDialog(context: context,
      applicationVersion: '1.0.0',
      applicationIcon: FlutterLogo(),
      applicationLegalese: 'Legalese',
      children: [
        Text('View Licenses for more info.')
      ]
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _showaboutdialog, child: Text('About App')),
            AboutListTile(
              icon: Icon(Icons.info),
              applicationVersion: '1.0.0',
              applicationIcon: FlutterLogo(),
              applicationLegalese: 'Legalese',
              aboutBoxChildren: [
                Text('View Licenses for more info.')
              ]

            )
          ],
        ),
      ),
    );
  }
}