import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_bloom_test_ui/screens/auth-services.dart';
import 'package:health_bloom_test_ui/screens/loginscreen.dart';
import 'package:health_bloom_test_ui/screens/tabnavigator.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          left: 30,
                          width: 80,
                          height: 200,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/light-1.png'))),
                          )),
                      Positioned(
                          left: 140,
                          width: 80,
                          height: 150,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/light-2.png'))),
                          )),
                      Positioned(
                          right: 40,
                          top: 40,
                          width: 80,
                          height: 150,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/clock.png'))),
                          )),
                      Positioned(
                          child: Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: <Widget>[
                          Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            cursorColor: Colors.deepPurpleAccent,
                            decoration: InputDecoration(
                                hintText: "Name",
                                prefixIcon: Material(
                                  elevation: 0,
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                ),
                                border: InputBorder.none,
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                          ),
                        ),
                          SizedBox(
                            height: 10,
                          ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailController,
                                cursorColor: Colors.deepPurpleAccent,
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    prefixIcon: Material(
                                      elevation: 0,
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      child: Icon(
                                        Icons.email,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding:
                                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                controller: _passwordController,
                                cursorColor: Colors.deepPurpleAccent,
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    prefixIcon: Material(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      child: Icon(
                                        Icons.lock,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding:
                                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                              ),
                            )

                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 50,
                          child: RaisedButton(
                            color: Colors.deepPurpleAccent,
                            onPressed: () async {
                              final user = await authService.createUserWithEmailAndPassword(
                                  _emailController.text, _passwordController.text);
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Nav()));
                            },
                            child: Center(
                              child: Text("Sign Up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text(
                            "Already a User??",
                            style: TextStyle(
                                color: Color.fromRGBO(143, 148, 251, 1.0)),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
