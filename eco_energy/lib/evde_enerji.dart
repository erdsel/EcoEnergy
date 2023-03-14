import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:son_hali/surdurulebilir_enerji_nedir.dart';
class EvdeEnerjiNedir extends StatefulWidget {
  const EvdeEnerjiNedir({Key? key}) : super(key: key);

  @override
  State<EvdeEnerjiNedir> createState() => _EvdeEnerjiNedirState();
}

class _EvdeEnerjiNedirState extends State<EvdeEnerjiNedir> {
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
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      home: Scaffold(

        body: PageView(
          controller: _pageController,
          children: [
            makePage(1,'https://media.istockphoto.com/id/1336086605/tr/foto%C4%9Fraf/little-girl-near-open-refrigerator-in-kitchen.jpg?s=612x612&w=0&k=20&c=cd-RMrO8ebVTru1ceO_di7O02yVTWxp41OeQk6A7c7c='
                , 'Buzdolabı', '– Buzdolabını, fırın, radyatör gibi ısı kaynaklarından ve güneş ışınlarından uzağa yerleştiriniz.\nBuzdolabını yerleştirirken arkasında ve yanlarında boşluk bırakınız.\nBuzdolabının kapılarını uzun süre açık bırakmayınız.\nBuzdolabına konulmadan önce, gıdaların fazla olan paketleri çıkarınız. Koruyucuların kalınlığı arttıkça, buzdolabı içindekileri serin tutmak için daha çok enerji harcayacaktır.'
            ),
            makePage(2,'https://media.istockphoto.com/id/1149083377/tr/foto%C4%9Fraf/gri-renkte-izole-siyah-ekran-ile-modern-%C3%A7ama%C5%9F%C4%B1r-makinesi.jpg?s=612x612&w=0&k=20&c=cDId7ZZHJ9nYq8SioT5eenevsjh27PBnJQ35Zgn-pbY=', 'Çamaşır Makinası', 'Çamaşır makinesini, kapasiteyi aşmayacak şekilde tam dolulukta çalıştırınız. (Tam kapasiteyi pratik olarak, çamaşırların üzerine bastırıp, çamaşır ile tambur arasındaki boşluğun yaklaşık bir karış olması ile belirleyebilirsiniz)\nYıkamayı güçleştireceği için fazla deterjan koymayınız.\nÇamaşırlarınızı düşük sıcaklıklarda yıkayınız.\nÇamaşırlarınızın kiri ya da miktarı az ise ekonomik/ hızlı programları tercih ediniz.'),
            makePage(3,'https://media.istockphoto.com/id/1191850935/tr/foto%C4%9Fraf/toddler-k%C4%B1z-bula%C5%9F%C4%B1k-makinesi-bo%C5%9Faltmak-i%C3%A7in-yard%C4%B1m.jpg?s=612x612&w=0&k=20&c=_pNQ5p9F76ZlPZqjZRWJ1cQFWXG68jDe7mHgLs4evYk=', 'Bulaşık Makinası', 'Bulaşık makinenizi, kapasiteyi aşmayacak şekilde tam dolulukta çalıştırınız.\nAz miktarda bulaşık yıkarken ekonomik programları tercih ediniz.\nBulaşıkları makineye yerleştirmeden önce bulaşıklarda bulunan kaba atıkları temizleyiniz.\nBulaşıklarınızı düşük sıcaklıklarda yıkamayı tercih ediniz.'),
            makePage(4,'https://media.istockphoto.com/id/1411877915/tr/foto%C4%9Fraf/industrial-style-light-bulb-energy-crisis-concept-with-electricity.jpg?s=612x612&w=0&k=20&c=gH6bcO04nNOEyXwn12x1ekN4E_GicAzvvpoj4Qexqv4=', 'Lamba', 'Akkor lambaları kompakt floresan lambalarla değiştirmelisiniz\nAydınlatma sisteminizi gerekmedikçe kullanmamalısınız.\nOrtamdaki ışık miktarına dikkat etmelisiniz.\nÖzel ışıklandırmalarda abartıya kaçmamalısınız.\nAydınlatma sisteminizin periyodik bakımını ihmal etmemelisiniz.'),
            makePage(5,'https://media.istockphoto.com/id/1314537465/tr/foto%C4%9Fraf/tan%C4%B1nmayan-bir-kad%C4%B1n%C4%B1n-evde-mutfak-lavabosunda-ellerini-y%C4%B1kad%C4%B1%C4%9F%C4%B1n%C4%B1n-g%C3%B6r%C3%BCnt%C3%BCs%C3%BC.jpg?s=612x612&w=0&k=20&c=DeYyDYNVsYwvhOFzeW6TAJNYLCybzseaw8BLrjTUZ1Y=', 'Su Kullanımı', 'Musluklarınızı Gereksiz Yere Açık Bırakmayın\nTasarruf Etmenize Yardımcı Olacak Bataryalar Tercih Edin\nEğer bataryalarınız yani musluklarınız sorunluysa ve su damlatıyorsa bu durumda su boşa akıyor demektir. Bu sebeple bozuk bataryalarınızı zaman geçirmeden değiştirmenizi ya da onarmanızı öneririz.\nSebze ve Meyveleri Akan Suda Yıkamayın\nSifon Sisteminde Su Tüketimini Azaltacak Önlemler Alın'),
            makePage(6,'https://media.istockphoto.com/id/471505873/tr/foto%C4%9Fraf/changing-channels-with-remote-controller.jpg?s=612x612&w=0&k=20&c=XQpF8Paxwx_9zvvnK5XLytVnLOdZZY8uHByRC8Xn8hI=', 'Televizyon', 'Evde kullanılan televizyon, müzik seti, bilgisayar gibi elektronik aletler stand-by (bekleme) konumunda da elektrik tüketmeye devam ederler. Bu elektronik aletler kullanılmadığı zamanlarda stand-by konumunda bırakılmamalı, açma – kapama düğmelerinden kapatılmalı ve hatta fişleri prizden çekilmelidir.\nBekleme konumunda çekilen elektrik gücü düşük olsa da, uzun süre bu konumda bırakılan elektronik aletlerin tükettikleri elektrik enerjisi çok büyük boyutlara ulaşabilmektedir.'),

            makePage(7,'https://media.istockphoto.com/id/1317807843/tr/foto%C4%9Fraf/diz%C3%BCst%C3%BC-bilgisayarda-yazan-i%C5%9F-kad%C4%B1n%C4%B1-ellerinin-yak%C4%B1n-%C3%A7ekim-foto%C4%9Fraf%C4%B1.jpg?s=612x612&w=0&k=20&c=abr4QJGvikBRGQtwpUJvVyQuEzLT8n4YmKvrjMN3-FE=', 'Bilgisayar', 'Bilgisayarınızı işi bittikten sonra mutlaka kapatın.\nUzun süre kullanmayacaksanız fişini çekin.\nBilgisayarınızı tasarruf modunda çalıştırın.\nLCD monitörler olmazsa olmaz.\nMonitörünüzün parlaklığını azaltın.\nÇift monitör ve büyük ekran kullanmak zorunda değilsiniz.'),
            makePage(8,'https://images.unsplash.com/photo-1610056494071-9373f12bf769?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c29ja2V0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60', 'Elektrik Kullanımı', 'Enerji verimliliği sağlayan elektronik aletler ve aydınlatma sistemleri kullanın.\nİhtiyacınız dışındaki elektrikli cihazların fişlerini prizden çıkarın.\nBina yalıtımınızda enerji verimliliğine yönelik teknolojileri tercih edin. Pencerelerinizde iki ya da üç katlı cam kullanın.\nOdalarınızı gün ışığından en iyi faydalanabileceğiniz şekilde kullanın.\nRadyatörleri mobilyaların arkasına saklamayın.'),
          ],
        ),
      ),
    );

  }
}

Widget makePage(int page,String s, String title, String description){
  late int totalPage=8;
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
                Text(title,style: GoogleFonts.poppins(fontSize: 50,  color: Colors.white),),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50 ),
                  child: Text(description,  style: GoogleFonts.poppins(fontSize: 20,  color: Colors.white.withOpacity(0.5)),),
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

