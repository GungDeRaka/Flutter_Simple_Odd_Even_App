

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const Color pinky = Color.fromARGB(255, 251, 37, 118);
const Color magenta = Color.fromARGB(255, 63, 0, 113);
const Color blacky = Color.fromARGB(255, 0, 0, 0);
const Color navy = Color.fromARGB(255, 21, 0, 80);
const Color biru = Color.fromARGB(255, 84, 181, 222);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();

  void showSnackbar(){
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("INPUT ANGKA BROOOWW.."),
      duration: Duration(seconds: 1),
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            biru,
            navy,
            magenta,
            biru,
            
          ], begin: Alignment.bottomLeft, end: Alignment.topCenter),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(cursorColor: blacky,
              textAlign: TextAlign.center,
              style: const TextStyle(color:navy, fontSize: 55),
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                //hintText: "input sebuah angka",
                contentPadding: const EdgeInsets.all(16),
                isCollapsed: true,
                filled: true,
                fillColor:  biru,
                hoverColor: pinky,
                //hintStyle: TextStyle(color: pinky,fontSize: 40),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: biru),
              onPressed: () async {
                try {
                dialog(context);
                }on Exception{showSnackbar();}
              },
              child: const Text("Ganjil / Genap?",style: TextStyle(fontSize: 16,color: blacky),),
            ),
          ],
        ),
      ),
    );
  }



  Future<dynamic> dialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            backgroundColor: navy,
            alignment: Alignment.center,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            content: Text(
              "${_controller.text} merupakan Bilangan ${(int.parse(_controller.text) % 2 == 0) ? 'Genap' : 'Ganjil'}",
              style: const TextStyle(
                  color: biru, fontSize: 24, fontWeight: FontWeight.w500),
            ),
            title: const Text("Wahhh..,Ternyataa"),
            titleTextStyle: const TextStyle(
                color: biru, fontSize: 28, fontWeight: FontWeight.bold),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pop(_controller.text);
                      _controller.clear();
                    });
                  },
                  child: const Text("Back"))
            ],
          );
        });
  }
}
