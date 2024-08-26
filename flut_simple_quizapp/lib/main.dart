import 'package:flutter/material.dart';
import 'package:flut_simple_quizapp/questions.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int n = 0, score = 0;

  List Ques_list = [
    Questions("1.MS word is a hardware", false),
    Questions("2.CPU controls only input data of computer", false),
    Questions("3.CPU stands for central procession unit", true),
    Questions(
        "4.Freeware is software that is availabel for use at no monetary const..",
        true),
  ];
  void checkanswer(bool choice, BuildContext ctx) {
    if (choice == Ques_list[n].ans) {
      score = score + 1;
      final snackBar = SnackBar(
        content: Text("Correct Answer"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Color.fromARGB(255, 21, 207, 28),
      );
      ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
    } else {
      final snackBar = SnackBar(
        content: Text("Wrong Answer"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
    }
    setState(() {
      if (n < Ques_list.length - 1) {
        n = n + 1;
      } else {
        final snackBar = SnackBar(
          content: Text("Quiz Completed : $score/4"),
          duration: Duration(seconds: 5),
          backgroundColor: Colors.blue,
        );
        ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
        reset();
      }
    });
  }

  void reset() {
    setState(() {
      score = 0;
      n = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Simple Quiz"),
        centerTitle: true,
      ),
      body: Builder(
        builder: (ctx) => Container(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Score: $score/4",
                    style: TextStyle(color: Colors.brown),
                  ),
                  InkWell(
                    onTap: () => reset(),
                    child: Text(
                      "Reset",
                      style: TextStyle(color: Colors.brown),
                    ),
                  )
                ],
              ),
              SizedBox(height: 5.0),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.brown),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Ques_list[n].ques,
                      style: TextStyle(fontSize: 17),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 56, 200, 61),
                      padding:
                          EdgeInsets.symmetric(horizontal: 33.0, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () => checkanswer(true, ctx),
                    child: Text(
                      "True",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 231, 27, 12),
                      padding:
                          EdgeInsets.symmetric(horizontal: 33, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () => checkanswer(false, ctx),
                    child: Text(
                      "False",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
