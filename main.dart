import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late String data = "OUTPUT";
  late String cmd;

  web() async {
    //var url = "http://192.168.122.1/cgi-bin/app.py";
    //print("helooooooooo");
    var r = Uri.http("192.168.43.85", "/cgi-bin/cmd.py", {"x": cmd});
    var r1 = await http.get(r);
    data = r1.body.toString();
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("DOCKER"),
        ),
        body: Column(
          children: [
            Text("Enter your cmd:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                )),
            Container(),
            TextField(
              onChanged: (value) {
                cmd = value;
              },
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), prefixIcon: Icon(Icons.print)),
            ),
            TextButton(
              onPressed: web,
              child: Text("click me"),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(30),
                color: Colors.blueAccent,
              ),
              child: Center(
                child: ListView(
                  children: [
                    Center(
                      child: Text("$data"),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
