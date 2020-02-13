import 'package:flutter/material.dart';

class TellCard extends StatefulWidget {


  TellCard({Key key, this.username, this.card_text, this.tag, this.time_ago, this.userIcon}) : super(key: key);
  String username, userIcon, card_text, tag, time_ago;

  @override
  _TellCardState createState() => _TellCardState();
}

class _TellCardState extends State<TellCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.25,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 64, 255, 221),
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(left: 10.0, top: 8.0, right: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.brown.shade800,
                          child: Text('SB'),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "${widget.username}",
                          style: TextStyle(color: Colors.black54),
                        )
                      ]),
                      Row(
                        children: <Widget>[
                          Container(child: Icon(Icons.bookmark_border)),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(child: Icon(Icons.more_horiz))
                        ],
                      ),
                    ])),
            Container(
                margin: EdgeInsets.all(10.0),
                child: Text(
                    "${widget.card_text}",
                    style: TextStyle(fontSize: 20.0))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(6.0),
                  margin: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 192, 7),
                    borderRadius: BorderRadius.circular(2.0)
                  ),
                  child: Text("${widget.tag}", style: TextStyle(color: Colors.white),)
                ),
                Container(
                  margin: EdgeInsets.only(right: 10.0),
                  child: Text("${widget.time_ago}")
                )
              ],
            )
          ]),
    );
  }
}
