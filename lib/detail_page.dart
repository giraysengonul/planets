import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planets_app/data.dart';

class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;

  const DetailPage({Key key, this.planetInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 300.0),
                          Text(
                            planetInfo.name,
                            style: TextStyle(
                              fontFamily: "Avenir",
                              fontSize: 56.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "Solar System",
                            style: TextStyle(
                              fontFamily: "Avenir",
                              fontSize: 31.0,
                              color: Colors.black54,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          SizedBox(height: 50.0),
                          Text(
                            planetInfo.description ?? "",
                            //uzayan yazılarda sonuna ... koymak için
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Avenir",
                              fontSize: 20.0,
                              color: Colors.black45,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height: 50.0),
                          Divider(
                            color: Colors.black38,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Text(
                        "Gallery",
                        style: TextStyle(
                          fontFamily: "Avenir",
                          fontSize: 25.0,
                          color: Colors.black54,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      height: 250.0,
                      child: ListView.builder(
                          itemCount: planetInfo.images.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              child: AspectRatio(
                                  //hepsini aynı boyutta bireylere döktük.
                                  aspectRatio: 1,
                                  child: Image.network(
                                    planetInfo.images[index],
                                    fit: BoxFit.cover,
                                  )),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Positioned(
                child: Hero(
                    tag: planetInfo.position,
                    child: Image.asset(planetInfo.iconImage)),
                right: -64,
              ),
              Positioned(
                top: 20.0,
                left: 32.0,
                child: Text(
                  planetInfo.position.toString(),
                  style: TextStyle(
                    fontFamily: "Avenir",
                    fontSize: 247.0,
                    color: Colors.black54.withOpacity(0.08),
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )),
    );
  }
}
