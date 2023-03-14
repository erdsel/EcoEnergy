import 'package:flutter/material.dart';

import 'rounded_button.dart';
import 'package:son_hali/misafir_girisi.dart';
import 'package:webview_flutter/webview_flutter.dart';
class SurdurulebilirEnerjiHaberleri extends StatefulWidget {

  const SurdurulebilirEnerjiHaberleri({Key? key}) : super(key: key);

  @override
  State<SurdurulebilirEnerjiHaberleri> createState() => _SurdurulebilirEnerjiHaberleriState();
}

class _SurdurulebilirEnerjiHaberleriState extends State<SurdurulebilirEnerjiHaberleri> {
  bool _iconBool = false;
  ThemeData _lightTheme= ThemeData(
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.green,
    brightness: Brightness.light,
  );
  ThemeData _darkTheme= ThemeData(
    primaryColor:Colors.black,
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,

  );


  void _changeMode() {
    setState(() {
      _iconBool = !_iconBool;
    });
  }
  @override

  Widget build(BuildContext context) {
    IconData _iconLight= Icons.wb_sunny;
    IconData _iconDark=Icons.nights_stay;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _iconBool ? _darkTheme : _lightTheme,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.grey,),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>MisafirGirisi(),
                    )
                );
              },
            ),
            actions: [
              IconButton(onPressed: (){
                setState(() {
                  _iconBool = !_iconBool;
                });
              }, icon: Icon(_iconBool ? _iconDark : _iconLight),color: Colors.grey,)
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RoundedButton(colour: Colors.grey, title: 'Güneş Enerjisi Haberler', onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GunesEnerjisiWebSayfa(),
                  )
              );
            }),
            RoundedButton(colour: Colors.grey, title: 'Rüzgar Enerjisi Haberler', onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RuzgarEnerjisiWebSayfa(),
                  )
              );
            }),
            RoundedButton(colour: Colors.grey, title: 'Jeotermal Enerjisi Haberler', onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JeotermalEnerjiHaber(),
                  )
              );
            }),
            RoundedButton(colour: Colors.grey, title: 'Hidroelektrik Enerjisi Haberler', onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HidroelektrikWebSayfa(),
                  )
              );
            }),
            RoundedButton(colour: Colors.grey, title: 'Biomassa Enerjisi Haberler', onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BiomassaWebSayfa(),
                  )
              );
            }),

          ],
        ),
      ),
    );
  }
}
class GunesEnerjisiWebSayfa extends StatefulWidget {
  const GunesEnerjisiWebSayfa({Key? key}) : super(key: key);

  @override
  State<GunesEnerjisiWebSayfa> createState() => _GunesEnerjisiWebSayfaState();
}

class _GunesEnerjisiWebSayfaState extends State<GunesEnerjisiWebSayfa> {
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://www.trthaber.com/etiket/gunes-enerjisi/'),
      );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(

          actions: [
            IconButton(
              icon: Icon(Icons.arrow_back, size: 20, color: Colors.grey,),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SurdurulebilirEnerjiHaberleri(),
                    )
                );
              },
            ),
          ],
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text("Güneş Enerjisi", style: TextStyle(color: Colors.grey),),
        ),
        body: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}

class BiomassaWebSayfa extends StatefulWidget {
  const BiomassaWebSayfa({Key? key}) : super(key: key);

  @override
  State<BiomassaWebSayfa> createState() => _BiomassaWebSayfaState();
}

class _BiomassaWebSayfaState extends State<BiomassaWebSayfa> {
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://www.enerjigazetesi.ist/biyogaz-ve-biyokutle-haberleri/'),
      );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(

          actions: [
            IconButton(
              icon: Icon(Icons.arrow_back, size: 20, color: Colors.grey,),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SurdurulebilirEnerjiHaberleri(),
                    )
                );
              },
            ),
          ],
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text("Biomassa Enerjisi", style: TextStyle(color: Colors.grey),),
        ),
        body: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}

class HidroelektrikWebSayfa extends StatefulWidget {
  const HidroelektrikWebSayfa({Key? key}) : super(key: key);

  @override
  State<HidroelektrikWebSayfa> createState() => _HidroelektrikWebSayfaState();
}

class _HidroelektrikWebSayfaState extends State<HidroelektrikWebSayfa> {
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://www.trthaber.com/etiket/hidroelektrik-santralleri/'),
      );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(

          actions: [
            IconButton(
              icon: Icon(Icons.arrow_back, size: 20, color: Colors.grey,),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SurdurulebilirEnerjiHaberleri(),
                    )
                );
              },
            ),
          ],
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text("Hidroelektrik Enerjisi", style: TextStyle(color: Colors.grey),),
        ),
        body: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}

class JeotermalEnerjiHaber extends StatefulWidget {
  const JeotermalEnerjiHaber({Key? key}) : super(key: key);

  @override
  State<JeotermalEnerjiHaber> createState() => _JeotermalEnerjiHaberState();
}

class _JeotermalEnerjiHaberState extends State<JeotermalEnerjiHaber> {
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://www.jeotermalhaberler.com/'),
      );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(

          actions: [
            IconButton(
              icon: Icon(Icons.arrow_back, size: 20, color: Colors.grey,),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SurdurulebilirEnerjiHaberleri(),
                    )
                );
              },
            ),
          ],
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text("Jeotermal Enerjisi", style: TextStyle(color: Colors.grey),),
        ),
        body: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}


class RuzgarEnerjisiWebSayfa extends StatefulWidget {
  @override
  State<RuzgarEnerjisiWebSayfa> createState() => _RuzgarEnerjisiWebSayfaState();
}

class _RuzgarEnerjisiWebSayfaState extends State<RuzgarEnerjisiWebSayfa> {
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://www.trthaber.com/etiket/ruzgar-enerjisi/'),
      );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(

            actions: [
              IconButton(
                icon: Icon(Icons.arrow_back, size: 20,),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SurdurulebilirEnerjiHaberleri(),
                      )
                  );
                },
              ),
            ],
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text("Rüzgar Enerjisi"),
          ),
        body: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}


class JeotermalWebSayfa extends StatefulWidget {
  @override
  State<JeotermalWebSayfa> createState() => _JeotermalWebSayfaState();
}

class _JeotermalWebSayfaState extends State<JeotermalWebSayfa> {
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://flutter.dev'),
      );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(

            actions: [
              IconButton(
                icon: Icon(Icons.arrow_back, size: 20,),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SurdurulebilirEnerjiHaberleri(),
                      )
                  );
                },
              ),
            ],
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text("Jeotermal"),
          ),
        body: WebViewWidget(
          controller: controller,
        ),

      ),
    );
  }
}


