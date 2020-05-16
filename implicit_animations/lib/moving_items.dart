import 'package:flutter/material.dart';

class MovingItems extends StatefulWidget {
  @override
  _MovingItemsState createState() => _MovingItemsState();
}

class _MovingItemsState extends State<MovingItems> {
  final listKey = GlobalKey<AnimatedListState>();
  List<String> myList = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated List'),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 40, left: 40, right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'Moving items in the list when adding a new item using animation'),
            SizedBox(height: 50),
            Container(
              width: double.infinity,
              height: 400,
              child: AnimatedList(
                key: listKey,
                initialItemCount: myList.length,
                itemBuilder: (context, index, animation) {
                  return SizeTransition(
                    sizeFactor: animation,
                    child: ListTile(
                      title: Text(myList[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.teal,
        onPressed: () {
          setState(() {
            myList.insert(0, 'New Item');
            listKey.currentState
                .insertItem(0, duration: Duration(milliseconds: 500));
          });
        },
      ),
    );
  }
}
