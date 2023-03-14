import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'rounded_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:son_hali/main.dart';
import 'package:flutter/material.dart';

//code for designing the UI of our text field where the user writes his email id or password

const kTextFieldDecoration = InputDecoration(
    hintText: 'Enter a value',
    hintStyle: TextStyle(color: Colors.black),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightGreen, width: 3.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightGreenAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ));

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final _auth = FirebaseAuth.instance;

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  bool showSpinner = false;
  ThemeData _lightTheme= ThemeData(
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.green,
    brightness: Brightness.light,
  );
  ThemeData _darkTheme= ThemeData(
      primarySwatch: Colors.green,
    primaryColor:Colors.black,
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    hintColor: Colors.white

  );

  IconData _iconLight= Icons.wb_sunny;
  IconData _iconDark=Icons.nights_stay;
  bool _iconBool = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _iconBool ? _darkTheme : _lightTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            backgroundColor: Colors.lightGreenAccent,
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
        extendBodyBehindAppBar: true,
        body: Container(
         /* decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
                colors:[
                  Colors.green,
                  Colors.lightGreenAccent,
                  Colors.black87,
                ]

            ),
          ),*/
          child: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [


                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 100,),
                          Padding(padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                'Giriş Yap',
                                style: GoogleFonts.poppins(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.green[900]),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                'Tekrardan Hoşgeldiniz 👋',

                                style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[900]),
                              )
                            ],
                          ),
                          ),
                        ],
                      ),

                    ],
                  ),
                  SizedBox(height: 30,),
                  Center(
                    child: Expanded(
                      child: Container(

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(60))
                      ),
                    ),),
                  ),
                  TextField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        email = value;
                        //Do something with the user input.
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Email adresini giriniz.', hintStyle: TextStyle(color: Colors.grey),
                      )),
                  SizedBox(height: 10,),
                  TextField(

                      obscureText: true,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        password = value;
                        //Do something with the user input.
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Şifrenizi giriniz.', hintStyle: TextStyle(color: Colors.grey),)
                  ),

                  RoundedButton(
                      colour: Colors.lightBlueAccent,
                      title: 'Log In',
                      onPressed: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (user != null) {
                            Navigator.pushNamed(context, 'home_screen');
                          }
                        } catch (e) {
                          print(e);
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      }),

                 /* SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                              child: Container(
                                color: Colors.white.withOpacity(0.1),
                                child: Center(
                                  child: Text('Blurred Image'),
                                ),
                              ),
                            ),

                            width: 200,
                            height: 200,
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              image: DecorationImage(
                                image: NetworkImage('https://media.istockphoto.com/id/1440194697/tr/foto%C4%9Fraf/wind-power.jpg?s=612x612&w=0&k=20&c=j-7GsmXR-8fOmLX6JUqPAjBBs25TKnBhzstkEwoo-dg='),
                                fit: BoxFit.cover,
                              ),


                            ),
                          ),
                          Container(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                              child: Container(
                                color: Colors.black.withOpacity(0.1),
                                child: Center(
                                  child: Text('Blurred Image'),
                                ),
                              ),
                            ),

                            width: 200,
                            height: 200,
                            margin: EdgeInsets.symmetric(horizontal: 16.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                image: NetworkImage('https://media.istockphoto.com/id/1256170666/tr/foto%C4%9Fraf/enerji-verimli-ev-sembol%C3%BC-sikke-y%C4%B1%C4%9F%C4%B1nlar%C4%B1-aras%C4%B1nda-defocused-arka-plan-%C3%B6n%C3%BCnde-oturan.jpg?s=612x612&w=0&k=20&c=0ITlO_t2tVPxvECkGS2d3yiFWIZuZadwsBVYnvqUz6Y='),
                                fit: BoxFit.cover,
                              ),


                            ),
                          ),

                          Container(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                              child: Container(
                                color: Colors.black.withOpacity(0.1),
                                child: Center(
                                  child: Text('Blurred Image'),
                                ),
                              ),
                            ),
                            width: 200,
                            height: 200,
                            margin: EdgeInsets.symmetric(horizontal: 16.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                image: NetworkImage('https://media.istockphoto.com/id/890641832/tr/foto%C4%9Fraf/hesap-makinesi-ve-para-yan%C4%B1nda-bir-ampul-enerji-tasarrufu-kavram%C4%B1.jpg?s=612x612&w=0&k=20&c=0RnYbdhunDG8CRpBpl5PNDyK9PUFwpg_cSB9Jy3sHOU='),
                                fit: BoxFit.cover,
                              ),


                            ),
                          ),
                        ],
                      ),
                    ),
                  )*/


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

