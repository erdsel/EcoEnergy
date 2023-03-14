import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:son_hali/login_screen.dart';
import 'package:son_hali/faturaGirisiYap.dart';
import 'package:son_hali/rounded_button.dart';

late User loggedinUser;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore= FirebaseFirestore.instance;
  //var refFaturalar= FirebaseDatabase.instance.ref().child("faturalar");

  @override
  void initState() {
    super.initState();
    getCurrentUser();

    /*var bilgi= HashMap<String,dynamic>();
    bilgi["fatura"]= "fatura1";
    refFaturalar.push().set(bilgi);*/
  }

  //using this function you can use the credentials of the user
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
  }
  final ThemeData _lightTheme= ThemeData(
    //primarySwatch: Colors.lightGreenAccent,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.lightGreenAccent,
    brightness: Brightness.light,
  );
  final ThemeData _darkTheme= ThemeData(
    // primarySwatch: Colors.lightGreenAccent,
      primaryColor:Colors.black,
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      hintColor: Colors.white

  );
  final IconData _iconLight= Icons.wb_sunny;
  final IconData _iconDark=Icons.nights_stay;
  bool _iconBool = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _iconBool ? _darkTheme : _lightTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(

          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            centerTitle: true,
            title: Text("Profil" ,style: GoogleFonts.poppins(fontSize: 20,  color: Colors.black87, fontWeight: FontWeight.bold),),
            backgroundColor: Colors.lightGreenAccent,
            elevation: 0.0,

            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_outlined,color: Colors.grey,),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>LoginScreen(),
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
        body: SingleChildScrollView(
          child: Column(

            children: [
              const SizedBox(height: 50,),
              Center(
                child: SizedBox(

                  width: 120,
                  height: 120,
                  child: ClipRRect( borderRadius:BorderRadius.circular(100),child: Image.network('https://e7.pngegg.com/pngimages/527/663/png-clipart-logo-person-user-person-icon-rectangle-photography-thumbnail.png')),

                ),
              ),
              const SizedBox(height: 10,),
              Text("HOŞGELDİNİZ!", style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              SizedBox( width:200, height:50,child: ElevatedButton(onPressed: () {}, child: Text("Profili Düzenle", style: GoogleFonts.poppins(fontSize: 20),)
              ,style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent,
                  side: BorderSide.none,
                  shape: const StadiumBorder()
                ),
              )
              ),
              const SizedBox(height: 70,),
              ProfileMenuWidget(title: 'Manuel Fatura Girişi Yap', onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => faturaGirisiYap(),
                    )
                );
              },),
              const SizedBox(height: 10,),
              ProfileMenuWidget(title: 'Son Faturalarım', onPress: () {
              },),
              const SizedBox(height: 10,),
            /*  ProfileMenuWidget(title: 'Fatura Analizi', onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FaturaAnaliziYap(),
                    )
                );
              },),
              const SizedBox(height: 10,),
              ProfileMenuWidget(title: 'Detaylı Fatura Hesapla', onPress: () {  },),
              const SizedBox(height: 10,),
              ProfileMenuWidget(title: 'Otomatik Fatura Girişi Yap', onPress: () {  },),
              const SizedBox(height: 10,),*/
            ],
          ),
        )
      ),
    );
  }
}
class FaturaAnaliziYap extends StatefulWidget {
  const FaturaAnaliziYap({Key? key}) : super(key: key);

  @override

  State<FaturaAnaliziYap> createState() => _FaturaAnaliziYapState();
}
final ThemeData _lightTheme= ThemeData(
  //primarySwatch: Colors.lightGreenAccent,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.lightGreenAccent,
  brightness: Brightness.light,
);
final ThemeData _darkTheme= ThemeData(
  // primarySwatch: Colors.lightGreenAccent,
    primaryColor:Colors.black,
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    hintColor: Colors.white

);
final IconData _iconLight= Icons.wb_sunny;
final IconData _iconDark=Icons.nights_stay;
bool _iconBool = false;
class _FaturaAnaliziYapState extends State<FaturaAnaliziYap> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _iconBool ? _darkTheme : _lightTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(

          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            centerTitle: true,
            title: Text("Fatura Analizi" ,style: GoogleFonts.poppins(fontSize: 20,  color: Colors.black87, fontWeight: FontWeight.bold),),
            backgroundColor: Colors.lightGreenAccent,
            elevation: 0.0,

            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_outlined,color: Colors.grey,),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>HomeScreen(),
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
            RoundedButton(colour: Colors.grey, title: 'Aylık Analiz', onPressed: (){

            }),
            RoundedButton(colour: Colors.grey, title: 'Yıllık Analiz', onPressed: (){

            })
          ],
        ),
      ),
    );
  }
}

class faturaGirisiYap extends StatefulWidget {
  const faturaGirisiYap({Key? key}) : super(key: key);

  @override
  State<faturaGirisiYap> createState() => _faturaGirisiYapState();
}

class _faturaGirisiYapState extends State<faturaGirisiYap> {

  final _firestore2= FirebaseFirestore.instance;
  late User loggedinUser;
  TextEditingController faturaAyController= TextEditingController();
  TextEditingController faturaTutarController= TextEditingController();
  TextEditingController faturaCinsController= TextEditingController();
  var faturaTest= FirebaseDatabase.instance.ref().child("fatura_ekle");
  final ThemeData _lightTheme= ThemeData(
    //primarySwatch: Colors.lightGreenAccent,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.lightGreenAccent,
    brightness: Brightness.light,
  );
  final ThemeData _darkTheme= ThemeData(
    // primarySwatch: Colors.lightGreenAccent,
      primaryColor:Colors.black,
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      hintColor: Colors.white

  );
  final IconData _iconLight= Icons.wb_sunny;
  final IconData _iconDark=Icons.nights_stay;
  bool _iconBool = false;


  // Get the current user when the widget is initialized
  @override
  void initState() {
    super.initState();
    getCurrentUser();
 //  getFaturaUser();
  }
  void getCurrentUser() async {
    try {
      final user = await FirebaseAuth.instance.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
  }
  void getFaturaUser() async{
    var bilgi= HashMap <String,dynamic>();

    faturaTest.push().set(bilgi);
  }












  @override

  Widget build(BuildContext context) {

    return MaterialApp(
      theme: _iconBool ? _darkTheme : _lightTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(

          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            centerTitle: true,
            title: Text("Fatura Girişi Yap" ,style: GoogleFonts.poppins(fontSize: 20,  color: Colors.black87, fontWeight: FontWeight.bold),),
            backgroundColor: Colors.lightGreenAccent,
            elevation: 0.0,

            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_outlined,color: Colors.grey,),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>HomeScreen(),
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              TextField(
                controller: faturaAyController,
                decoration: const InputDecoration(hintText: 'Fatura Ayı'),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: faturaTutarController,
                decoration: const InputDecoration(hintText: 'Fatura Tutarı'),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: faturaCinsController,
                decoration: const InputDecoration(hintText: 'Fatura Cinsi'),
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: () {
                DatabaseReference ref = FirebaseDatabase.instance.reference();
                ref.child("faturaTest").push().set({
                  "faturaAy": faturaAyController.text,
                  "faturaTutar": faturaTutarController.text,
                  "faturaCins": faturaCinsController.text,
                });


              },
                child:   Text('Ekle',style: GoogleFonts.poppins(fontSize: 20),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent,
                ),
              )
              ,SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                //TumFaturalar();
              },  child:   Text('Verileri göster',style: GoogleFonts.poppins(fontSize: 20),),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightGreenAccent,
          ),)


            ],
          ),
        ),
      ),
    );
  }
}

class Faturalar{
  late String fatura_ay;
  late int fatura_tutar;
  late String fatura_cins;

  Faturalar(this.fatura_ay, this.fatura_tutar,this.fatura_cins );
  factory Faturalar.fromJson(Map<dynamic, dynamic> json){
    return Faturalar(json["fatura_ay"] as String, json["fatura_tutar"] as int,json["fatura_cins"] as String);
  }
}





class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key, required this.title, required this.onPress
  }) : super(key: key);
  final String title;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.lightGreenAccent.withOpacity(0.1),
        ),
        child: const Icon(Icons.keyboard_control_outlined, color: Colors.grey,),
      ) ,
      title: Text(title, style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w500),),
      trailing: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: const Icon(Icons.arrow_right_outlined,size: 18,color: Colors.grey,),
      ),
    );
  }
}



/*class TumFaturalar extends StatefulWidget {
  @override
  _TumFaturalarState createState() => _TumFaturalarState();
}

class _TumFaturalarState extends State<TumFaturalar> {
  late DatabaseReference _ref;
  List<Map<dynamic, dynamic>> _lists = [];

  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.ref().child('faturaTest');
    _ref.once().then((DataSnapshot snapshot) {
      var values = snapshot.value as Map<dynamic, dynamic>?;
      if (values != null) {
        values.forEach((key, value) {
          _lists.add(value);
        });
        setState(() {}); // notify the widget to redraw with new data
      }
    }).catchError((error) {
      print("Error: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _lists.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Fatura No: ${_lists[index]['faturaNo']}'),
                Text('Tutar: ${_lists[index]['tutar']}'),
                Text('Müşteri Adı: ${_lists[index]['musteriAdi']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
*/