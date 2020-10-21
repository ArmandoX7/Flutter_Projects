import 'package:componentes/src/pages/jeans_page.dart';
import 'package:flutter/material.dart';

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
                children: <Widget>[JeansPage(), JeansTalla()],
              ),
              ListView(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 100.0),
                children: <Widget>[_Cinturilla()],
              ),
              ListView(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 100.0),
                children: <Widget>[_Short()],
              ),
              ListView(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 90.0),
                children: <Widget>[_Body()],
              )
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _Cinturilla() {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(10.0),
      child: Center(
        child: Image.asset(
          'assets/images/cinturilla.png',
          height: 200.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _Short() {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(10.0),
      child: Center(
        child: Image.asset(
          'assets/images/short.png',
          height: 200.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _Body() {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(10.0),
      child: Center(
        child: Image.asset(
          'assets/images/body.png',
          height: 200.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
