import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpSupport extends StatefulWidget {
  @override
  _HelpSupportState createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
              Container(width: 25),
              InkWell(
                onTap: () {Navigator.pop(context);},
                child: Icon(Icons.arrow_back_ios_outlined),
              )
            ],
          ),
          Container(
            height: 20,
          ),
          Lottie.network('https://assets1.lottiefiles.com/private_files/lf30_dmeyipsz.json',
                          width: 300,height: 300),
          Container(
            height: 20,
          ),
          Container(
            width: 320,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]
            ),
            child: Column(
              children: [
                Container(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    customLaunch(
                        'mailto:healthbloomofficial@email.com?subject=Health%20Bloom&body=Need%20Help');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 10,
                      ),
                      Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Gmail_icon_%282020%29.svg/512px-Gmail_icon_%282020%29.svg.png',
                                    width: 30,height: 30),
                      Container(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          )),
                          Text('healthbloomofficial@gmail.com',style: TextStyle(
                              fontSize: 12,
                          ))
                        ],
                      ),
                      Container(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    customLaunch('tel:+91 7001880042');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 10,
                      ),
                      Image.network('https://img.icons8.com/ios/452/apple-phone.png',
                          width: 30,height: 30),
                      Container(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Phone no.',style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          )),
                          Text('7001880042',style: TextStyle(
                            fontSize: 12,
                          ))
                        ],
                      ),
                      Container(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    customLaunch('https://github.com/prathamsatnalika');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 10,
                      ),
                      Image.network('https://img.icons8.com/small/452/github.png',
                          width: 30,height: 30),
                      Container(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Github',style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          )),
                          Text('https://github.com/prathamsatnalika',style: TextStyle(
                            fontSize: 12,
                          ))
                        ],
                      ),
                      Container(
                        height: 15,
                      ),
                    ],
                  ),
                ),

              ],
            ),
          )

        ],
      ),
    );
  }
}
