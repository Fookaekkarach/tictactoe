import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var _selectedChoice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: MediaQuery.of(context).padding,
          color: Colors.blue[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Tic Tac Toe", style: TextStyle(fontSize: 50)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("3x3 VS Bot", style: TextStyle(fontSize: 20)),
                      Radio(
                          value: "1",
                          groupValue: _selectedChoice,
                          onChanged: (value) {
                            setState(() {
                              _selectedChoice = value;
                            });
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("3x3 VS Friend", style: TextStyle(fontSize: 20)),
                      Radio(
                          value: "2",
                          groupValue: _selectedChoice,
                          onChanged: (value) {
                            setState(() {
                              _selectedChoice = value;
                            });
                          }),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("5x5 VS Bot", style: TextStyle(fontSize: 20)),
                        Radio(
                            value: "4",
                            groupValue: _selectedChoice,
                            onChanged: (value) {
                              setState(() {
                                _selectedChoice = value;
                              });
                            }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("5x5 VS Friend", style: TextStyle(fontSize: 20)),
                        Radio(
                            value: "3",
                            groupValue: _selectedChoice,
                            onChanged: (value) {
                              setState(() {
                                _selectedChoice = value;
                              });
                            }),
                      ],
                    ),
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text("เริ่ม"),
                    onPressed: () {
                      // setState(() {});
                      if (_selectedChoice == "2") {
                        Navigator.pushNamed(context, '/Page3', arguments: "friend");
                      }
                      if (_selectedChoice == "1") {
                        Navigator.pushNamed(context, '/Page3', arguments: "bot");
                      }
                      if (_selectedChoice == "3") {
                        Navigator.pushNamed(context, '/Page5', arguments: "friend");
                      }
                      if (_selectedChoice == "4") {
                        Navigator.pushNamed(context, '/Page5', arguments: "bot");
                      }
                      if (_selectedChoice == null) {
                        Toast.show("กรุณาเลือก", context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[400],
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
