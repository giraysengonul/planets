import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:planets_app/data.dart';
import 'package:planets_app/detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.purple, Colors.deepPurpleAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3, 0.7]),
        ),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Text(
                    "Explore",
                    style: TextStyle(
                      fontFamily: "Avenir",
                      fontSize: 44,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  DropdownButton(
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "Solar System",
                          style: TextStyle(
                            fontFamily: "Avenir",
                            fontSize: 24.0,
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                    onChanged: (value) {},
                    icon: Icon(Icons.arrow_drop_down_sharp),

                    //Alt çizgisini yok ettik.
                    underline: SizedBox(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Container(
                height: 500.0,
                child: Swiper(
                  pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                    activeSize: 20.0,
                    space: 8.0,
                  )),
                  itemCount: planets.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  layout: SwiperLayout.STACK,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, a, b) => DetailPage(
                                      planetInfo: planets[index],
                                    )));
                      },
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 100.0,
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                                elevation: 8.0,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 100.0,
                                      ),
                                      Text(
                                        planets[index].name,
                                        style: TextStyle(
                                          fontFamily: "Avenir",
                                          fontSize: 44.0,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        "Solar System",
                                        style: TextStyle(
                                          fontFamily: "Avenir",
                                          fontSize: 23.0,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 32.0,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Know more",
                                            style: TextStyle(
                                              fontFamily: "Avenir",
                                              fontSize: 18.0,
                                              color: Colors.red[400],
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: Colors.red[400],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Hero(
                              tag: planets[index].position,
                              child: Image.asset(planets[index].iconImage)),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        )),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36.0),
              topRight: Radius.circular(36.0),
            ),
            color: Colors.blueAccent),
        padding: EdgeInsets.all(24.0),
        // color: Colors.blueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                icon: Image.asset("assets/menu_icon.png"), onPressed: () {}),
            IconButton(
                icon: Image.asset("assets/search_icon.png"), onPressed: () {}),
            IconButton(
                icon: Image.asset("assets/profile_icon.png"), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
