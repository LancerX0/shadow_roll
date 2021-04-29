import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shadow_roll/global.dart';

Image intToDice(int result,Color col)
{
  String path = 'images/dice-';
  if (col.computeLuminance() > 0.5) 
    path += 'dark-';
  else 
    path += 'light-';
  path += result.toString()+'.png';
  return Image(image: AssetImage(path),width : 40,color: col,);
}

class RollRow extends StatefulWidget {
  
  GlobalVariables glob = new GlobalVariables();
  bool exploded = false;
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
      return glitch*2 > rolls.length;
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
    updateResultRow();
  }

  void updateResultRow(){
    if (isCriticalGlitch())
      result = "CRITICAL GLITCH!";
    else if (isGlitch())
      result = "GLITCH with "+hits.toString()+" hits";
    else
      result = hits.toString()+" hits";
  }
  void explodeDices()
  {
    if (exploded) return;
    hits = 0;
    glitch = 0;
    sum = 0;
    var rng = new Random();
    for (var i = 0; i < rolls.length; i++) 
    {
      if (rolls[i]==6) rolls.add(rng.nextInt(6)+1);
      if(rolls[i]>4) hits++;
      if(rolls[i]<2) glitch++;
      sum += rolls[i];
    }
    updateResultRow();
    exploded = true;
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
      onDoubleTap: () => setState(() {widget.explodeDices();}),
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