import 'package:shadow_roll/roll_page.dart';
import 'package:shadow_roll/stat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shadow_roll/global.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
    ),
  );
}

class HomePage extends StatefulWidget {
  GlobalVariables glob = new GlobalVariables();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool flag = true;
  
  @override
  Widget build(BuildContext context) {
    final drawerHeader = UserAccountsDrawerHeader(
      accountName: Text(
        "Roll for Your Destiny",
      ),
      accountEmail: Text(
        "Chummer",
      ),
      currentAccountPicture: const CircleAvatar(
        child: FlutterLogo(size: 42.0),
      ),
    );
  final drawerItems = ListView(
      children: [
        drawerHeader,
        SwitchListTile(
          value: widget.glob.getHouseRuleCountGlitch,
          title: Text(
            "Custom Glitch Calculate",
          ),
          
          onChanged: (value) => setState(() {widget.glob.setHouseRuleCountGlitch = value;}),
        ),
      ],
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColorLight: Colors.deepPurple[200],
        primaryColor: Colors.deepPurple,
        primaryColorDark: Colors.deepPurple[800],
        accentColor: Colors.yellow,

        // Define the default font family.
        fontFamily: 'Impact',
      ),
      home: DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            
            bottom: TabBar(
              tabs: [
                Tab(
                  //icon: Icon(Icons.flash_on),
                  text: 'Roll',
                ),
                
              ],
            ),
            title: Text('ShadowRun Roll'),
          ),
          body: TabBarView(
            children: [
              RollPage(),
              //StatPage(),
            ],
          ),
          drawer: Drawer (
            child: drawerItems,
          ),
        )
      )
    );
  }
}

