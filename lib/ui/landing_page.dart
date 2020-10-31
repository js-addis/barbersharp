import 'package:flutter/material.dart';
import 'package:barbershop_app/models/barber.dart';
import 'package:barbershop_app/services/api.dart';
import 'dart:async';

class LandingPage extends StatefulWidget {
  @override 
  _LandingPageState createState() => new _LandingPageState();
}
class _LandingPageState extends State<LandingPage> {

  List<Barber> _barbers = [];
  String selectedBarber = ''; 

  @override 

  void initState() {
    super.initState();
    _loadBarbers();
  }
  _loadBarbers() async {
    String fileData = await DefaultAssetBundle.of(context).loadString("assets/barbers.json");
    setState((){
      _barbers = BarberApi.allBarbersFromJson(fileData);
      
    });
    print(_barbers);
  }
  Future<Null> refresh() {
    _loadBarbers();
    return new Future<Null>.value();
  }
  // Consolidates all the widgets into a container
  Widget _buildBody() {
    return new Container(
      margin: const EdgeInsets.fromLTRB(8.0, 56.0, 8.0, 0.0),
      child: new Column(
        children: <Widget> [
          _getAppTitleWidget(),
          _getListViewWidget(),
        ],
      )
    );
  }
  Widget _getListViewWidget() {
    return new Flexible(
      child: new RefreshIndicator(
        onRefresh: refresh,
        child: new ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: _barbers.length,
          itemBuilder: _buildBarberItem,
        )
      )
    );
  }
  Widget _buildBarberItem(BuildContext context, int index) {
    Barber barber = _barbers[index];


    return new Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: new Card(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget> [
            new ListTile(
              leading: Radio(
                value: barber.name,
                groupValue: selectedBarber,
                onChanged: (value) => {
                  setState(() {
                    selectedBarber = value;
                    print(selectedBarber);
                  })
                }
              ),
              title: new Text(barber.name)
            )
          ]
        ),
      ),
    );
  }
  // Gets the App Title and returns it
  Widget _getAppTitleWidget() {
    return new Text(
      'Barber Sharp',
      style: new TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 15.0,
      )
    );
  }
  // Loads json data into state object array called _barbers


  @override 
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey,
      body: _buildBody(),
    );
  }



}