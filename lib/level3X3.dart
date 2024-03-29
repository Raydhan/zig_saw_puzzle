import 'package:flutter/material.dart';
import 'package:zig_saw_puzzle/data.dart';
import 'package:zig_saw_puzzle/logic_game2.dart';
import 'package:zig_saw_puzzle/main.dart';

class Level_Page extends StatefulWidget {
  const Level_Page({Key? key}) : super(key: key);

  @override
  State<Level_Page> createState() => _Level_PageState();
}

class _Level_PageState extends State<Level_Page> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
                title: Text(
                  "Photo Puzzle",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.black),
            body: ListView.builder(
              itemCount: Data.photo.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return PlayGame_Page(index);
                      },
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 5, 2),
                    height: 300,
                    width: 200,
                    decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.black),
                        image: DecorationImage(
                            image: AssetImage("image/${Data.photo[index]}"),
                            fit: BoxFit.fill)),
                  ),
                );
              },
            ),
          )),
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Are you sure you want to exit ?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return DashBoard();
                        },
                      ));
                    },
                    child: Text("Yes")),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("No")),
              ],
            );
          },
        );
        return true;
      },
    );
  }
}