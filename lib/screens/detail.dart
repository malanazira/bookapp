import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';
import 'package:bookapp/screens/categoriescree.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            //color: Color(0xFF6456146),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 550),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF6456146),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
            ),
          ),
            Positioned(
            top: 30,
            right: 120,
            child: Container(
              height: 50,
              width: 500,
              //color: Colors.amber,
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                
              )
              )
            ),

             Positioned(
            top: 40,
            right: 140,
            child: Container(
              height: 50,
              width: 120,
              //color: Colors.amber,
              child: Text(
                'Deskripsi',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                  fontSize:  24
                ),
                
              )
              )
            ),
          
          Positioned(
            top: 110,
            left: 45,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                "https://th.bing.com/th/id/OIP.N47nvI5m1bZilWOmict9bQHaLe?pid=ImgDet&w=661&h=1024&rs=1",
                scale: 5.5,
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 180,
            child: Container(
              height: 150,
              width: 180,
              //color: Colors.amber,
              child: Text(
                "Atomic Habits: An Easy & Proven Way to Build Good Habits & Break Bad Ones",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            top: 320,
            left: 50,
            child: Container(
              height: 105,
              width: 315,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3))
                  ]),
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [Text("320",
                      style: TextStyle( fontFamily: 'Nunito', fontSize: 12, fontWeight: FontWeight.bold),
                      ), Text("halaman")],
                    ),
                    VerticalDivider(
                      color: Colors.black,
                      width: 5,
                      thickness: 1,
                      endIndent: 50,
                    ),
                    Column(
                      children: [Text("Indonesia",
                      style: TextStyle( fontFamily: 'Nunito', fontSize: 12, fontWeight: FontWeight.bold),
                      ), Text("bahasa")],
                    ),
                    VerticalDivider(
                      color: Colors.black,
                      width: 5,
                      thickness: 1,
                      endIndent: 50,
                    ),
                    Column(
                      children: [Text("2020", 
                      style: TextStyle( fontFamily: 'Nunito', fontSize: 12, fontWeight: FontWeight.bold),
                      ), Text("Terbit")],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 380, // Atur posisi tombol sesuai kebutuhan
            left: 68, // Atur posisi tombol sesuai kebutuhan
            child: ElevatedButton(
              onPressed: () {
                // Aksi yang akan dijalankan saat tombol ditekan
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.amber, minimumSize: Size(280, 30)),
              child: Text("Pinjam"),
            ),
          ),
          Positioned(
            top: 450,
            left: 30,
            child: Container(
              child: Text("Deskripsi buku",
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
          ),
            Positioned(
            top: 480,
            left: 30,
            child: Container(
              width: 315,
              child: ReadMoreText(
                "Atomic Habits adalah buku yang luar biasa tentang kekuatan kebiasaan kecil. Penulis James Clear menjelaskan secara mendalam tentang bagaimana kita dapat membangun kebiasaan yang baik dan mengubah hidup kita. Dengan ilmu yang didukung penelitian ilmiah, buku ini memberikan wawasan berharga tentang bagaimana kebiasaan kecil dapat memberikan dampak besar pada kehidupan kita. Bacalah buku ini dan pelajari cara membangun kebiasaan positif dalam hidup Anda.\n Atomic Habits akan membentuk kembali cara Anda berpikir tentang kemajuan dan kesuksesan, dan memberi Anda alat dan strategi yang Anda butuhkan untuk mengubah kebiasaan Anda.",
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 14,
                ),
                trimLines: 8, // Jumlah baris awal yang ditampilkan
                colorClickableText: Colors.blue, // Warna teks yang dapat diklik
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Read more',
                trimExpandedText: 'Show less',
                textAlign: TextAlign.justify,
                moreStyle: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                lessStyle: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
