import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardBtn extends StatelessWidget{

  final String _rotulo;
  final IconData _icon;
  final Function onClick;

  CardBtn(this._rotulo, this._icon,{@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            color: Theme.of(context).primaryColor,
            child: InkWell (
              child: Container(
                height:	100,
                width:	150,
                padding:	EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment:	MainAxisAlignment.spaceBetween,
                  crossAxisAlignment:	CrossAxisAlignment.start,
                  children:	<Widget>[
                    Icon(_icon,color:	Colors.white, size: 24),
                    Text('$_rotulo', style: TextStyle(color: Colors.white,fontSize: 16.0)),
                  ],
                ),
              ),
              onTap: (){
                onClick();
              },
            ),
          ),
        ),
      ]
    );
  }
}