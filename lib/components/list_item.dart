import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget listItem(
  Color color,
  String title,
  String day,
  String month,
  String year,
  String clock1,
  String clock2,
  String clock3,
  String totalTime,
) =>
    Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              offset: Offset(1.0, 1.3),
              blurRadius: 1.0,
            ),
          ],
//          color: Color(0xFFd7ccc8),
          color: Colors.blueGrey[100],
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        height: 80.0,
        child: Row(
          children: <Widget>[
            Expanded(
//              flex: 2,
              child: Container(
                decoration: BoxDecoration(
//                  color: Colors.white,
                  border: Border(
                    right: BorderSide(
                      width: 1.0,
                      color: Colors.blueGrey[200],
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      day,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blueGrey[900],
                        fontSize: 55.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            month,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 3.0,
                            ),
                            child: Text(
                              year,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          )
                        ])
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 5.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(
                          '1ºPeriodo:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                        Container(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 2.0, bottom: 2.0),
                            child: Text(
                              'Pausa:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                            child: Text(
                          '2ºPeriodo:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
//                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(child: Text(clock1)),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                          child: Container(child: Text(clock2)),
                        ),
                        Container(child: Text(clock3)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100.0,
                    decoration: BoxDecoration(
//                  color: Colors.white,
                      border: Border(
                        left: BorderSide(
                          width: 1.0,
                          color: Colors.blueGrey[200],
                        ),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 19.0, left: 8.0),
                          child: Text('Total do dia'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10.0,
//                        right: 15.0,
                          ),
                          child: Text(
                            totalTime,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.teal[600],
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Icon(
                      Icons.more_vert,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
