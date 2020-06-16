import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      //appbar
      appBar: AppBar(
        title: Text('Long List'),
        elevation: 0,
      ),

      //body
      body: _getListView(),


      //floating button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},

        //icon
        child: Icon(Icons.add),

        //text show when longpress
        tooltip: 'Add new item',

        //shadow 2
        elevation: 2,
      ),


    );
  }
}

//get list string
List<String> getListElement() {
  var items = List<String>.generate(100, (counter) => 'Item $counter');
  return items;
}

//get listview
Widget _getListView() {
  var listItems = getListElement();

  var listView = ListView.builder(itemBuilder: (context, index) {
    return ListTile(
      onTap: () {
        showSnackBar(context, listItems[index]);
      },

      //icon start item listview
      leading: Icon(Icons.accessibility),

      //text item
      title: Text(
        listItems[index],
        style: TextStyle(
          color: Colors.blue[400],
          fontSize: 20,
        ),
      ),

      //icon last item
      trailing: Icon(Icons.arrow_forward_ios),
    );
  });

  return listView;
}

//show snackbar
void showSnackBar(BuildContext context, String item) {
  var snackBar = SnackBar(
    content: Text('You just tap $item'),
    action: SnackBarAction(
      textColor: Colors.blue[400],
      label: 'OK',
      onPressed: () {},
    ),
  );

  Scaffold.of(context).showSnackBar(snackBar);
}
