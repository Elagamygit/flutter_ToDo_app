// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ToDO extends StatelessWidget {
  final String vartittle;
  final bool doneOrNot;
  final Function changestatus;
  final int index;
  final Function removetask;
  const ToDO(
      {super.key,
      required this.removetask,
      required this.index,
      required this.vartittle,
      required this.changestatus,
      required this.doneOrNot});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changestatus(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Color.fromRGBO(209, 224, 224, 0.4),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                
                vartittle,
                style: TextStyle(fontSize: 30,
                decoration: doneOrNot? TextDecoration.lineThrough:TextDecoration.none,
                 color: doneOrNot? Colors.black: Colors.white),
              ),
              
             Row(children: [
               Icon(
                doneOrNot ? Icons.check : Icons.close,
                size: 35,
                color: doneOrNot ? Colors.green[400] : Colors.red,
              ),
              SizedBox(width: 10,),
              IconButton(
                onPressed: (){
                  removetask(index);
                }, 
              icon: Icon(Icons.delete,color: Color.fromARGB(255, 234, 125, 117),)),
             ],)
            ],
          ),
        ),
      ),
    );
  }
}
