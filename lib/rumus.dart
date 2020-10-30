import 'package:batch3week2/kubus.dart';
import 'package:batch3week2/lingkaran.dart';
import 'package:batch3week2/rectangle.dart';
import 'kubus.dart';
import 'package:flutter/material.dart';



class Rumus extends StatefulWidget {
  @override
  _RumusState createState() => _RumusState();
}

class _RumusState extends State<Rumus> with SingleTickerProviderStateMixin{

  TabController _tabController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          Kubus(),
          Lingkaran(),
          Rectangle(),
        ],
        controller: _tabController,
      ),
      bottomNavigationBar: BottomAppBar(
          child: TabBar(
            labelColor: Colors.deepPurple,
            unselectedLabelColor: Colors.lightGreen,
            tabs:[
              Tab(
                text: "Cube",
                icon: Icon(Icons.check_box_outline_blank),
              ),
              Tab(
                  text: "Circle",
                  icon: Icon(Icons.circle)
              ),
              Tab(
                  text: "Rectangle",
                  icon: Icon(Icons.web_asset)
              ),
            ],
            controller: _tabController,
          )
      ),
    );
  }
}
