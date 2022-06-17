import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coba_youtube/home_page.dart';
import 'package:coba_youtube/item_card.dart';
import 'package:coba_youtube/youtube_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:indent/indent.dart';

void main() {
  runApp(DetailTiga());
}

class DetailTiga extends StatelessWidget {
  // const DetailTiga({Key? key}) : super(key: key);
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
    CollectionReference komenbp = firestore.collection("komenbp");
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 30, 97),
      appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text("Bussiness Proposal"),
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
                  image: AssetImage("assets/images/poster bp.png"),
                  color: Colors.black.withOpacity(0.9),
                  colorBlendMode: BlendMode.softLight,
                ),
                SafeArea(
                  child: Padding(
                  padding: EdgeInsets.only(top: 70, left: 165),
                  child: GestureDetector(
                    onTap: () async{
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CustomYoutubePlayer("https://youtu.be/XRU1BtiulXw")));
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
                "Bussiness Proposal",
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
                "Drama ini menceritakan kisah cinta seorang Shin Ha-Ri (Kim Se-Jeong) karyawan perempuan muda yang lajang dan menyukai seorang pria tetapi ternyata sudah mempunyai pacar. Oleh karena itu, Ia menemui temannya Jin Young-Seo (Seol In-A) putri dari keluarga kaya raya.Shin Ha Ri justru diminta tolong untuk datang ke kencan buta Jin Young-Seo yang sudah diatur keluarganya dan akan memberikan uang agar ia ditolak kencan butanya ini. Namun, ternyata teman kencan butanya ini adalah CEO dari perusahaan Shin Ha Ri yang sangat dingin dan hanya memikirkan pekerjaannya sehingga ia sudah malas berurusan dengan kencan buta dan berniat untuk menikah dengan orang yang kencan buta saat itu juga agar kakeknya pemilik perusahaan membiarkannya bebas. Petemuan yang tidak disengaja ini membuat mereka harus menghadapi berbagai tantangan dan munculnya rasa sayang satu sama lain dibalik kebohongan manis ini.".indent(5),
                textAlign: TextAlign.justify,
                style: TextStyle(
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
            Padding(padding: EdgeInsets.only(bottom: 20)),
            //// VIEW DATA HERE
            StreamBuilder<QuerySnapshot>(
              stream: komenbp.snapshots(),
              builder: (_, snapshot) {
                return (snapshot.hasData)
                    ? Column(
                        children: snapshot.data!.docs
                            .map(
                              (e) => ItemCard(
                                e.get('nama'),
                                e.get('komentar'),
                                onDelete: () {
                                  komenbp.doc(e.id).delete();
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
                            komenbp.add({
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
