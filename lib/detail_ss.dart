import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coba_youtube/home_page.dart';
import 'package:coba_youtube/item_card.dart';
import 'package:coba_youtube/youtube_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:indent/indent.dart';

void main() {
  runApp(DetailEnam());
}

class DetailEnam extends StatelessWidget {
  
  final TextEditingController namaController = TextEditingController();
  final TextEditingController komentarController = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String namaOrang = '', komentarOrang = '';
  bool? isActive = false;
  bool isFavorite = false;

  final namaController = TextEditingController();
  final komentarController = TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose

    namaController.dispose();
    komentarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference komenss = firestore.collection("komenss");
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 30, 97),
      appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text("Shooting Star"),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (_) {
                  return SecondPage(email: '',);
                }));
              },
              icon: Icon(Icons.arrow_back_ios_new)),
          ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image(
                  image: AssetImage("assets/images/poster ss.jpg"),
                  color: Colors.black.withOpacity(0.9),
                  colorBlendMode: BlendMode.softLight,
                ),
                SafeArea(
                  child: Padding(
                  padding: EdgeInsets.only(top: 90, left: 165),
                  child: GestureDetector(
                    onTap: () async{
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CustomYoutubePlayer("https://youtu.be/5XeOQbQvgvI")));
                      },
                    child: Column(
                      children: [
                        Icon(
                          Icons.play_circle_outline,
                          color: Colors.amber,
                          size: 70,
                        ),
                      ],
                    ),
                  ),
                )),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                "Shooting Star",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, bottom: 10, right: 10),
              child: Text(
                "Shooting Stars tentang orang-orang yang bekerja di belakang layar industri hiburan, seperti tim PR, manajer, dan reporter yang bekerja untuk seorang bintang dan mencoba membuat orang itu bersinar. Oh Han-Byeol (diperankan oleh Lee Sung-Kyung) adalah pemimpin tim PR dari sebuah perusahaan manajemen. Dia memiliki keterampilan yang sangat baik dalam pidato dan manajemen krisis. Sementara Gong Tae-Sung (diperankan oleh Kim Young-Dae) adalah aktor top dari perusahaan manajemen tempat Oh Han-Byeol bekerja. Dia dicintai oleh orang-orang karena citranya sebagai orang yang baik dan sopan. Tapi, Gong Tae-Sung punya sisi lain. Dia memiliki keinginan yang kuat untuk menang dan temperamen yang tinggi. Oh Han-Byeol dan Gong Tae-Sung bertengkar hampir dalam segala hal, tetapi hubungan mereka berkembang secara romantis.".indent(5),
                textAlign: TextAlign.justify,style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 12)),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "Komentar",
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Divider(
                thickness: 5,
                color: Colors.pinkAccent,
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 18)),
            //// VIEW DATA HERE
            StreamBuilder<QuerySnapshot>(
              stream: komenss.snapshots(),
              builder: (_, snapshot) {
                return (snapshot.hasData)
                    ? Column(
                        children: snapshot.data!.docs
                            .map(
                              (e) => ItemCard(
                                e.get('nama'),
                                e.get('komentar'),
                                onDelete: () {
                                  komenss.doc(e.id).delete();
                                },
                              ),
                            )
                            .toList(),
                      )
                    : Text('Loading...');
              },
            ),
            SizedBox(height: 50),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(color: Colors.pinkAccent, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(-5, 0),
                      blurRadius: 15,
                      spreadRadius: 3)
                ]),
                width: double.infinity,
                height: 180,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            style: TextStyle(color: Colors.white),
                            controller: namaController,
                            decoration: InputDecoration(
                              hintText: "Nama",
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            maxLines: 2,
                            controller: komentarController,
                            decoration: InputDecoration(
                              hintText: "Komentar",
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 130,
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 20, 30, 97),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: Text(
                            'Kirim',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 17,
                            ),
                          ),
                          onPressed: () {
                            //// ADD DATA HERE
                            komenss.add({
                              'nama': namaController.text,
                              'komentar': komentarController.text,
                            });

                            namaController.text = '';
                            komentarController.text = '';
                          }),
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
