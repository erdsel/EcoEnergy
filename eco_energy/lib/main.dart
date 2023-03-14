import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:son_hali/rounded_button.dart';
import 'package:son_hali/login_screen.dart';
import 'package:son_hali/signUp.dart';
import 'package:son_hali/home_screen.dart';
import 'package:son_hali/misafir_girisi.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(),
      debugShowCheckedModeBanner: false,
      initialRoute: 'welcome_screen',
      routes: {
        'welcome_screen': (context) => WelcomeScreen(),
        'registration_screen': (context) => RegistrationScreen(),
        'login_screen': (context) => LoginScreen(),
        'home_screen': (context) => HomeScreen(),
        'misafir_girisi': (context) => MisafirGirisi(),
      },
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
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
  IconData _iconLight= Icons.wb_sunny;
  IconData _iconDark=Icons.nights_stay;


  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _iconBool ? _darkTheme : _lightTheme,

      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(Icons.menu,color: Colors.grey,),
              onPressed: () {},
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


          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://previews.123rf.com/images/macrovector/macrovector1504/macrovector150400174/38303591-eco-energy-solution-flat-round-icons-composition-poster-with-windmills-and-solar-panels-symbols-abstract-vector-illustration.jpg'),
                        fit: BoxFit.cover,

                      ),

                      borderRadius: BorderRadius.all(Radius.circular(600)),

                    ),
                    width:250,
                    height: 400,
                  ),
                  RoundedButton(
                    colour: Colors.lightBlueAccent,
                    title: 'Giriş Yap',
                    onPressed: () {
                      Navigator.pushNamed(context, 'login_screen');
                    },
                  ),
                  RoundedButton(
                      colour: Colors.blueAccent,
                      title: 'Kayıt Ol',
                      onPressed: () {
                        Navigator.pushNamed(context, 'registration_screen');
                      }),
                  //RoundedButton(colour: Colors.pink, title: 'Temayı Değiştir', onPressed: _changeMode,),
                  RoundedButton(colour: Colors.deepPurple, title: 'Misafir Girişi İle Devam Et', onPressed: (){
                    Navigator.pushNamed(context,  'misafir_girisi');
                  },)
                ]),
          )),
    );
  }
}