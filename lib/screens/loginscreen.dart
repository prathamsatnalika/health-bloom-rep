import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_bloom_test_ui/screens/auth-services.dart';
import 'package:health_bloom_test_ui/screens/signup.dart';
import 'package:health_bloom_test_ui/screens/tabnavigator.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

   LoginPage({Key? key}) : super(key: key);

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
                                "Login",
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
                            // Container(
                            //   padding: EdgeInsets.all(8.0),
                            //   decoration: BoxDecoration(
                            //       border: Border(
                            //           bottom: BorderSide(color: Colors.grey))),
                            //   child: TextField(
                            //     controller: emailController,
                            //     decoration: InputDecoration(
                            //         border: InputBorder.none,
                            //         hintText: "Email",
                            //         hintStyle:
                            //         TextStyle(color: Colors.grey[400])),
                            //   ),
                            // ),
                            // Container(
                            //   padding: EdgeInsets.all(8.0),
                            //   child: TextField(
                            //     obscureText: true,
                            //     controller: passwordController,
                            //     decoration: InputDecoration(
                            //         border: InputBorder.none,
                            //         hintText: "Password",
                            //         hintStyle:
                            //         TextStyle(color: Colors.grey[400])),
                            //   ),
                            // )
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
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
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                controller: passwordController,
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
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Container(
                          width: 20,
                        ),
                        InkWell(
                          // onTap: () {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => ResetScreen()));
                          // },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: Color.fromRGBO(143, 148, 251, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ]),
                      SizedBox(height: 10),

                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Container(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
                          },
                          child: Text(
                            "Don't have a account, Create one",
                            style: TextStyle(
                                color: Color.fromRGBO(143, 148, 251, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ]),
                      Container(
                        height: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 50,
                          child: RaisedButton(
                            color: Colors.deepPurpleAccent,
                            onPressed: () async {
                              authService.signInWithEmailAndPassword(emailController.text,passwordController.text);


                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Nav()));
                            },
                            child: Center(
                              child: Text("Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 5,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
