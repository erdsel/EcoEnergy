import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'rounded_button.dart';
import 'package:son_hali/main.dart';
//code for designing the UI of our text field where the user writes his email id or password

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightGreenAccent, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightGreenAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

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
  bool showSpinner = false;
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
        //backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(height: 120,),
            Padding(padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'Kayıt Ol',
                    style: GoogleFonts.poppins(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.green[900]),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Kayıt olarak sende uygulamamızdan faydalan! 👋',

                    style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[900]),
                  )
                ],
              ),
            ),
            ModalProgressHUD(
              inAsyncCall: showSpinner,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          email = value;
                          //Do something with the user input.
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter your email')),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          password = value;
                          //Do something with the user input.
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter your Password')),
                    SizedBox(
                      height: 24.0,
                    ),
                    RoundedButton(
                      colour: Colors.blueAccent,
                      title: 'Register',
                      onPressed: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          final newUser = await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                          if (newUser != null) {
                            Navigator.pushNamed(context, 'home_screen');
                          }
                        } catch (e) {
                          print(e);
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}