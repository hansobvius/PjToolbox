import 'package:flutter/material.dart';

const kExpandedHeight = 250.0;

const kPrimaryColor = Color(0xFFcfd8dc); //bluegrey[100]
const kSecondaryColor = Color(0xFF455a64); //bluegrey[700]
const kMainFontColor = Color(0xFF263238); //bluegrey[900]

const kGreetings = Text('Usuário, vamos começar o dia?',
    style: TextStyle(
      color: Color(0xFFCFD8DC),
      fontSize: 35.0,
    ));

const kClock1 = Text(
  '03:00:00',
  style: TextStyle(
    color: Color(0xFFCFD8DC),
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
  ),
);

const kClock2 = Text(
  '01:00:00',
  style: TextStyle(
    color: Color(0xFFCFD8DC),
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
  ),
);

const kClock3 = Text(
  '05:00:00',
  style: TextStyle(
    color: Color(0xFFCFD8DC),
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
  ),
);

const kClockTotal = Text(
  '08:00:00',
  style: TextStyle(
    color: Color(0xFFCFD8DC),
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
  ),
);

const kCaptionClock1 = Text(
  'Tempo rodando',
  style: TextStyle(
    color: Color(0xFF263238),
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
  ),
);

const kCaptionClock2 = Text(
  'Tempo de pausa',
  style: TextStyle(
    color: Color(0xFF263238),
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
  ),
);

const kCaptionClock3 = Text(
  'Tempo rodando',
  style: TextStyle(
    color: Color(0xFF263238),
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
  ),
);

const kCaptionClockTotal = Text(
  'Total do dia',
  style: TextStyle(
    color: Color(0xFF263238),
    fontSize: 35.0,
    fontWeight: FontWeight.bold,
  ),
);

const kSuccess = Text('Horas armazenadas, até amanhã!',
    style: TextStyle(
      color: Color(0xFFCFD8DC),
      fontSize: 45.0,
    ));

//Animação inicial box superior
final DecorationTween kDecorationTween = DecorationTween(
  begin: BoxDecoration(
    color: Colors.blueGrey[700],
  ),
  end: BoxDecoration(
    boxShadow: <BoxShadow>[
      BoxShadow(
        color: Colors.black,
        offset: Offset(1.0, 1.0),
        blurRadius: 3.0,
      ),
    ],
    color: Colors.blueGrey[700],
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(25.0),
      bottomRight: Radius.circular(25.0),
    ),
  ),
);
