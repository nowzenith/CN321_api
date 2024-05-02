import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api_app/logout.dart';
import 'package:flutter/material.dart';

class News extends StatefulWidget {
  final String username;
  final String fullname;
  final String faculties;

  const News({super.key, required this.username, required this.fullname, required this.faculties});
  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<dynamic> newsData = []; // This will store the fetched news items

  @override
    void initState(){
      // TODO: implement initState
      super.initState();
      fetchNews();
    }

    Future<void> fetchNews() async {
    const String apiUrl = 'http://10.0.2.2:3000/news'; // Replace with your actual API URL
    try {
      var response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'test-api', // Make sure to use your actual API token
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          newsData = json.decode(response.body)['data'];
          print(newsData);
        });
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      print('Failed to load news: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Color(0xFFEFF1F6),
      body: Stack(children: <Widget>[
        Align(
          alignment: Alignment(0, -1),
          child: SizedBox(
            width: double.infinity,
            child: Image(
              image: AssetImage('assets/1.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            child: Align(
              alignment: Alignment(1, -0.68),
              child: Image(
                image: AssetImage('assets/Vector.png'),
                width: 95,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment(-0.67, -0.66),
          child: Text(
            'Welcome, (${widget.fullname})',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 24,
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Align(
          alignment: Alignment(-0.72, -0.53),
          child: Text(
            'คุณเป็นนักศึกษาของ\n${widget.faculties}',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 20,
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Align(
          alignment: Alignment(0, 1.2),
          child: SizedBox(
            width: 430,
            height: 600,
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(100.0)),
                color: Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x33000000),
                    offset: Offset(0, 4),
                    blurRadius: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
        ListView(
          children: [
            Align(
              alignment: Alignment(0.0, 1.2),
              child: Padding(
                padding: const EdgeInsets.only(top: 400),
                child: Container(
                  height: 500,
                  width: 400,
                  child: ListView.builder(
                      itemCount: newsData.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 0.0, top: 10),
                          child: Column(
                            children: [
                              InkWell(
                                child: Container(
                                  width: 370,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 3, right: 8, bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image(
                                          image: AssetImage('assets/image.png'),
                                          width: 110,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                newsData[i]["title"],
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 5,
                                              ),
                                              child: Container(
                                                child: Text(
                                                  newsData[i]["summary"],
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color.fromARGB(
                                                        255, 155, 155, 155),
                                                    fontWeight: FontWeight.w100,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  print("tapped on container");
                                },
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment(0.9, -0.86),
          child: InkWell(
            child: Icon(
              Icons.settings,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 30.0,
            ),
            onTap: () {
             Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Logout(
                    username: widget.username,
                    fullname: widget.fullname,
                    faculties: widget.faculties,
                  ),
                ),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment(-0.7, -0.07),
          child: Text(
            'ข่าวประจำวันนี้',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 24,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ]),
    );
  }
}
