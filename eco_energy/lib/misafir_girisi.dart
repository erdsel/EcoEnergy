import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:son_hali/evde_enerji.dart';
import 'package:son_hali/location_page.dart';
import 'package:son_hali/main.dart';
import 'package:son_hali/su_an_neredeyim.dart';
import 'package:son_hali/surdurulebilir_enerji_haberleri.dart';
import 'rounded_button.dart';
import 'package:son_hali/ulkede_enerji.dart';
import 'package:son_hali/surdurulebilir_enerji_nedir.dart';
import 'package:son_hali/fatura_hesabi_yapma.dart';


class MisafirGirisi extends StatefulWidget {
  const MisafirGirisi({Key? key}) : super(key: key);

  @override
  State<MisafirGirisi> createState() => _MisafirGirisiState();
}

class _MisafirGirisiState extends State<MisafirGirisi> {
  bool _iconBool = false;
  final ThemeData _lightTheme= ThemeData(
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
                        MaterialPageRoute(builder: (context) =>WelcomeScreen(),
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
          body:Column(

            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50,),
              RoundedButton(colour: Colors.black, title: 'Sürdürülebilir Enerji Nedir', onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>SurdurulebilirEnerjiNedir(),
                    )
                );
              }),
              RoundedButton(colour: Colors.black, title: 'Sürdürülebilir Enerji Haberleri', onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>SurdurulebilirEnerjiHaberleri(),
                    )
                );
              }),
              RoundedButton(colour: Colors.black, title: 'Fatura Hesabı Yapma', onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>fatura_hesabi_yapma(),
                    )
                );
              }),
              RoundedButton(colour: Colors.black, title: 'Evde Enerji', onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>EvdeEnerjiNedir(),
                    )
                );
              }),
              RoundedButton(colour: Colors.black, title: 'Ülkede Enerji', onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>ulkede_enerji_genel(),
                    )
                );
              }),
              RoundedButton(colour: Colors.black, title: 'Şu An Neredeyim?', onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>Homepage(),
                    )
                );
              }),
            ],
          ),
        ),
              );
  }
}
