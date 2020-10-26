import 'package:flutter/material.dart';

import 'package:componentes/src/pages/jeans_page.dart';
import 'package:componentes/src/pages/cinturilla_page.dart';
import 'package:componentes/src/pages/short_page.dart';
import 'package:componentes/src/pages/body_page.dart';

class CalculaTallaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Jeans',
                ),
                Tab(
                  text: 'Cinturilla',
                ),
                Tab(
                  text: 'Short',
                ),
                Tab(
                  text: 'Body',
                ),
              ],
            ),
            title: Text('Calcula tu tulla'),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              ListView(
                children: <Widget>[JeansPage()],
              ),
              ListView(
                children: <Widget>[CinturillaPage()],
              ),
              ListView(
                children: <Widget>[ShortPage()],
              ),
              ListView(
                children: <Widget>[BodyPage()],
              )
            ],
          ),
        ),
      ),
    );
  }
}
