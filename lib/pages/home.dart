import 'package:flutter/material.dart';
import 'package:flutter_pollsapp/pages/create_poll.dart';
import 'package:flutter_pollsapp/pages/list_polls.dart';

class Home extends StatefulWidget {
const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentPageIndex = 0;
  final _bodySelectedPage = <Widget>[
    const CreatePoll(),
     ListPolls(),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _bodySelectedPage[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blueGrey,
        backgroundColor: Colors.black87,
        onTap: (index){
          setState(() {
            _currentPageIndex = index;
          });
        },
        currentIndex: _currentPageIndex,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add,color: _currentPageIndex == 0 ? Colors.white : Colors.grey,),
            label: 'Create Poll',
          //  backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list,color: _currentPageIndex == 1 ? Colors.white : Colors.grey),
            label: 'List Polls',
           // backgroundColor: Colors.orange
          ),
        ],
      ),
    );

  }
}