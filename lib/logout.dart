import 'package:api_app/login.dart';
import 'package:api_app/news.dart';
import 'package:flutter/material.dart';

class Logout extends StatefulWidget {
  final String username;
  final String fullname;
  final String faculties;

  const Logout({super.key, required this.username, required this.fullname, required this.faculties});
  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = new TextEditingController();
    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      // Step 2 <- SEE HERE
      _controller.text = 'Complete the story from here...';
    }

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
          alignment: Alignment(0, -0.85),
          child: Text(
            'Profile',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 50,
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Align(
          alignment: Alignment(0, 1),
          child: SizedBox(
            width: 430,
            height: 770,
            child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 356,
                          child: Column(
                            children: [
                              SizedBox(height: 15),
                              Align(
                                alignment: Alignment(-0.87, 0),
                                child: Text(
                                  'First name',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: '${widget.fullname.split(' ')[0]}',
                                    hintStyle: TextStyle(
                                        fontSize: 15.0,
                                        color:
                                            Color.fromARGB(255, 162, 162, 162)),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 255, 255, 255),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(51, 128, 128, 128),
                                offset: Offset(0, 2),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 356,
                          child: Column(
                            children: [
                              SizedBox(height: 15),
                              Align(
                                alignment: Alignment(-0.87, 0),
                                child: Text(
                                  'Last name',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                             Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: '${widget.fullname.split(' ')[1]}',
                                    hintStyle: TextStyle(
                                        fontSize: 15.0,
                                        color:
                                            Color.fromARGB(255, 162, 162, 162)),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 255, 255, 255),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(51, 128, 128, 128),
                                offset: Offset(0, 2),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 356,
                          child: Column(
                            children: [
                              SizedBox(height: 15),
                              Align(
                                alignment: Alignment(-0.87, 0),
                                child: Text(
                                  'Major',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                             Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: '${widget.faculties}',
                                    hintStyle: TextStyle(
                                        fontSize: 15.0,
                                        color:
                                            Color.fromARGB(255, 162, 162, 162)),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 255, 255, 255),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(51, 128, 128, 128),
                                offset: Offset(0, 2),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 356,
                          child: Column(
                            children: [
                              SizedBox(height: 15),
                              Align(
                                alignment: Alignment(-0.87, 0),
                                child: Text(
                                  'Student ID',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                             Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: '${widget.username}',
                                    hintStyle: TextStyle(
                                        fontSize: 15.0,
                                        color:
                                            Color.fromARGB(255, 162, 162, 162)),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 255, 255, 255),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(51, 128, 128, 128),
                                offset: Offset(0, 2),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment(0, -0.725),
                      child: InkWell(
                        child: Container(
                          width: 356,
                          height: 64,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 0, 0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 13, right: 8, bottom: 8),
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                child: Text(
                                  'Logout',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          );
                        },
                      ),
                    ),
                  ]),
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
        Align(
          alignment: Alignment(-0.85, -0.815),
          child: InkWell(
            child: Icon(
              Icons.arrow_back_ios,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 30.0,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => News(
                    username: widget.username,
                    fullname: widget.fullname,
                    faculties: widget.faculties,
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
