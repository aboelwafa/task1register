// ignore_for_file: unused_field, non_constant_identifier_names, unused_element, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:googleflutter/constants/colors.dart';
class NoteScreen extends StatelessWidget {
    
  NoteScreen({super.key});
  final ListItem = [];
  final GlobalKey<AnimatedListState> _listkey = GlobalKey();

  // function add item
  void _addItem() {
    ListItem.insert(0, 'item ${ListItem.length + 1}');
    _listkey.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }
  // function removeItem

  void _removeItem(int index) {
    _listkey.currentState!.removeItem(index, (context, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: const Card(
          margin: EdgeInsets.all(10),
          color: Colors.red,
          child: ListTile(
            title: Text(
              'Deleted',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      );
    }, duration: const Duration(milliseconds: 500));
    ListItem.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.black1,
      appBar: AppBar(
          backgroundColor: MyColors.black1,
        title:const Text(
          textAlign: TextAlign.center,
          'Flutter Maps',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ) ,
        centerTitle: true,
       
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20)
              ),
              child: IconButton(
                  onPressed: _addItem,
                  icon: Icon(
                    Icons.add,
                    size: 24,
                    color: Colors.blue,
                  )),
            ),
          ),
          Expanded(child: AnimatedList(
            key: _listkey,
            initialItemCount: 0,
            padding: EdgeInsets.all(10),
            itemBuilder: (context, index, animation) {
              return SizeTransition(
                key: UniqueKey(),

                sizeFactor: animation,
                child:  Card(
                  margin: EdgeInsets.all(10),
                  color: Colors.orangeAccent,
                  child: ListTile(
                    title: Text(
                      ListItem[index],style:const TextStyle(
                      fontSize: 24,
                    ),),
                  trailing: IconButton(onPressed:(){
                    _removeItem(index);
                  } ,icon: Icon(Icons.delete),),
                  ),

                ),
                );
            },
          )),
        
        ],
      ),
    );
  }
}
