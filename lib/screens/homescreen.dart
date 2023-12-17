import 'package:bookapp/screens/detail.dart';
import 'package:bookapp/screens/listrekomendasi.dart';
import 'package:bookapp/screens/listpopuler.dart';
import 'package:flutter/material.dart';
// import 'package:bookapp/models/product.dart';
import 'package:bookapp/viewmodels/rekomendasimodel/fetch_https.dart';
import 'package:bookapp/viewmodels/populermodel/fetch_https.dart';
// import 'package:flutter_helloworld/screens/categoriescreen.dart';
// import 'package:flutter_helloworld/models/product1.dart';

class homescreen extends StatelessWidget {
  homescreen({Key? key}) : super(key: key);
  final ApiFetch bookk = ApiFetch();
  final ApiFetch2 bookk2 = ApiFetch2();

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 80, left: 16, right: 16, bottom: 10),
              decoration: BoxDecoration(
                  color: Color(0xFF6456146),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Selamat Datang',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Icon(
                        Icons.notifications,
                        size: 32,
                        color: Colors.white,
                      )
                    ],
                  ),
                  Text(
                    'Yuzema Mala',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24, right: 16, left: 16),
              height: 48,
              width: double.infinity,
              // color: Colors.amber,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rekomendasi',
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Buku yang mungkin anda suka',
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 32,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Color(0xFF6456146),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Rekomendasi()),
                          );
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    11), // Padding kiri agar teks tidak terlalu dekat dengan tepi
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Rekomendasi()),
                                );
                              },
                              child: Text(
                                'Lihat Semua',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Nunito',
                                    fontSize: 11),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
            Container(
                margin: EdgeInsets.only(right: 12, left: 12, bottom: 4),
                height: 220,
                width: double.infinity,
                child: FutureBuilder(
                    future: bookk2.getapiData(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // You can return a loading indicator or some placeholder widget here
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        // Handle the error case
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 150,
                            mainAxisExtent: 200,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            var book2 = snapshot.data![index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return BookDetail(
                                      item: book2,
                                    );
                                  },
                                ));
                              },
                              child: Container(
                                  child: Column(children: [
                                Container(
                                  height: 100,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                    child: Image.network(
                                      book2.photo, // Use imageUrl instead of imgUrl
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.only(left: 6),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(padding: EdgeInsets.only(top: 4)),
                                      Container(
                                        child: Text(
                                          // Join the list of authors into a string
                                          book2.autor,
                                          style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 10,
                                          ),
                                        ),
                                        padding: EdgeInsets.only(bottom: 10),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Text(
                                          book2.title,
                                          style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        padding: EdgeInsets.only(bottom: 10),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star_rounded,
                                              size: 20,
                                            ),
                                            Text(
                                              book2.rate,
                                              style: TextStyle(
                                                fontFamily: "Nunito",
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                )
                              ])),
                            );
                          },
                        );
                      }
                    })),
            Container(
              margin: EdgeInsets.only(top: 24, right: 16, left: 16),
              height: 48,
              width: double.infinity,
              // color: Colors.amber,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Populer',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Nunito'),
                        ),
                        Text(
                          'Bacaan favorit banyak orang',
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: 32,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Color(0xFF6456146),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Populer()),
                          );
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 11),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Populer()),
                                );
                              },
                              // Padding kiri agar teks tidak terlalu dekat dengan tepi
                              child: Text(
                                'Lihat Semua',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Nunito',
                                    fontSize: 11),
                              ),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 12, left: 12, bottom: 4),
                height: 220,
                width: double.infinity,
                child: FutureBuilder(
                    future: bookk.getapiData(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // You can return a loading indicator or some placeholder widget here
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        // Handle the error case
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 150,
                            mainAxisExtent: 200,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            var book = snapshot.data![index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return BookDetail(
                                      item: book,
                                    );
                                  },
                                ));
                              },
                              child: Container(
                                  child: Column(children: [
                                Container(
                                  height: 100,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                    child: Image.network(
                                      book.photo, // Use imageUrl instead of imgUrl
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.only(left: 6),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(padding: EdgeInsets.only(top: 4)),
                                      Container(
                                        child: Text(
                                          // Join the list of authors into a string
                                          book.autor,
                                          style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 10,
                                          ),
                                        ),
                                        padding: EdgeInsets.only(bottom: 10),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Text(
                                          book.title,
                                          style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        padding: EdgeInsets.only(bottom: 10),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star_rounded,
                                              size: 20,
                                            ),
                                            Text(
                                              book.rate,
                                              style: TextStyle(
                                                fontFamily: "Nunito",
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                )
                              ])),
                            );
                          },
                        );
                      }
                    })),
            Container(
              margin: EdgeInsets.only(top: 10, right: 16, left: 16),
              height: 42,
              width: double.infinity,
              // color: Colors.amber,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kegiatan Menarik',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 150.0,
              decoration: BoxDecoration(
                  // color: Colors.red[200],
                  borderRadius: const BorderRadius.all(Radius.circular(16.0))),
              child: SizedBox(
                height: 80.0,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 120.0,
                          width: 250,
                          margin: const EdgeInsets.only(left: 12.0),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://www.ikapi.org/wp-content/uploads/2023/03/Launch-IIBF-2023-1-1080x675.jpg"),
                                  fit: BoxFit.cover),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}