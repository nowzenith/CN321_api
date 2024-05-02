import 'package:api_app/news.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> login(String username, String password) async {
    var url = Uri.parse(
        'http://10.0.2.2:3000/login'); // Replace with your actual API URL
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'test-api',
    };
    var body = json.encode({
      'username': username,
      'password': password,
    });

    try {
      var response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body)["data"];
        String username1 = data["username"];
        String fullname = data["fullName"];
        String faculties = data["faculties"];
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => News(
              username: username1,
              fullname: fullname,
              faculties: faculties,
            ),
          ),
        );
      } else {
        // Handle failure
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${json.decode(response.body)["message"]}')),
        );
      }
    } catch (e) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF1F6),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0, -1),
            child: SizedBox(
              width: double.infinity,
              child: Image.asset('assets/1.png', fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 60),
              child: Image.asset('assets/icon.png', width: 130),
            ),
          ),
          Align(
            alignment: Alignment(0, 1),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 70),
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 30),
                    _buildTextField(
                        _usernameController, 'Student ID', '6310742108'),
                    SizedBox(height: 20),
                    _buildTextField(
                        _passwordController, 'Password', '123231231'),
                    SizedBox(height: 30),
                    InkWell(
                      onTap: () => login(
                          _usernameController.text, _passwordController.text),
                      child: Container(
                        width: 356,
                        height: 64,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, String hintText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 356,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(51, 128, 128, 128),
              offset: Offset(0, 2),
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 15),
            Align(
              alignment: Alignment(-0.87, 0),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                      fontSize: 15.0,
                      color: Color.fromARGB(255, 162, 162, 162)),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
