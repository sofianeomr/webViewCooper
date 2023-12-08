import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    // Rendre la barre de statut transparente
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark, // Pour les icônes sombres
      statusBarBrightness: Brightness.dark, // Pour le texte de la barre de statut sombre
    ));

    return MaterialApp(
      home: MyHomePage(statusBarHeight: statusBarHeight),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final double statusBarHeight;

  const MyHomePage({Key? key, required this.statusBarHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: statusBarHeight,
            color: Colors.transparent,
          ),
          const Expanded(
            child: WebView(
              initialUrl: "https://cooperpp.paprec.com/cooper/auth",
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
        ],
      ),
    );
  }
}

