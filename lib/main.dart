// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';

import 'model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tic Tac To",
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Boxs> b = [];
  List p1 = [];
  List p2 = [];
  // ignore: prefer_typing_uninitialized_variables
  var player;
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 9; i++) {
      b.add(Boxs(id: i));
    }
    player = 1;
  }

  clicked(int id, index) {
    if (player == 1) {
      p1.add(id);
      // print(id);
      b[index].color = Colors.redAccent;
      b[index].text = "X";

      player = 2;
    } else if (player == 2) {
      p2.add(id);
      b[index].color = Colors.black;
      b[index].text = "O";

      player = 1;
    }
    var s = winner();

    if (s == "p1" || s == "p2") {
      // print(s);
      player = 0;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Player $s is the Winner")),
      );
    }
    setState(() {});
  }

  winner() {
    if (p1.contains(0) && p1.contains(1) && p1.contains(2)) {
      return "p1";
    } else if (p1.contains(3) && p1.contains(4) && p1.contains(5)) {
      return "p1";
    } else if (p1.contains(6) && p1.contains(7) && p1.contains(8)) {
      return "p1";
    } else if (p1.contains(0) && p1.contains(3) && p1.contains(6)) {
      return "p1";
    } else if (p1.contains(1) && p1.contains(4) && p1.contains(7)) {
      return "p1";
    } else if (p1.contains(2) && p1.contains(5) && p1.contains(8)) {
      return "p1";
    } else if (p1.contains(2) && p1.contains(4) && p1.contains(6)) {
      return "p1";
    } else if (p1.contains(0) && p1.contains(4) && p1.contains(8)) {
      return "p1";
    }

    if (p2.contains(0) && p2.contains(1) && p2.contains(2)) {
      return "p2";
    } else if (p2.contains(3) && p2.contains(4) && p2.contains(5)) {
      return "p2";
    } else if (p2.contains(6) && p2.contains(7) && p2.contains(8)) {
      return "p2";
    } else if (p2.contains(0) && p2.contains(3) && p2.contains(6)) {
      return "p2";
    } else if (p2.contains(1) && p2.contains(4) && p2.contains(7)) {
      return "p2";
    } else if (p2.contains(2) && p2.contains(5) && p2.contains(8)) {
      return "p2";
    } else if (p2.contains(2) && p2.contains(4) && p2.contains(6)) {
      return "p2";
    } else if (p2.contains(0) && p2.contains(4) && p2.contains(8)) {
      return "p2";
    }
  }

  complay() {
    List checklist = [];
    List d = [0, 1, 2, 3, 4, 5, 6, 7, 8];
    for (var item in d) {
      if (!p1.contains(item) && !p2.contains(item)) {
        checklist.add(item);
      }
    }
    print(checklist);
    var r = Random();
    if (checklist.isNotEmpty) {
      var index = r.nextInt(checklist.length);

      clicked(checklist[index], checklist[index]);
    } else {
      if (player != 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Match was draw")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 45.0,
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        // color: Colors.redAccent,
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (b[index].disable == false && player == 1) {
                            b[index].disable = true;
                            clicked(b[index].id!, index);

                            complay();
                            setState(() {});
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            b[index].color,
                          ),
                        ),
                        child: Text(
                          "${b[index].text}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                  itemCount: b.length,
                ),
                const SizedBox(
                  height: 80.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          player = 1;
                          p1.clear();
                          p2.clear();
                          b.clear();
                          for (var i = 0; i < 9; i++) {
                            b.add(Boxs(id: i));
                          }
                          setState(() {});
                        },
                        child: const Text(
                          "Run Again",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(15.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
