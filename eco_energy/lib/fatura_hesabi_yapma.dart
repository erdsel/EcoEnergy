import 'package:flutter/material.dart';
import 'package:son_hali/misafir_girisi.dart';
import 'rounded_button.dart';


class fatura_hesabi_yapma extends StatefulWidget {
  const fatura_hesabi_yapma({Key? key}) : super(key: key);

  @override
  State<fatura_hesabi_yapma> createState() => _fatura_hesabi_yapmaState();
}

class _fatura_hesabi_yapmaState extends State<fatura_hesabi_yapma> {
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

          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RoundedButton(colour: Colors.black, title: 'Su Faturası Hesapla', onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Dogalgaz(),
                  )
              );
            }),

            RoundedButton(colour: Colors.black, title: 'Elektrik Faturası Hesapla', onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Elektrik(),
                  )
              );
            }),

            RoundedButton(colour: Colors.black, title: 'Doğalgaz Faturası Hesapla', onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Dogalgazz(),
                  )
              );
            }),

          ],
        ),
      ),

    );

  }
}
class Dogalgaz extends StatefulWidget {
  const Dogalgaz({Key? key}) : super(key: key);

  @override
  State<Dogalgaz> createState() => _DogalgazState();
}
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
var tf_controller =TextEditingController();
double? alinanVeri;
class _DogalgazState extends State<Dogalgaz> {
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
                    MaterialPageRoute(builder: (context) =>fatura_hesabi_yapma(),
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
        body: Center(
          child: Column(

            children: [
              TextField(
                controller: tf_controller,
                decoration: InputDecoration(
                    hintText: "Metreküp miktarını giriniz."
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green,

                ),
                onPressed: () {
                  setState(() {
                    alinanVeri =double.parse(tf_controller.text)*5.83;
                  });

                },
                child: Text("Hesapla", style: TextStyle(fontWeight: FontWeight.bold, fontSize:25),),
              ),
              SizedBox(height: 20,),
              Text("Tahmini Olarak Ödeyeceğiniz Fatura Miktarı:\n $alinanVeri tl ")

            ],
          ),
        ),
      ),

    );
  }

}
class Elektrik extends StatefulWidget {
  const Elektrik({Key? key}) : super(key: key);

  @override
  State<Elektrik> createState() => _ElektrikState();
}

class _ElektrikState extends State<Elektrik> {
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
  var tf_controller2 =TextEditingController();
  double? alinanVeri2;
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
                    MaterialPageRoute(builder: (context) =>fatura_hesabi_yapma(),
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
        body: Center(
          child: Column(

            children: [
              TextField(
                controller: tf_controller2,
                decoration: InputDecoration(
                    hintText: "Harcanan kWh miktarını giriniz."
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink,

                ),
                onPressed: () {
                  setState(() {
                    alinanVeri2 =double.parse(tf_controller2.text)*2.60;

                  });

                },
                child: Text("Hesapla", style: TextStyle(fontWeight: FontWeight.bold, fontSize:25),),
              ),
              SizedBox(height: 20,),
              Text("Tahmini Olarak Ödeyeceğiniz Fatura Miktarı:\n $alinanVeri2 tl ")

            ],
          ),
        ),
      ),

    );
  }
}



class Dogalgazz extends StatefulWidget {
  const Dogalgazz({Key? key}) : super(key: key);

  @override
  State<Dogalgazz> createState() => _DogalgazzState();
}

class _DogalgazzState extends State<Dogalgazz> {
  @override
  var tf_controller3 =TextEditingController();
  var tf_controller4 =TextEditingController();
  double? alinanVeri3;
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
  IconData _iconLight = Icons.wb_sunny;
  IconData _iconDark =Icons.nights_stay;
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
                    MaterialPageRoute(builder: (context) =>fatura_hesabi_yapma(),
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
        body: Center(
          child: Column(

            children: [
              TextField(
                controller: tf_controller3,
                decoration: InputDecoration(
                    hintText: "Son faturanızdaki son endeksi giriniz."
                ),
              ),
              TextField(
                controller: tf_controller4,
                decoration: InputDecoration(
                    hintText: "Yeni okunan sayaç endeksini giriniz."
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green,

                ),
                onPressed: () {
                  setState(() {
                    alinanVeri3 =(double.parse(tf_controller4.text)-double.parse(tf_controller3.text))*5.83;

                  });

                },
                child: Text("Hesapla", style: TextStyle(fontWeight: FontWeight.bold, fontSize:25),),
              ),
              SizedBox(height: 10,),
              Text("Tahmini Olarak Ödeyeceğiniz Fatura Miktarı:\n $alinanVeri3 tl ")

            ],
          ),
        ),
      ),

    );
  }
}

