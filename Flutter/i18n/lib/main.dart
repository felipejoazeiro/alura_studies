import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n/generated/l10n.dart';

// intl_pt_PT
// intl_pt_BR

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // localeResolutionCallback: (Locale locale, supportedLocales) {
      //   return Locale("pt");
      // },
      supportedLocales: LocaleProvider.delegate.supportedLocales,
      localizationsDelegates: const [
        LocaleProvider.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Locale locale = const Locale("pt");

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 22);

    return MaterialApp(
      supportedLocales: LocaleProvider.delegate.supportedLocales,
      localizationsDelegates: const [
        LocaleProvider.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: locale,
      home: Scaffold(
        appBar: AppBar(
          title: Text(LocaleProvider.of(context).appName),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                LocaleProvider.of(context).welcome,
                style: style,
              ),
              Text(
                LocaleProvider.of(context).flutterIsTheBest,
                style: style,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  LocaleProvider.of(context).login,
                  style: style,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (locale.toString() == "pt") {
                      locale = const Locale("en");
                    } else {
                      locale = const Locale("pt");
                    }
                  });
                },
                child: Text(
                  LocaleProvider.of(context).createAccount,
                  style: style,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
