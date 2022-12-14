import 'package:flutter/material.dart';
import 'package:flutter_konverter_suhu/widgets/button.dart';
import 'package:flutter_konverter_suhu/widgets/input.dart';
import 'package:flutter_konverter_suhu/widgets/result.dart';
import 'package:flutter_konverter_suhu/widgets/history.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = new TextEditingController();
  String _newValue = "Kelvin";
  double _result = 0;
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  double _fahrenheit = 0;

  final inputController = TextEditingController();

  List<String> listViewItem = <String>[];

  var listItem = ["Kelvin", "Reamur", "Fahrenheit"];

  void konversi() {
    setState(() {
      _inputUser = double.parse(etInput.text);

      switch (_newValue) {
        case "Kelvin":
          _result = _inputUser + 273;
          listViewItem.add("$_newValue : $_result");
          break;
        case "Reamur":
          _result = _inputUser * (4 / 5);
          listViewItem.add("$_newValue : $_result");
          break;
        case "Fahrenheit":
          _result = (_inputUser * (9 / 5)) + 32;
          listViewItem.add("$_newValue : $_result");
          break;
      }
    });
  }

  dropdownOnChanged(String? changeValue) {
    setState(() {
      _newValue = changeValue!;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title:
              Text("Konverter Suhu : Nadhifah Lutfiyah Mahmudah / 2041720082"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              input(etInput: etInput),
              DropdownButton<String>(
                items: listItem.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _newValue,
                onChanged: dropdownOnChanged,
              ),
              result(
                result_: _result,
              ),
              button(
                konversi: konversi,
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              history(listViewItem: listViewItem),
            ],
          ),
        ),
      ),
    );
  }
}
