import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Suhu',
      home: KonversiSuhu(),
    );
  }
}

class KonversiSuhu extends StatefulWidget {
  @override
  _KonversiSuhuState createState() => _KonversiSuhuState();
}

class _KonversiSuhuState extends State<KonversiSuhu> {

  TextEditingController inputController = TextEditingController();
  String hasil = "";

  void celsiusKeFahrenheit() {
    double c = double.parse(inputController.text);
    double f = (c * 9 / 5) + 32;

    setState(() {
      hasil = "$c °C = ${f.toStringAsFixed(2)} °F";
    });
  }

  void fahrenheitKeCelsius() {
    double f = double.parse(inputController.text);
    double c = (f - 32) * 5 / 9;

    setState(() {
      hasil = "$f °F = ${c.toStringAsFixed(2)} °C";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Konversi Suhu"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Masukkan Suhu",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                ElevatedButton(
                  onPressed: celsiusKeFahrenheit,
                  child: Text("C → F"),
                ),

                ElevatedButton(
                  onPressed: fahrenheitKeCelsius,
                  child: Text("F → C"),
                ),

              ],
            ),

            SizedBox(height: 20),

            Text(
              hasil,
              style: TextStyle(fontSize: 20),
            )

          ],
        ),
      ),
    );
  }
}