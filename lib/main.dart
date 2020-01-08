import 'package:components/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), 
        const Locale('es'), 
      ],
      debugShowCheckedModeBanner: false,
      title: 'Components',
      initialRoute: '/',
      routes: getApplicationRoutes(),
    );
  }
}
