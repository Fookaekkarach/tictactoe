import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';

class Page5 extends StatefulWidget {
  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  static const double RADIUS_CORNER = 10;
  static const int NONE = 0;
  static const int VALUE_X = 1;
  static const int VALUE_O = 2;
  int score_X = 0;
  int score_Y = 0;
  int score_D = 0;

  List<List<int>> channelStatus = [
    [NONE, NONE, NONE, NONE, NONE],
    [NONE, NONE, NONE, NONE, NONE],
    [NONE, NONE, NONE, NONE, NONE],
    [NONE, NONE, NONE, NONE, NONE],
    [NONE, NONE, NONE, NONE, NONE],
  ];

  int currentTurn = VALUE_X;
  int checkPlayAgain = 0;
  String args;
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("5X5"),
      ),
      body: Container(
          constraints: BoxConstraints.expand(),
          color: Colors.blue[100],
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            (args == "bot")
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                    child: Text("VS Bot",
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold)),
                  )
                : Padding(
                    padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                    child: Text("Turn of player",
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold)),
                  ),
            (args == "bot")
                ? Container()
                : Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Icon(getIconFromStatus(currentTurn),
                        size: 60, color: Colors.white),
                  ),
            Container(
              child: Container(
                color: Colors.blue[500],
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: buildRowChannel(0)),
                    Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: buildRowChannel(1)),
                    Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: buildRowChannel(2)),
                    Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: buildRowChannel(3)),
                    Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: buildRowChannel(4)),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text("Score", style: TextStyle(fontSize: 30)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Player X", style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Draw", style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Player O", style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child:
                      Text(score_X.toString(), style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
                  child:
                      Text(score_D.toString(), style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child:
                      Text(score_Y.toString(), style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
            (checkPlayAgain == 1)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton(
                          onPressed: () {
                            playAgain();
                          },
                          child: Text("Play again",
                              style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ],
                  )
                : Container()
          ])),
    );
  }

  List<Widget> buildRowChannel(int row) {
    List<Widget> listWidget = List();
    for (int col = 0; col < 5; col++) {
      double tlRadius = row == 0 && col == 0 ? RADIUS_CORNER : 0;
      double trRadius = row == 0 && col == 4 ? RADIUS_CORNER : 0;
      double blRadius = row == 4 && col == 0 ? RADIUS_CORNER : 0;
      double brRadius = row == 4 && col == 4 ? RADIUS_CORNER : 0;
      Widget widget = buildChannel(row, col, tlRadius, trRadius, blRadius,
          brRadius, channelStatus[row][col]);
      listWidget.add(widget);
    }
    return listWidget;
  }

  Widget buildChannel(int row, int col, double tlRadius, double trRadius,
          double blRadius, double brRadius, int status) =>
      GestureDetector(
          onTap: () => onChannelPressed(row, col),
          child: Container(
              margin: EdgeInsets.all(2),
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  color: getBackgroundChannelFromStatus(status),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(tlRadius),
                      topRight: Radius.circular(trRadius),
                      bottomLeft: Radius.circular(blRadius),
                      bottomRight: Radius.circular(brRadius))),
              child: Icon(getIconFromStatus(status),
                  size: 60, color: Colors.white)));

  onChannelPressed(int row, int col) {
    if (channelStatus[row][col] == NONE) {
      setState(() {
        channelStatus[row][col] = currentTurn;
        if (isGameEndedByWin()) {
          showEndGameDialog(currentTurn);
          checkPlayAgain = 1;
          if (currentTurn == 1) {
            score_X++;
          } else if (currentTurn == 2) {
            score_Y++;
          }
        } else {
          if (isGameEndedByDraw()) {
            checkPlayAgain = 1;
            showEndGameByDrawDialog();
          } else {
            switchPlayer();
          }
        }
      });
    }
  }

  IconData getIconFromStatus(int status) {
    if (status == 1) {
      return Icons.close;
    } else if (status == 2) {
      return Icons.radio_button_unchecked;
    }
    return null;
  }

  Color getBackgroundChannelFromStatus(int status) {
    if (status == 1) {
      return Colors.blue[300];
    } else if (status == 2) {
      return Colors.blue[300];
    }
    return Colors.blue[100];
  }

  void switchPlayer() {
    if (currentTurn == VALUE_X) {
      currentTurn = VALUE_O;
      if (args == "bot") {
        var r = new Random();
        List a = [];
        for (int i = 0; i < 5; i++) {
          for (int j = 0; j < 5; j++) {
            if (channelStatus[i][j] == NONE) {
              a.add([i, j]);
            }
          }
        }
        var element = a[r.nextInt(a.length)];
        channelStatus[element[0]][element[1]] = 2;

        if (isGameEndedByWin()) {
          showEndGameDialog(currentTurn);
          checkPlayAgain = 1;
          if (currentTurn == 1) {
            score_X++;
          } else if (currentTurn == 2) {
            score_Y++;
          }
        } else {
          if (isGameEndedByDraw()) {
            checkPlayAgain = 1;
            showEndGameByDrawDialog();
          } else {
            currentTurn = VALUE_X;
          }
        }
      }
    } else if (currentTurn == VALUE_O) {
      currentTurn = VALUE_X;
    }
  }

  bool isGameEndedByWin() {
    // ตรวจสอบแนวตั้ง
    for (int col = 0; col < 5; col++) {
      if (channelStatus[0][col] != NONE) {
        if (channelStatus[0][col] != NONE &&
            channelStatus[0][col] == channelStatus[1][col] &&
            channelStatus[1][col] == channelStatus[2][col] &&
            channelStatus[2][col] == channelStatus[3][col]) {
          return true;
        }
      } else {
        if (channelStatus[1][col] != NONE &&
            channelStatus[1][col] == channelStatus[2][col] &&
            channelStatus[2][col] == channelStatus[3][col] &&
            channelStatus[3][col] == channelStatus[4][col]) {
          return true;
        }
      }
    }

    // ตรวจสอบแนวนอน
    for (int row = 0; row < 5; row++) {
      if (channelStatus[row][0] != NONE) {
        if (channelStatus[row][0] != NONE &&
            channelStatus[row][0] == channelStatus[row][1] &&
            channelStatus[row][1] == channelStatus[row][2] &&
            channelStatus[row][2] == channelStatus[row][3]) {
          return true;
        }
      } else {
        if (channelStatus[row][1] != NONE &&
            channelStatus[row][1] == channelStatus[row][2] &&
            channelStatus[row][2] == channelStatus[row][3] &&
            channelStatus[row][3] == channelStatus[row][4]) {
          return true;
        }
      }
    }

    // ตรวจสอบทะแยงซ้ายลงไปขวา ตรงกลาง
    if (channelStatus[0][0] != NONE) {
      if (channelStatus[0][0] != NONE &&
          channelStatus[0][0] == channelStatus[1][1] &&
          channelStatus[1][1] == channelStatus[2][2] &&
          channelStatus[2][2] == channelStatus[3][3]) {
        return true;
      }
    } else {
      if (channelStatus[1][1] != NONE &&
          channelStatus[1][1] == channelStatus[2][2] &&
          channelStatus[2][2] == channelStatus[3][3] &&
          channelStatus[3][3] == channelStatus[4][4]) {
        return true;
      }
    }
    // ตรวจสอบทะแยงซ้ายลงไปขวา ซ้าย
    if (channelStatus[1][0] != NONE &&
        channelStatus[1][0] == channelStatus[2][1] &&
        channelStatus[2][1] == channelStatus[3][2] &&
        channelStatus[3][2] == channelStatus[4][3]) {
      return true;
    }
    // ตรวจสอบทะแยงซ้ายลงไปขวา ขวา
    if (channelStatus[0][1] != NONE &&
        channelStatus[0][1] == channelStatus[1][2] &&
        channelStatus[1][2] == channelStatus[2][3] &&
        channelStatus[2][3] == channelStatus[3][4]) {
      return true;
    }

    // ตรวจสอบทะแยงขวาลงไปซ้าย
    if (channelStatus[0][4] != NONE) {
      if (channelStatus[0][4] != NONE &&
          channelStatus[0][4] == channelStatus[1][3] &&
          channelStatus[1][3] == channelStatus[2][2] &&
          channelStatus[2][2] == channelStatus[3][1]) {
        return true;
      }
    } else {
      if (channelStatus[1][3] != NONE &&
          channelStatus[1][3] == channelStatus[2][2] &&
          channelStatus[2][2] == channelStatus[3][1] &&
          channelStatus[3][1] == channelStatus[4][0]) {
        return true;
      }
    }
    // ตรวจสอบทะแยงขวาลงไปซ้าย ซ้าย
    if (channelStatus[0][3] != NONE &&
        channelStatus[0][3] == channelStatus[1][2] &&
        channelStatus[1][2] == channelStatus[2][1] &&
        channelStatus[2][1] == channelStatus[3][0]) {
      return true;
    }
    // ตรวจสอบทะแยงขวาลงไปซ้าย ขวา
    if (channelStatus[1][4] != NONE &&
        channelStatus[1][4] == channelStatus[2][3] &&
        channelStatus[2][3] == channelStatus[3][2] &&
        channelStatus[3][2] == channelStatus[4][1]) {
      return true;
    }
    return false;
  }

  bool isGameEndedByDraw() {
    for (int row = 0; row < 5; row++) {
      for (int col = 0; col < 5; col++) {
        if (channelStatus[row][col] == NONE) {
          return false;
        }
      }
    }
    score_D++;
    return true;
  }

  void showEndGameDialog(int winner) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
            content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Text("The winner is",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          Icon(getIconFromStatus(currentTurn), size: 60),
          ElevatedButton(
            // padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
            // color: Colors.yellow[800],
            child: Text("Play again",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              playAgain();
              Navigator.of(context).pop();
            },
          )
        ]));
      },
    );
  }

  void showEndGameByDrawDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
            content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Text("Draw",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          ElevatedButton(
            child: Text("Play again",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              playAgain();
              Navigator.of(context).pop();
            },
          )
        ]));
      },
    );
  }

  playAgain() {
    setState(() {
      checkPlayAgain = 0;
      currentTurn = VALUE_X;
      channelStatus = [
        [NONE, NONE, NONE, NONE, NONE],
        [NONE, NONE, NONE, NONE, NONE],
        [NONE, NONE, NONE, NONE, NONE],
        [NONE, NONE, NONE, NONE, NONE],
        [NONE, NONE, NONE, NONE, NONE],
      ];
    });
  }
}
