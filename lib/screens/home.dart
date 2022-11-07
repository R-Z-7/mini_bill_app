// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_bill_app/screens/account.dart';
import 'package:mini_bill_app/screens/billing.dart';

import 'package:mini_bill_app/screens/dashboard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final items = <Widget>[Dashboard(), Bills(), Account()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody:
          true, // Important: to remove background of bottom navigation (making the bar transparent doesn't help)
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
              color: Color.fromARGB(255, 30, 53, 65)),
          child: BottomNavyBar(
            backgroundColor: Colors.transparent,
            selectedIndex: _currentIndex,
            showElevation: true,
            itemCornerRadius: 30,
            curve: Curves.easeIn,
            onItemSelected: (index) => setState(() => _currentIndex = index),
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: Icon(FontAwesomeIcons.clipboard),
                title: Text('Dashboard'),
                activeColor: Colors.white,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(FontAwesomeIcons.indianRupeeSign),
                title: Text('Billing'),
                activeColor: Colors.white,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(FontAwesomeIcons.user),
                title: Text(
                  'Account',
                ),
                activeColor: Colors.white,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      body: items[_currentIndex],
    );
  }
}
