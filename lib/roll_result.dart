import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shadow_roll/global.dart';

Image intToDice(int result,var col)
{
  Image img;
  
  switch (result) {
    case 1: img = new Image(image: AssetImage('images/dice-dark-1.png'),width : 40,color: col,);break;
    case 2: img = new Image(image: AssetImage('images/dice-light-2.png'),width : 40,color: col,);break;
    case 3: img = new Image(image: AssetImage('images/dice-light-3.png'),width : 40,color: col,);break;
    case 4: img = new Image(image: AssetImage('images/dice-light-4.png'),width : 40,color: col,);break;
    case 5: img = new Image(image: AssetImage('images/dice-dark-5.png'),width : 40,color: col,);break;
    case 6: img = new Image(image: AssetImage('images/dice-dark-6.png'),width : 40,color: col,);break;
    
    default:
      img = new Image(key:Key("img"),image: AssetImage('images/dice-light-1.png'),width : 40);
  } 
  return img;
}

class RollRow extends StatefulWidget {
  
  GlobalVariables glob = new GlobalVariables();

  final int dicePool;
  String result = "";
  List<int> rolls = [];
  
  int hits = 0;
  int glitch = 0;
  int sum = 0;
  bool state = false;
  bool isGlitch() {
    if (glob.getHouseRuleCountGlitch)
      return glitch > hits;
    else
      return glitch*2 > dicePool;
  }

  bool isCriticalGlitch() {
    return hits==0 && isGlitch();
  }

  @override
  RollRow ({key, this.dicePool  = 1}): super(key: key) {
    var rng = new Random();
    hits = 0;
    glitch = 0;
    sum = 0;
    for (var i = 0; i < dicePool; i++) {
      rolls.add(rng.nextInt(6)+1);
      if(rolls[i]>4) hits++;
      if(rolls[i]<2) glitch++;
      sum += rolls[i];
    }
    result = "";
    if (isCriticalGlitch())
      result = "CRITICAL GLITCH!";
    else if (isGlitch())
      result = "GLITCH with "+hits.toString()+" hits";
    else
      result = hits.toString()+" hits";
  }

  @override
  RollRowState createState() {
    return RollRowState();
  }
}

class RollRowState extends State<RollRow>{
  
  RollRowState();

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () => setState(() {widget.state = !widget.state;}),
      child: Column(
      children: [
        Row(
          children: widget.state?[
              Text(' '),
              Text('Sum: ${widget.sum}'),
              Text('Hits: ${widget.hits}'),
              Text('Glitch: ${widget.glitch}'),
              Text(' '), 
          ]:[Text(' '), Text(widget.result), Text(' '), ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.end,
          runSpacing: 1.0,
            children: [
              for (var res in widget.rolls) 
                intToDice(res,
                  (res>4 && !widget.isGlitch())?
                    Theme.of(context).accentColor:
                  (res<2 && widget.isGlitch())?
                    Theme.of(context).accentColor:
                    Theme.of(context).primaryColor),
            ],
        )
      ],
    ),
    );
  } 
}