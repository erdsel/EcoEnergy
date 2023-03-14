import 'package:flutter/material.dart';
import 'package:son_hali/location_page.dart';
import 'rounded_button.dart';
import 'package:son_hali/misafir_girisi.dart';

class su_an_neredeyim extends StatefulWidget {
  const su_an_neredeyim({Key? key}) : super(key: key);

  @override
  State<su_an_neredeyim> createState() => _su_an_neredeyimState();
}

class _su_an_neredeyimState extends State<su_an_neredeyim> {
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
  @override
  Widget build(BuildContext context) {
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
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(


                borderRadius: BorderRadius.circular(20),
              ),
              child: Text("Konumunuzu almak için gerekli izinleri verdikten sonra, bölgenizde bulunan yenilebilir enerji kaynaklarını listeleyebilirsiniz.", style: TextStyle(
                fontSize: 20,
              ),),
            ),
            RoundedButton(colour: Colors.white, title: 'Konum Bilgisi Al ', onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Homepage(),
                  )
              );
            })
          ],
        ),
      ),

    );
  }
}

/*class konum_bilgisi_al extends StatefulWidget {
  const konum_bilgisi_al({Key? key}) : super(key: key);

  @override
  State<konum_bilgisi_al> createState() => _konum_bilgisi_alState();

  void then(Null Function(dynamic value) param0) {}
}

class _konum_bilgisi_alState extends State<konum_bilgisi_al> {
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

  @override
  Widget build(BuildContext context) {
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

      ),
    );
  }
}

*/