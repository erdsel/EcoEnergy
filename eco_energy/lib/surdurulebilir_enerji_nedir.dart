import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class SurdurulebilirEnerjiNedir extends StatefulWidget {
  const SurdurulebilirEnerjiNedir({Key? key}) : super(key: key);

  @override
  State<SurdurulebilirEnerjiNedir> createState() => _SurdurulebilirEnerjiNedirState();
}

class _SurdurulebilirEnerjiNedirState extends State<SurdurulebilirEnerjiNedir> {
  late PageController _pageController;


  @override

  void _onScroll(){

  }

  void initState(){
    _pageController=PageController(
      initialPage: 0,
    )..addListener(_onScroll);
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(

          body: PageView(
            controller: _pageController,
            children: [
              makePage(1,'https://images.unsplash.com/photo-1527212986666-4d2d47a80d5f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80'
              , 'Güneş Enerjisi', 'Güneş enerjisi, Güneşteki hidrojen gazının helyuma dönüşmesi ile oluşan füzyon sürecinde ortaya çıkan ışıma enerjisidir. Bu enerjinin dünyaya yansıması olan güneş ışığından sürdürülebilir ve yenilenebilir enerji üretilebilir. Güneş enerjisi sera gazı emisyonuna sebep olmaz, bu yüzden temiz bir enerji kaynağıdır.'
              ),
              makePage(2,'https://media.istockphoto.com/id/1206172522/tr/foto%C4%9Fraf/yenilenebilir-r%C3%BCzgar-enerjisi.jpg?s=612x612&w=0&k=20&c=JeJdKDu-MfPhJhvWKoJe_C1ec07zNzSQa5OuP9jYS7E=', 'RÜZGAR ENERJİSİ', 'Rüzgâr, güneşin yeryüzünü eşit olmayan şekilde ısıtıp soğutmasının ve basınç farkları sonucu ortaya çıkan kuvvetlerin meydana getirdiği hava hareketleridir. Bu hava akımının sahip olduğu hareket enerjisi ise rüzgâr enerjisi olarak adlandırılır. Hava kitlesinin sahip olduğu kinetik enerji mekanik enerjiye dönüşür.' ),
              makePage(3,'https://media.istockphoto.com/id/1177101508/tr/foto%C4%9Fraf/drina-nehri-%C3%BCzerinde-hidroelektrik-santrali-perucac.jpg?s=612x612&w=0&k=20&c=wBgtiaM6ZARao_NZ_693xuDToJmUeGtgkSOMRhVVQSU=', 'Hidroelektrik Enerji', 'Hidroelektrik enerji santrallerinde akan suyun gücünden faydalanılarak elektrik üretilir. Ortaya çıkan enerji miktarı, suyun akış ya da düşüş hızına göre değişir. Yüksekten akan su büyük miktarda enerji taşır. Bu enerji, elektrik enerjisine dönüştürülerek kullanılır'),
              makePage(4,'https://media.istockphoto.com/id/172717230/tr/foto%C4%9Fraf/aerial-view-of-power-plant.jpg?s=612x612&w=0&k=20&c=LRKt-ousWcFLZGsXeRPt_jIWEFrCUINB8btN4LOa51g=', 'Jeotermal Enerji', 'Jeotermal enerji, dünyanın alt yüzeyinde elde edilen ısıdır. Su ve/veya buhar jeotermal enerjiyi dünya yüzeyine taşır. Özelliklerine bağlı olarak, jeotermal enerji ısıtma ve soğutma amacıyla veya temiz elektrik üretmek için kullanılabilir. Jeotermal enerji, temiz ve güvenli olduğu için tercih edilen bir enerji kaynağıdır. Türkiye, jeotermal enerji potansiyeline sahip ülkeler arasındadır. '),
              makePage(5,'https://media.istockphoto.com/id/1083500450/tr/foto%C4%9Fraf/%C3%A7i%C4%9F-kahve-%C3%A7ekirdekleri-bir-ka%C5%9F%C4%B1k-tutan-el.jpg?s=612x612&w=0&k=20&c=ACQF3bsvrrwM1SYlpUhvfixl6bja-c1a0t8SOisLDnE=', 'Biyokütle Enerjisi', 'Tarım atıkları, orman sektörü organik atıkları, hayvansal atıklar(mezbaha atıkları, dışkı, vb) veya şehir atık sularının oksijensiz ortamda çürütülerek; çeşitli su bitkileri gibi canlı (biyolojik) kaynaklar yolu ile elde edilen yakıta Biyogaz, bu enerji türüne Biyokütle Enerjisi (biomass) denilmektedir..'),

            ],
          ),
        ),
    );

  }
}

Widget makePage(int page,String s, String title, String description){
  late int totalPage=5;
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(image:NetworkImage(
      s

  ),
        fit: BoxFit.cover,
      )
    ),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          stops: [0.3,0.9],
          colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.2),
          ]
        )
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(page.toString(), style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                Text('/'+ totalPage.toString(), style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)
              ],
            ),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: GoogleFonts.poppins(fontSize: 50,  color: Colors.white),),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50 ),
                child: Text(description, style: GoogleFonts.poppins(fontSize: 20,  color: Colors.white.withOpacity(0.5)),)
              )


            ],
            )
            )
          ],
        ),
      ),
    ),
  );
}

