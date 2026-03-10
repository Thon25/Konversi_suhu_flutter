import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: KonversiPage(),
    );
  }
}

class KonversiPage extends StatefulWidget {
  @override
  _KonversiPageState createState() => _KonversiPageState();
}

class _KonversiPageState extends State<KonversiPage> {

  TextEditingController inputController = TextEditingController();

  String hasil = "";

  void konversiSuhu() {
    double celsius = double.parse(inputController.text);

    double fahrenheit = (celsius * 9 / 5) + 32;
    double kelvin = celsius + 273.15;
    double reamur = celsius * 4 / 5;

    setState(() {
      hasil =
          "Fahrenheit : ${fahrenheit.toStringAsFixed(2)}\n"
          "Kelvin : ${kelvin.toStringAsFixed(2)}\n"
          "Reamur : ${reamur.toStringAsFixed(2)}";
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
                labelText: "Masukkan Suhu Celsius",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: konversiSuhu,
              child: Text("Konversi"),
            ),

            SizedBox(height: 20),

            Text(
              hasil,
              style: TextStyle(fontSize: 18),
            )

          ],
        ),
      ),
    );
  }
}