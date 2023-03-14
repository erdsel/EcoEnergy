import 'package:flutter/material.dart';
import 'package:son_hali/misafir_girisi.dart';
import 'rounded_button.dart';
class ColorSys{
  static Color primary= Color.fromRGBO(52, 43, 37, 1);
  static Color gray= Color.fromRGBO(137, 137,137, 1);
  static Color secoundry= Color.fromRGBO(198,116, 27, 1);
  static Color secundryLight= Color.fromRGBO(226, 185, 141, 1);
}

class Strings{
  static var stepOneTitle="Güneş enerjisi";
  static var stepSecondTitle="Rüzgar enerjisi";
  static var stepThirdTitle="Hidroelektrik enerjisi";
  static var stepFourthTitle="Jeotermal enerjisi";
  static var stepFifthTitle="Biomassa enerjisi";
}

class Strings1{
  static var stepOneDefinition="Dünyaya gelen güneş ışınlarının saniyedeki enerji birimi 170 milyon MW kadardır. Araştırma sonuçlarına göre bu değer Türkiye'de 1 yıl boyunca üretilen enerjisinin 1700 katı kadar olmakla birlikte Türkiye 1 yılın yaklaşık 110 gününü güneş enerjisi üretimi yönünden oldukça verimli geçirir.Türkiye'nin bölgeleri değerlendirildiğinde ülkemizde yıl bazında en fazla güneş alan bölge Güneydoğu Anadolu Bölgesi'dir. üretiminde en verimli ikinci bölge ise Akdeniz Bölgesi'dir.";
  static var stepSecondDefinition="Türkiye rüzgâr enerjisi potansiyeli 48.000 MW olarak belirlenmiştir. Bu potansiyele karşılık gelen toplam alan Türkiye yüz ölçümünün %1,30'una denk gelmektedir.Türkiye, rüzgar enerji santrali kurulu gücü olarak Avrupa'da 7'inci, Dünyada ise 13'üncü sırada bulunmaktadır";
  static var stepThirdDefinition="Türkiye'nin hidroelektrik enerji potansiyeli, dünyanın %5'ine, Avrupa'nın %16'sına karşılık gelir. Potansiyel açısından Avrupa'da Norveç'ten sonra ikinci sıradadır. Türkiye'nin 47.947 MW/yıl (megawatt/yıl) hidrolik potansiyel gücün, 19.619 MW/yıl'lık bölümü yani %41,3'ü işletme halindedir.Güneydoğu Anadolu Projesi (GAP) kapsamında bölgede yapımı tamamlanan hidroelektrik santralleri (HES), Türkiye'nin hidroelektrik enerjisi üretiminin yarısını karşılıyor.";
  static var stepFourthDefinition="Ülkemizin her tarafında yayılmış yaklaşık 1.000 adet doğal çıkış şeklinde değişik sıcaklıklarda jeotermal kaynaklar mevcuttur. Türkiye jeotermal potansiyeli bakımından Avrupa'nın 1. ülkesi ve kurulu güç bakımından ise Dünyanın 4. ülkesi konumundadırTürkiye topraklarının çok büyük bir kısmında jeotermal kaynaklara rastlanmaktadır. Türkiye'nin jeotermal potansiyeli yaklaşık 31.500 MW civarındadır. Bölgesel anlamda baktığımızda ise Ege Bölgesi ve Güney Marmara jeotermal kaynaklarının yoğunlaştığı alanlar olarak karşımıza çıkmaktadır.";
  static var stepFifthDefinition="Eskişehir, Antalya, İstanbul, Samsun ve Mersin biyokütle santrallerinin bulunduğu şehirlerimizin başlıcalarıdır.Biyokütle ve atık ısı enerjisine dayalı kurulu güç Haziran 2022 sonu itibariyle 2.172 MW, toplam kurulu güç içerisindeki oranı %2.14 olup yıllara göre kurulu güç değişimi ve toplam kurulu güç içerisindeki oranı aşağıdaki grafiklerde yer almaktadır.";
}

class ulkede_enerji_genel extends StatefulWidget {
  const ulkede_enerji_genel({Key? key}) : super(key: key);

  @override
  State<ulkede_enerji_genel> createState() => _ulkede_enerji_genelState();
}

class _ulkede_enerji_genelState extends State<ulkede_enerji_genel> {
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
            RoundedButton(colour: Colors.black, title: 'Marmara Bölgesi', onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>ulkede_enerji(),
                  )
              );
            }),
            RoundedButton(colour: Colors.black, title: 'Karadeniz Bölgesi', onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>ulkede_enerji(),
                  )
              );
            }),
            RoundedButton(colour: Colors.black, title: 'Ege Bölgesi', onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>ulkede_enerji(),
                  )
              );
            }),
            RoundedButton(colour: Colors.black, title: 'İç Anadolu Bölgesi', onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>ulkede_enerji(),
                  )
              );
            }),
            RoundedButton(colour: Colors.black, title: 'Doğu Anadolu Bölgesi', onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>ulkede_enerji(),
                  )
              );
            }),
            RoundedButton(colour: Colors.black, title: 'Güneydoğu Anadolu Bölgesi', onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>ulkede_enerji(),
                  )
              );
            }),
            RoundedButton(colour: Colors.black, title: 'Akdeniz Bölgesi', onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>ulkede_enerji(),
                  )
              );
            }),
          ],
        ),
      ),
    );
  }
}

class ulkede_enerji extends StatefulWidget {
  const ulkede_enerji({Key? key}) : super(key: key);

  @override
  State<ulkede_enerji> createState() => _ulkede_enerjiState();
}

class _ulkede_enerjiState extends State<ulkede_enerji> {
  late PageController _pageController;
  int currentIndex=0;
  @override
  void initState(){
    _pageController=PageController(
      initialPage: 0
    );
    super.initState();
  }

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();

  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.grey,),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>ulkede_enerji_genel(),
                )
            );
          },
        ),

      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex=page;
              });
            },
            controller: _pageController,
            children: [
              makePage1(
                image: 'assets/solar.jpg',
                title: Strings.stepOneTitle,
                content: Strings1.stepOneDefinition,
              ),
              makePage1(
                image: 'assets/19197794.jpg',
                title: Strings.stepSecondTitle,
                content:Strings1.stepSecondDefinition,
              ),
              makePage1(
                image: 'assets/hidroelektrik.jpg',
                title: Strings.stepThirdTitle,
                content: Strings1.stepThirdDefinition,
              ),
              makePage1(
                image: 'assets/geothermal.jpg',
                title: Strings.stepFourthTitle,
                content: Strings1.stepFourthDefinition,
              ),
              makePage1(
                image: 'assets/biomassa.jpg',
                title: Strings.stepFifthTitle,
                content: Strings1.stepFifthDefinition,
              ),
            ],
          ),


        ],
      ),
    );
  }
}



Widget makePage1({image, title, content}) {
  return Container(
    padding: EdgeInsets.only(left: 50,right: 50),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.symmetric(horizontal: 20),
          child: Image.asset(image)

        ),
          SizedBox(height: 30,),
        Text(title, style: TextStyle(
          color: ColorSys.primary,
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),),
        SizedBox(height: 20,),
        Text(content, textAlign: TextAlign.center, style: TextStyle(color: ColorSys.gray, fontSize: 20,fontWeight: FontWeight.w400),)


      ],
    ),

  );
}


