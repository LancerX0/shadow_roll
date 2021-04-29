import 'dart:math';
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
    result = "SUM = "+sum.toString()+" | ";
    if (hits == 0){
      if (glitch > dicePool/2) result += "Critical Glitch";
      else result += "0 Hits";
    } 
    else{
      if (glitch > dicePool/2) result += hits.toString()+" hits+Glitch";
      else result += hits.toString()+" hits";
    }
  }

  @override
  RollRowState createState() {
    return RollRowState();
  }
}

class RollRowState extends State<RollRow>{

  bool isGlitch() {
    if (widget.glob.getHouseRuleCountGlitch)
      return widget.hits==0 || widget.glitch > widget.hits;
    else
      return widget.hits==0 || widget.glitch*2 > widget.dicePool;
  }

  RollRowState();

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Row(
          children: [
              Text(' '),
              Text('Sum: ${widget.sum}'),
              Text('Hits: ${widget.hits}'),
              Text('Glitch: ${widget.glitch}'),
              Text(' '), 
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.end,
          runSpacing: 1.0,
            children: [
              for (var res in widget.rolls) 
                intToDice(res,
                  (res>4 && !isGlitch())?
                    Theme.of(context).accentColor:
                  (res<2 &&  isGlitch())?
                    Theme.of(context).accentColor:
                    Theme.of(context).primaryColor),
            ],
        )
      ],
    );
  } 
}