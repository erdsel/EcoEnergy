import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:son_hali/main.dart';



class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  String location ='Null, Press Button';
  String Address = 'search';
  String neredesin='';
  String Aciklama= '';
  late String email;
  late String password;
  bool showSpinner = false;
  ThemeData _lightTheme= ThemeData(
    //primarySwatch: Colors.lightGreenAccent,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.lightGreenAccent,
    brightness: Brightness.light,
  );
  ThemeData _darkTheme= ThemeData(
     // primarySwatch: Colors.lightGreenAccent,
      primaryColor:Colors.black,
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      hintColor: Colors.white

  );
  IconData _iconLight= Icons.wb_sunny;
  IconData _iconDark=Icons.nights_stay;
  bool _iconBool = false;

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);

    Placemark place = placemarks[0];
    Address = '-${place.name}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}';
    setState(()  {
    });
    if (place.administrativeArea == "Kocaeli" ||place.administrativeArea == "İstanbul"||place.administrativeArea == "İstanbul" ||place.administrativeArea == "Edirne" ||place.administrativeArea == "Kırklareli" ||place.administrativeArea == "Tekirdağ" ||place.administrativeArea == "Çanakkale" ||place.administrativeArea == "Yalova" ||place.administrativeArea == "Sakarya" ||place.administrativeArea == "Bilecik" ||place.administrativeArea == "Bursa"||place.administrativeArea == "Balıkesir"){
      neredesin ='Şu an Marmara Bölgesindesiniz.' ;
      Aciklama ='Güneş Enerjisi: Marmara Bölgesi, yüksek güneş ışığı miktarına sahip olduğu için, güneş enerjisi kullanımı için uygun bir bölgedir.Marmara Bölgesinde, güneş enerjisi panelleri ile çalışan büyük skaler güneş enerjisi santralleri yer almaktadır. Ayrıca, ev ve işyerlerinde de küçük ölçekli güneş enerjisi sistemleri bulunmaktadır.\n\nRüzgar Enerjisi: Marmara Bölgesi, özellikle deniz kıyısındaki rüzgar hızının yüksek olması sebebiyle, rüzgar enerjisi üretimi için uygun bir bölgedir. Marmara Bölgesinde, deniz kıyısındaki yüksek rüzgar hızı sebebiyle, birçok rüzgar enerjisi türbininin yer aldığı rüzgar enerjisi santralleri bulunmaktadır. \n\nJeotermal Enerji: Marmara Bölgesi, zengin jeotermal kaynaklarına sahiptir ve bu kaynaklar kullanılarak ısıtma ve elektrik üretimi yapılabilir. Marmara Bölgesindeki zengin jeotermal kaynaklar, birçok jeotermal enerji santralinin inşasına olanak tanımaktadır.\n\n Biogaz: Marmara Bölgesindeki tarım faaliyetleri sonucu oluşan atıklar, biogaz üretimi için kullanılabilir.Marmara Bölgesindeki tarım faaliyetleri sonucu oluşan atıklar, biogaz üretimi için kullanılabilir ve bölgedeki birçok biogaz projesi bulunmaktadır. Türkiyede diğer temiz enerji kaynaklarına göre daha yavaş ilerlese de yüksek potansiyel barındıran biyokütle kurulu gücünde en yüksek kapasite 139 megavatla İstanbulda bulunuyor.\n\n Hidroelektrik Enerji: Marmara Bölgesi, bol miktarda su kaynağına sahip olduğu için, hidroelektrik enerji üretimi için uygun bir bölgedir. ';
    };

    if( place.administrativeArea == "Bilecik" || place.administrativeArea == "Balıkesir" || place.administrativeArea == "Çanakkale" || place.administrativeArea == "Muğla" || place.administrativeArea == "Denizli" || place.administrativeArea == "Afyon" || place.administrativeArea == "Kütahya" || place.administrativeArea == "Uşak" || place.administrativeArea == "İzmir" || place.administrativeArea == "Aydın" || place.administrativeArea == "Manisa" || place.administrativeArea == "İzmir"  ){
      neredesin ='Şu an Ege Bölgesindesiniz.' ;
      Aciklama='Rüzgar Enerjisi: Ege bölgesinde rüzgar enerjisi potansiyeli yüksek olan alanlarda rüzgar türbinleri kurulabilir. Ülkemizde kurulu her 5 RESten biri İzmir sınırları içinde. Keza 4 kanat fabrikasının dördü de İzmirde üretim yapıyor. Türkiyedeki her 3 RESten biri İzmir-Manisa-Balıkesir üçgeninde enerji üretiyor. Dolayısıyla Ege Bölgesi bu anlamda tam bir hub konumunda. Ülkemiz 2021 sonundaki bin 676 MW jeotermal enerji kapasitesiyle dünyada dördüncü, Avrupada ise ilk sırada yer alıyor.\n\nGüneş Enerjisi: Güneş enerjisi potansiyeli yüksek olan Ege bölgesinde, güneş paneli sistemleri kurularak güneş enerjisi üretilebilir. Ege bölgesinde Milas ilçesinde, Türkiyenin ilk güneş enerjisi santrali kurulmuştur. Bu santral, yılda ortalama 15 GWh elektrik enerjisi üretmektedir ve bu enerji, elektrik dağıtım şebekesine katılmaktadır.\n\nJeotermal Enerji: Ege bölgesinde yer altı sıcak su kaynakları bulunmaktadır. Bu kaynaklar jeotermal enerji olarak kullanılabilir.Türkiyenin jeotermal enerji kapasitesi 6 ilde bulunan santrallerle 1676 bin megavata çıkarken, kurulu gücün yüzde 98inin bulunduğu Ege Bölgesi, en yüksek kapasiteye sahip bölge olarak ön plana çıkıyor.Türkiyenin jeotermal enerji kurulu gücünün tamamına yakınının bulunduğu Ege Bölgesi, elektrik üretiminin yanında gıda, sağlık, seracılık, ısıtma, soğutma, sebze ve meyve kurutma gibi alanlarda yatırımcılara ve yöre halkına fırsatlar sunuyor.Çoğunlukla lisanslı santrallerin bulunduğu Türkiyede mart sonu itibarıyla jeotermal enerji kurulu gücünde 872,8 megavatla Aydın lider durumda bulunuyor.Aydının ardından 379,4 megavatla Denizli ikinci sırada yer alıyor. Bu şehirleri, 378,7 megavatla Manisa, 30,5 megavatla Çanakkale, 12 megavatla İzmir ve 2,8 megavatla Afyonkarahisar takip ediyor.Böylelikle, Türkiyenin jeotermal enerjisinde 6 ilde bulunan santrallerle 1676 bin megavatı aşan kapasitesi bulunuyor.Türkiyenin enerjide dışa bağımlılığını azaltmak için jeotermal enerji önemli bir alternatif olarak değerlendirilirken, Türkiyenin neredeyse her bölgesi jeotermal enerji açısından yüksek potansiyele sahip bulunuyor.\n\nBiokütle Enerjisi: Ege bölgesinde yetişen tarım ve orman ürünleri biokütle enerjisi olarak kullanılabilir.';
    }

    if(place.administrativeArea == "Adana" || place.administrativeArea == "Antalya" || place.administrativeArea == "Burdur" || place.administrativeArea == "Hatay" || place.administrativeArea == "Isparta" || place.administrativeArea == "Mersin" || place.administrativeArea == "Osmaniye"   ){
      neredesin ='Şu an Akdeniz Bölgesindesiniz.' ;
      Aciklama= 'Rüzgar Enerjisi: Akdeniz bölgesinde, rüzgar enerjisi potansiyeli yüksek olan alanlarda rüzgar türbinleri kurulabilir.\n\nGüneş Enerjisi: Akdeniz bölgesinde, güneş enerjisi potansiyeli yüksek olduğundan güneş paneli sistemleri kurularak güneş enerjisi üretilebilir.Antalya ilinde Türkiyenin en büyük güneş enerjisi santrallerinden biri bulunmaktadır. Bu santral, yılda ortalama 50 GWh elektrik enerjisi üretmektedir ve bu enerji, elektrik dağıtım şebekesine katılmaktadır. Ayrıca, Akdeniz bölgesinde birçok rüzgar türbinli santral de bulunmaktadır.\n\nJeotermal Enerji: Akdeniz bölgesinde, yer altı sıcak su kaynakları bulunmaktadır. Bu kaynaklar jeotermal enerji olarak kullanılabilir.Jeotermal Elektrik Santral Yatırımcıları Derneği (JESDER) verilerine göre, Türkiyede üretilen enerjinin yüzde 2si jeotermalden elde ediliyor. Jeotermalde kurulu gücü bin 100 megavata ulaşan Türkiye, dünyada ABD, Filipinler ve Endonezyadan sonra 4üncü sırada yer alıyor. Ülke sınırları içinde ise bin 100 megavat kurulu gücün yüzde 64ü olan 671 megavatı barındıran Aydın, jeotermal yatırımında ilk sırada yer alıyor. Aydını 243 megavat kurulu güçle Denizli ve 166 megavat kurulu güçle Manisa izliyor.\n\nBiokütle Enerjisi: Akdeniz bölgesinde, yetişen tarım ve orman ürünleri biokütle enerjisi olarak kullanılabilir.';
    }

    if(place.administrativeArea == "Ankara" || place.administrativeArea == "Konya" || place.administrativeArea == "Kayseri" || place.administrativeArea == "Eskişehir" || place.administrativeArea == "Sivas" || place.administrativeArea == "Kırıkkale" || place.administrativeArea == "Aksaray" || place.administrativeArea == "Karaman" || place.administrativeArea == "Kırşehir" || place.administrativeArea == "Niğde" || place.administrativeArea == "Nevşehir" || place.administrativeArea == "Yozgat" || place.administrativeArea == "Çankırı"  ){
      neredesin ='Şu an İç Anadolu Bölgesindesiniz.' ;
      Aciklama= 'Rüzgar Enerjisi: İç Anadolu bölgesinde, rüzgar enerjisi potansiyeli yüksek olan alanlarda rüzgar türbinleri kurulabilir.\n\nGüneş Enerjisi: İç Anadolu bölgesinde, güneş enerjisi potansiyeli yüksek olduğundan güneş paneli sistemleri kurularak güneş enerjisi üretilebilir. İç Anadolu bölgesinde birçok güneş enerjisi santrali ve rüzgar türbinli santral de bulunmaktadır.\n\nJeotermal Enerji: İç Anadolu bölgesinde, yer altı sıcak su kaynakları bulunmaktadır. Bu kaynaklar jeotermal enerji olarak kullanılabilir.\n\nBiokütle Enerjisi: İç Anadolu bölgesinde, yetişen tarım ve orman ürünleri biokütle enerjisi olarak kullanılabilir. Konya ilinde Türkiyenin en büyük biokütle enerjisi santrallerinden biri bulunmaktadır. Bu santral, yılda ortalama 100 GWh elektrik enerjisi üretmektedir ve bu enerji, elektrik dağıtım şebekesine katılmaktadır.';
    }

    if(place.administrativeArea == "Gaziantep" || place.administrativeArea == "Diyarbakır" || place.administrativeArea == "Şanlıurfa" || place.administrativeArea == "Batman" || place.administrativeArea == "Adıyaman" || place.administrativeArea == "Siirt" || place.administrativeArea == "Mardin" || place.administrativeArea == "Kilis" || place.administrativeArea == "Şırnak"    ){
      neredesin ='Şu an Güneydoğu Anadolu Bölgesindesiniz.' ;
      Aciklama= 'Güneydoğu Anadolu Bölgesinin genel enerji yapısına bakıldığında, bölgenin enerji üretimi açısından çoğunluğunun yenilenebilir önemli kaynaklara sahip olduğu görülmektedir. Bölge, ülkenin hidroelektrik enerji üretiminin % 39.84ü, petrol kaynaklarının % 95i, değerlendirilebilir önemli miktarda jeotermal, linyit ve asfaltit kaynaklarının yanında güneş ve rüzgar enerjisi potansiyeli de düşünüldüğünde, enerji ve su kaynakları açısından oldukça önemli bir potansiyele sahiptir.Güneydoğu Anadolu bölgesinde birçok güneş enerjisi santrali, jeotermal enerji santralleri ve biokütle enerjisi santralleri de bulunmaktadır.\n\n Rüzgar Enerjisi: Güneydoğu Anadolu bölgesinde, rüzgar enerjisi potansiyeli yüksek olan alanlarda rüzgar türbinleri kurulabilir. Bu türbinler, rüzgarın enerjisini elektrik enerjisine dönüştürerek elektrik üretir. Siirt ilinde Türkiyenin en büyük rüzgar enerjisi santrallerinden birisi bulunmaktadır. Bu santral, yılda ortalama 200 GWh elektrik enerjisi üretmektedir ve bu enerji, elektrik dağıtım şebekesine katılmaktadır.\n\nGüneş Enerjisi: Güneydoğu Anadolu bölgesinde, güneş enerjisi potansiyeli yüksektir ve bu nedenle güneş paneli sistemleri kurularak güneş enerjisi üretilebilir.\n\nJeotermal Enerji: Güneydoğu Anadolu bölgesinde, yer altı sıcak su kaynakları bulunmaktadır. Bu kaynaklar jeotermal enerji olarak kullanılabilir.\n\nBiokütle Enerjisi: Güneydoğu Anadolu bölgesinde, orman ürünleri ve tarım atıkları biokütle enerjisi olarak kullanılabilir.';
    }

    if(place.administrativeArea == "Ağrı" || place.administrativeArea == "Ardahan" || place.administrativeArea == "Bitlis" || place.administrativeArea == "Bingöl" || place.administrativeArea == "Elazığ" || place.administrativeArea == "Erzincan" || place.administrativeArea == "Erzurum" || place.administrativeArea == "Hakkari" || place.administrativeArea == "Iğdır" || place.administrativeArea == "Kars" || place.administrativeArea == "Malatya" || place.administrativeArea == "Muş" || place.administrativeArea == "Tunceli" || place.administrativeArea == "Van"     ){
      neredesin ='Şu an Doğu Anadolu Bölgesindesiniz.' ;
      Aciklama='Şimdilik ülkenin yenilenebilir enerji üretimine  önemli bir katkısı olmayan Doğu Anadolu Bölgesi, güneş , rüzgar ve Jeotermal enerji kaynakları için önemli bir rezerve sahip. Erzincan ilinde jeotermal enerji santralı bulunmaktadır. Bu santral, yer altındaki sıcak su kaynaklarından enerji üretmekte ve bu enerji elektrik dağıtım şebekesine katılmaktadır. Türkiyenin Yıllık Güneş Enerjisi Potansiyeli Haritasına göre bölgenin yıl içindeki  toplam güneş enerjisi 1460 kWh/m2, güneşleme süresi ise 2993 saat/yıl. Bölge, ülke genelinde  güneş ışınlarının en fazla geldiği üçüncü bölge olarak tespit edildi. Başı çeken kent ise Van.\n\n Doğu Anadolu Bölgesi güneş enerjisinde olduğu gibi rüzgar enerjisi konusunda da oldukça avantajlı konumda. Iğdır hariç bölgenin önemli bölümü 1500 rakımın üzerinde. Bu da önemli bir rüzgar enerjisi potansiyeli anlamına geliyor. Yine yüzey şekilleri ve tünel etkisi gibi rüzgar enerjisini açığa çıkaracak olan parametrelerin neredeyse tamamı, uygun bir ortam sunuyor.Bölgenin jeotermal enerji kapasitesi de, diğer  yenilebilir enerji kaynakları gibi oldukça güçlü.\n\nJeotermal enerji,  yerkürenin içinden yeryüzüne kadar ulaşan çatlak ve kırıklardan yüzeye çıkan su, gaz ve buhardan faydalanılarak elde edilen bir yenilenebilir enerji kaynağı. Özel olarak açılan sondaj kuyularından çıkışı sağlanan su, buhar ve gazdan oluşan jeotermal akışkanlar, büyük derinliklerden yeryüzüne ulaşırken içerdiği gazların ve sıcaklığının etkisiyle kayaçlarla etkileşime giriyor ve birçok kimyasalı bünyesine alarak yeryüzüne ulaştırıyor. Türkiye, jeotermal enerji kaynakları bakımından zengin bir ülke; yaklaşık 1500MWlık kurulu güç kapasitesi ile dünyada dördüncü konumda.';
    }


    if(place.administrativeArea == "Amasya" || place.administrativeArea == "Artvin" || place.administrativeArea == "Bartın" || place.administrativeArea == "Bayburt" || place.administrativeArea == "Bolu" || place.administrativeArea == "Çorum" || place.administrativeArea == "Düzce" || place.administrativeArea == "Gümüşhane" || place.administrativeArea == "Giresun" || place.administrativeArea == "Karabük" || place.administrativeArea == "Kastamonu" || place.administrativeArea == "Ordu" || place.administrativeArea == "Rize" || place.administrativeArea == "Samsun" || place.administrativeArea == "Sinop" || place.administrativeArea == "Tokat" || place.administrativeArea == "Trabzon"|| place.administrativeArea == "Zonguldak"    ){
      neredesin ='Şu an Karadeniz Bölgesindesiniz.' ;
      Aciklama='Rüzgar Enerjisi: Karadeniz bölgesinde, rüzgar enerjisi potansiyeli yüksek olan alanlarda rüzgar türbinleri kurulabilir. Bu türbinler, rüzgarın enerjisini elektrik enerjisine dönüştürerek elektrik üretir.\n\nGüneş Enerjisi: Karadeniz bölgesinde, güneş enerjisi potansiyeli fazladır ve bu nedenle güneş paneli sistemleri kurularak güneş enerjisi üretilebilir.\n\nHidroelektrik Enerji: Karadeniz bölgesinde, güçlü su kaynakları bulunmaktadır ve bu kaynaklar hidroelektrik enerji olarak kullanılabilir.\n\nBiokütle Enerjisi: Karadeniz bölgesinde, orman ürünleri ve tarım atıkları biokütle enerjisi olarak kullanılabilir.Karadeniz bölgesinde birçok hidroelektrik enerji santrali bulunmaktadır. Bunlar, nehirlerin su enerjisini elektrik enerjisine dönüştürerek elektrik üretir. Ayrıca, Karadeniz bölgesinde güneş enerjisi santralleri, rüzgar enerjisi santralleri ve biokütle enerjisi santralleri de bulunmaktadır. Bu santrallar, doğal kaynakları sürdürülebilir bir şekilde kullanarak elektrik enerjisi üretir ve bu enerji elektrik dağıtım şebekesine katılır.';
    }
  }
/*${place.subLocality}\n\n,${place.locality}\n\n,*/
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
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SizedBox(height: 10,),
              ElevatedButton(

                  onPressed: () async{
                    Position position = await _getGeoLocationPosition();
                    location ='Lat: ${position.latitude} , Long: ${position.longitude}';
                    GetAddressFromLatLong(position);
                  }, child: Padding(
                padding: const EdgeInsets.all(12.0),
                       child: Text('Konumunu ve Bulunduğun Bölgedeki Sürdürülebilir Enerji Kaynaklarını Öğren!', style: GoogleFonts.poppins(fontSize: 15, color: Colors.white),),
              )
              ),

              SizedBox(height: 10,),
             // Text(location,style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blueGrey),),
              SizedBox(height: 10,),
              Text('ADRESİNİZ',style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey),),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: [
                    Container(child: Text('${Address}' ,style:  GoogleFonts.poppins(fontSize: 20, color: Colors.blueGrey),)),
                    SizedBox(height: 10,),
                    Container(child: Text('${neredesin}', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey),)),
                    SizedBox(height: 10,),
                    Container(child: Text('${Aciklama}', style: GoogleFonts.poppins(fontSize: 15,  color: Colors.blueGrey),)),


                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


