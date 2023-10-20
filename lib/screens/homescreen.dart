import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bookapp/models/product.dart';
import 'package:bookapp/screens/categoriescree.dart';

class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(items: [
      //   BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
      //   BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
      //   BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
      // ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 36, left: 16, right: 16, bottom: 10),
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
                  SizedBox(height: 20),
                  Container(
                      margin: EdgeInsets.only(top: 5, bottom: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Judul, pengarang, atau penerbit",
                              hintStyle: TextStyle(
                                fontFamily: 'Nunito',
                                color: Color(0xFF6A5A5A5),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                size: 28,
                              )),
                        ),
                      ),
                      )

                ],
              ),
            ),




            Container(
              margin: EdgeInsets.only(top: 24, right: 16, left: 16),
              height: 44,
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
                          'Untuk Anda',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                              fontSize: 18, fontWeight: FontWeight.w600),
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

                    height: 36,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Color(0xFF6456146),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => categoriescreen()),
                          );
                        },


                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal:11), // Padding kiri agar teks tidak terlalu dekat dengan tepi
                        child: Text
                        (
                          'Lihat Semua',
                          style: TextStyle(color: Colors.white,
                          fontFamily: 'Nunito',
                          fontSize: 12),
                          
                        ),
                        
                      ),
                    ),
                  ),
                  ),
                ]
              ),
            ),

             Container(
              margin: EdgeInsets.only(right: 12, left: 12, bottom: 4),
              height: 240,
              width: double.infinity,
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150,
                      mainAxisExtent: 200,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemCount: ProductBookapp.display2.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item1 = ProductBookapp.display2;
                    return Container(
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12)),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12)),
                              child: Image.network(
                               ProductBookapp.display1[index]['photo'],
                                fit: BoxFit.cover, // Menyesuaikan gambar untuk memenuhi Container
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
                                  child: Text(ProductBookapp.display1[index]['autor'],
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 10

                                  )),
                                  padding: EdgeInsets.only(bottom: 10),
                                  ),
                                  Container(
                                    height: 50,
                                    child: Text(ProductBookapp.display1[index]['title'],
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    )),
                                     padding: EdgeInsets.only(bottom: 10),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(Icons.star_rounded,
                                        size: 20,),
                                        Text("4.8",
                                        style: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 14,
                                        ),),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.grey.withOpacity(0.2), // Warna bayangan
                              spreadRadius:
                                  5, // Seberapa jauh bayangan menyebar dari objek
                              blurRadius: 7, // Seberapa buram bayangan
                              offset: Offset(0, 3), // Posisi bayangan (X,Y)
                            ),
                          ]),
                    );
                  }
                  ),
            ),



            Container(
              margin: EdgeInsets.only(top: 24, right: 16, left: 16),
              height: 45,
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
                              fontSize: 18, fontWeight: FontWeight.w600,
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
                    height: 36,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Color(0xFF6456146),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                11), // Padding kiri agar teks tidak terlalu dekat dengan tepi
                        child: Text(
                          'Lihat Semua',
                          style: TextStyle(color: Colors.white,
                          fontFamily: 'Nunito',
                          fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 12, left: 12, bottom: 4),
              height: 240,
              width: double.infinity,
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150,
                      mainAxisExtent: 200,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemCount: ProductBookapp.display2.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item1 = ProductBookapp.display2;
                    return Container(
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12)),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12)),
                              child: Image.network(
                               ProductBookapp.display2[index]['photo'],
                                fit: BoxFit.cover, // Menyesuaikan gambar untuk memenuhi Container
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
                                  child: Text(ProductBookapp.display2[index]['autor'],
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 10

                                  )),
                                  padding: EdgeInsets.only(bottom: 10),
                                  ),
                                  Container(
                                    height: 50,
                                    child: Text(ProductBookapp.display2[index]['title'],
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    )),
                                     padding: EdgeInsets.only(bottom: 10),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(Icons.star_rounded,
                                        size: 20,),
                                        Text("4.8",
                                        style: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 14,
                                        ),),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.grey.withOpacity(0.2), // Warna bayangan
                              spreadRadius:
                                  5, // Seberapa jauh bayangan menyebar dari objek
                              blurRadius: 7, // Seberapa buram bayangan
                              offset: Offset(0, 3), // Posisi bayangan (X,Y)
                            ),
                          ]),
                    );
      
      
      
      
                  }),
            ),
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
                borderRadius: const BorderRadius.all(
                  Radius.circular(16.0)
                )
              ),
              child: SizedBox(
                height: 80.0,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return  Column(
                      children: [
                        Container(
                          height: 120.0,
                          width: 250,
                          margin: const EdgeInsets.only(
                            left: 12.0
                          ),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://www.ikapi.org/wp-content/uploads/2023/03/Launch-IIBF-2023-1-1080x675.jpg"
                              ),
                              fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
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
