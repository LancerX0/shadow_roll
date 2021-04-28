import 'package:flutter/material.dart';
import 'package:shadow_roll/roll_result.dart';
import 'package:flutter_picker/flutter_picker.dart';

class RollPage extends StatefulWidget {
  List<Widget> _throws = [new RollRow(dicePool: 3,)];
  @override
  RollPage(): super() {
    _throws.clear();
  }

  @override
  _RollPageState createState() => _RollPageState();
}

class _RollPageState extends State<RollPage> {
  int _dicePool = 1;

  _showIntegerDialog(BuildContext context) async {
    final result = await Picker(
      adapter: NumberPickerAdapter(data: [
          NumberPickerColumn(
              initValue: _dicePool,
              begin: 1,
              end: 99,
              onFormatValue: (v) {
                return v < 10 ? "0$v" : "$v";
              }
          ),
        ]),
      changeToFirst: true,
      hideHeader: false,
      selectedTextStyle: TextStyle(color: Colors.blue),
      // builderHeader: (context) {
      //   final picker = PickerWidget.of(context);
      //   return picker?.data?.title ?? Text("xxx");
      // },
      onConfirm: (picker, value) {
        setState(() {
          _dicePool = value[0]+1;
        });
      }
    ).showModal(this.context); //_sca
    print("result: $result");// ffoldKey.currentState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SingleChildScrollView(
      child: 
        Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,            
            children: widget._throws
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).accentColor),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.clear_all),
                  onPressed: () {
                    setState(() {widget._throws.clear();});
                    },
                  ),
                IconButton(
                  icon: const Icon(Icons.remove_circle),
                  onPressed: () {
                    setState(() {if (_dicePool>1) _dicePool = _dicePool-1;});
                    },
                  ),
                IconButton(
                  icon: const Icon(Icons.add_circle),
                  onPressed: () {
                    setState(() {_dicePool = _dicePool+1;});
                  },
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
              onPressed: () {},  
        child: 
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            

            onPressed: () {
              setState(() {widget._throws.insert(0,new RollRow(dicePool: _dicePool,));});
            },
            onLongPress: () {_showIntegerDialog(context);},
            child: 
              Text(_dicePool.toString()),
            )

      )
    );
  }
}

