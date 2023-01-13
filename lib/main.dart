import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flip Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flip Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late FlipCardController _controller;

  bool isSwitchOn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = FlipCardController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(color: Color.fromARGB(255, 40, 123, 161),
                borderRadius: BorderRadius.circular(10)
                ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text("LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              ),
              SizedBox(width: 20,),
              Container(
                decoration: BoxDecoration(color: Color.fromARGB(255, 40, 123, 161),
                borderRadius: BorderRadius.circular(10)
                ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text("SIGNUP",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              ),
            ],
          ),
          Switch(
            inactiveThumbImage: AssetImage("images/up-left-arrow.png"),
            activeThumbImage: AssetImage("images/up-right-arrow.png"),
            activeColor: Color(0xffffffca),
            inactiveThumbColor: Color(0xffffffca),
            activeTrackColor: Color.fromARGB(255, 40, 123, 161),
            inactiveTrackColor: Color.fromARGB(255, 40, 123, 161),
            value: isSwitchOn, 
            onChanged: (bool value){
              if(isSwitchOn == false){
                setState(() {
                  isSwitchOn = true;
                  _controller.toggleCard();
                });
              }
              else{
                setState(() {
                  isSwitchOn = false;
                  _controller.toggleCard();
                });
              }
            },
            ),
            FlipCard(
              flipOnTouch: false,
              controller: _controller,
              front: LoginPage(), 
              back: SignupPage()
              ),
        ],),
      ),
    );
  }

  Widget LoginPage(){
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0.0, 0.0)
          )
        ],
        image: DecorationImage(image: AssetImage("images/background.jpg"),fit: BoxFit.cover
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Enter Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
                ),
                prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 40, 123, 161),),
                filled: true,
                fillColor: Colors.white54
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Enter Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
                ),
                prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 40, 123, 161),),
                filled: true,
                fillColor: Colors.white54
              ),
            ),
          ),
        ]
        ),
    );
  }

  Widget SignupPage(){
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0.0, 0.0)
          )
        ],
        image: DecorationImage(image: AssetImage("images/background.jpg"), fit: BoxFit.cover
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Enter Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
                ),
                prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 40, 123, 161),),
                filled: true,
                fillColor: Colors.white54
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Enter Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
                ),
                prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 40, 123, 161),),
                filled: true,
                fillColor: Colors.white54
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Enter Confirm Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
                ),
                prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 40, 123, 161),),
                filled: true,
                fillColor: Colors.white54
              ),
            ),
          ),
        ]
        ),
    );
  }
}
