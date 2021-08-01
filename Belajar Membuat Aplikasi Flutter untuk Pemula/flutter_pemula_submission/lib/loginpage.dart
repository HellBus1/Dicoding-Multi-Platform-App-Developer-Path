import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<LoginPage> {
  TextEditingController _passwordcontroller = new TextEditingController();
  TextEditingController _emailcontroller = new TextEditingController();
  // Initially password is obscure
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: screenSize.width / 19, right: screenSize.width / 19),
              width: double.infinity,
              child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset('images/loginlogo.jpg'),
              ),
            ),
            SizedBox(
              height: screenSize.height / 30,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: screenSize.width / 24, right: screenSize.width / 24),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    child: Image.asset(
                      'images/google.jpg',
                      width: screenSize.width / 4,
                    ),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                    child: Image.asset(
                      'images/facebook.jpg',
                      width: screenSize.width / 4,
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height / 40,
            ),
            Center(
              child: Text(
                'Or log in using',
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(
              height: screenSize.height / 30,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: screenSize.width / 24, right: screenSize.width / 24),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 4,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, bottom: 15, top: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(), labelText: 'Email'),
                    controller: _emailcontroller,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: screenSize.width / 24, right: screenSize.width / 24),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 4,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, bottom: 15, top: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            print(_obscureText);
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        )),
                    controller: _passwordcontroller,
                    obscureText: _obscureText,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: screenSize.width / 24, right: screenSize.width / 24),
              width: double.infinity,
              child: Text(
                "Forgot password",
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.end,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(screenSize.width / 23),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(0, 206, 201, 1)),
                ),
                onPressed: () {},
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Text("Let's Start"),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
