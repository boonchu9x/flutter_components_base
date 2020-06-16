import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'longlist.dart';

class DropDownButton extends StatefulWidget {
  @override
  _DropDownButtonState createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  var _stringCity = ['Ha Noi', 'Ho Chi Minh', 'Da Nang'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
            alignment: Alignment.center,
            child: _buildTextField(),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
            alignment: Alignment.center,
            child: _builDropDownButton(),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SizedBox(
                    height: 46,
                    child: RaisedButton(
                      elevation: 1,
                      highlightElevation: 3,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LongListScreen(),
                            ));
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.blue[400],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //appbar
  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'Drop Down Button',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      elevation: 0,
      leading: InkWell(
        customBorder: new CircleBorder(),
        onTap: () {


          //finish app
          SystemNavigator.pop();
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: 24,
          color: Colors.white,
        ),
      ),
    );
  }

  //text field
  TextField _buildTextField() {
    return TextField(
      onSubmitted: (String userInput) {
        setState(() {
          debugPrint('Submit TextField');
        });
      },
      decoration: InputDecoration(
        hintText: 'Type text in here',
        icon: Icon(
          Icons.border_color,
          color: Color(0xFF737373),
          size: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          gapPadding: 5,
        ),
      ),
    );
  }

  DropdownButton _builDropDownButton() {
    return DropdownButton<String>(
      items: _stringCity.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (String newValueSelected) {
        setState(() {
          debugPrint(newValueSelected);
        });
      },
      elevation: 1,
    );
  }
}
