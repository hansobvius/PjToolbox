import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pj_toolbox/components/alternate_animations.dart';
import 'package:pj_toolbox/components/head_stack_widget.dart';
import 'package:pj_toolbox/components/list_item.dart';
import 'package:pj_toolbox/components/round_animatedicon_button.dart';
import 'package:pj_toolbox/components/round_icon_button.dart';
import 'package:pj_toolbox/components/time_helper.dart';
import 'package:pj_toolbox/contants.dart';
import 'package:pj_toolbox/database/AlternativeDatabase.dart';
import 'package:pj_toolbox/database/DatabaseHelper.dart';
import 'package:pj_toolbox/model/UserGraphDetail.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../custom_page_state.dart';

List<UserGraphDetail> userData = [];

class PrincipalPage extends StatefulWidget {
  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage>
    with TickerProviderStateMixin {
  //Declaração de controllers para animações
  AnimationController _controllerIconPlayPause;
  AnimationController _controllerFadeOutIconPlayPause;
  AnimationController _controllerDecorationTransition;
  AnimationController _controllerPositionStopButton;
  AnimationController _controllerFadeInStopButton;
  AnimationController _controllerFadeInClock1;
  AnimationController _controllerFadeInClock2;
  AnimationController _controllerFadeInClock3;
  AnimationController _controllerFadeInClockTotal;
  AnimationController _controllerCountTimer1;
  AnimationController _controllerCountTimer2;
  AnimationController _controllerCountTimer3;

  final dbHelper = AlternativeDatabase.instance;
  final StreamController<List<UserGraphDetail>> _streamController = StreamController<List<UserGraphDetail>>();

  ScrollController _scrollController;

  CustomPageState _pageState = CustomPageState.APP_STARTED;
  String pauseTime = '';
  String totalTime = '';
  double initialOpacityPlayButtom = 1.0;

  //Declaração de animations
  Animation playPauseButtonFadeOutAnimation;
  Animation stopButtonAnimation;
  Animation stopButtonFadeAnimation;
  Animation<double> fadeInClock1Animation;
  Animation<double> fadeInClock2Animation;
  Animation<double> fadeInClock3Animation;
  Animation<double> fadeInClockTotalAnimation;

  //Inicializa os controllers de animação da página.
  @override
  void initState() {
    _query();
    _controllerDecorationTransition = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);

    _controllerIconPlayPause = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);

    _controllerFadeOutIconPlayPause = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);

    _controllerPositionStopButton = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);

    _controllerFadeInStopButton = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);

    _controllerFadeInClock1 = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);

    _controllerFadeInClock2 = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);

    _controllerFadeInClock3 = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);

    _controllerFadeInClockTotal = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);

    _controllerCountTimer1 =
        AnimationController(duration: Duration(hours: 24), vsync: this);

    _controllerCountTimer2 =
        AnimationController(duration: Duration(hours: 24), vsync: this);

    _controllerCountTimer3 =
        AnimationController(duration: Duration(hours: 24), vsync: this);

    fadeInClock1Animation =
    Tween<double>(begin: 0, end: 1).animate(_controllerFadeInClock1)
      ..addListener(() {
        setState(() {});
      });

    fadeInClock2Animation =
    Tween<double>(begin: 0, end: 1).animate(_controllerFadeInClock2)
      ..addListener(() {
        setState(() {});
      });

    fadeInClock3Animation =
    Tween<double>(begin: 0, end: 1).animate(_controllerFadeInClock3)
      ..addListener(() {
        setState(() {});
      });

    fadeInClockTotalAnimation =
    Tween<double>(begin: 0, end: 1).animate(_controllerFadeInClockTotal)
      ..addListener(() {
        setState(() {});
      });

    playPauseButtonFadeOutAnimation = Tween<double>(begin: 1, end: 0)
        .animate(_controllerFadeOutIconPlayPause);

    stopButtonAnimation =
    Tween(begin: 290.0, end: 210.0).animate(_controllerPositionStopButton)
      ..addListener(() {
        setState(() {});
      });

    stopButtonFadeAnimation =
    Tween(begin: 0.0, end: 1.0).animate(_controllerFadeInStopButton)
      ..addListener(() {
        setState(() {});
      });

    _controllerDecorationTransition.forward();

    _scrollController = ScrollController()
      ..addListener(() => setState(() {
        _scrollListener();
      }));

    super.initState();
  }

  bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset.floor() <= 0.0;
  }

  bool get _showSliverTitle {
    return _scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - kToolbarHeight;
  }

  _scrollListener() {
    if (!(_scrollController.offset.floor() <= 0.0))
      initialOpacityPlayButtom = 0;
    else
      initialOpacityPlayButtom = 1;
//    if (_scrollController.offset >=
//            _scrollController.position.maxScrollExtent &&
//        !_scrollController.position.outOfRange) {
//      setState(() {
//        print("reach the bottom");
//      });
//    }
//    if (_scrollController.offset <=
//            _scrollController.position.minScrollExtent &&
//        !_scrollController.position.outOfRange) {
//      setState(() {
//        print("reach the top");
//      });
//    }
  }

  //Dispose dos controllers de animação da página
  @override
  void dispose() {
    _controllerIconPlayPause?.dispose();
    _controllerDecorationTransition?.dispose();
    _controllerPositionStopButton?.dispose();
    _controllerFadeInClock1?.dispose();
    _controllerFadeInClock2?.dispose();
    _controllerFadeInClock3?.dispose();
    _controllerFadeInClockTotal?.dispose();
    _controllerFadeInStopButton?.dispose();
    _controllerFadeOutIconPlayPause?.dispose();
    _controllerCountTimer1?.dispose();
    _controllerCountTimer2?.dispose();
    _controllerCountTimer3?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<UserGraphDetail, String>> data = [
      charts.Series(
          id: "PJTollBox",
          data: userData,
          domainFn: (UserGraphDetail series, _) => series.mDay,
          measureFn: (UserGraphDetail series, String) => Random().nextInt(10),
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.black)
      )
    ];
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Column(
//        mainAxisSize: MainAxisSize.min,

        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: Stack(
              children: <Widget>[
                CustomScrollView(
                  controller: _scrollController,
                  slivers: <Widget>[
                    SliverAppBar(
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      backgroundColor:
                      _showSliverTitle ? kSecondaryColor : kPrimaryColor,
                      title: AnimatedOpacity(
                        duration: Duration(milliseconds: 150),
                        opacity: _showSliverTitle ? 1 : 0,
                        child: Center(
                          child: Text('PJ ToolBox'),
                        ),
                      ),
                      pinned: true,
                      floating: true,
                      expandedHeight: kExpandedHeight,
                      flexibleSpace: _showSliverTitle
                          ? null
                          : Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Expanded(
                                child: DecoratedBoxTransition(
                                  position: DecorationPosition.background,
                                  decoration: kDecorationTween.animate(
                                      _controllerDecorationTransition),
                                  child: Center(
                                    child: Container(
                                      child: new HeadStackWidget(
                                          pageState: _pageState,
                                          fadeInClock1Animation:
                                          fadeInClock1Animation,
                                          controllerCountTimer1:
                                          _controllerCountTimer1,
                                          fadeInClock2Animation:
                                          fadeInClock2Animation,
                                          controllerCountTimer2:
                                          _controllerCountTimer2,
                                          fadeInClock3Animation:
                                          fadeInClock3Animation,
                                          controllerCountTimer3:
                                          _controllerCountTimer3,
                                          fadeInClockTotalAnimation:
                                          fadeInClockTotalAnimation,
                                          pauseTime: pauseTime,
                                          totalTime: totalTime),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // TODO: Adicionar Gráfico dentro deste child
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: 400.0,
                            height: !userData.isEmpty  ? 200.0 : 0.0,
                            child: !userData.isEmpty
                                ? charts.BarChart(
                                data,
                                animate: true,
                                animationDuration: Duration(
                                    milliseconds: 800
                                ),
                            )
                            : null
                        ),
                      ),
                    ),
                    SliverList(
                      // TODO: Alimentar os dados da lista aqui
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return listItem(
                            kPrimaryColor,
                            "Sliver List item: $index",
                            '21', //dia
                            'DEZ', //mês
                            '2019', //ano
                            '00:00:00', //clock1
                            '00:00:00', //clock2
                            '00:00:00', //clock3
                            '00:00:00', //totalTime
                          );
                        },
                      ),
                    )
                  ],
                ),
                Positioned(
                  left: stopButtonAnimation.value,
                  child: AnimatedOpacity(
                    opacity:
                    _isAppBarExpanded ? stopButtonFadeAnimation.value : 0,
                    duration: Duration(milliseconds: 150),
                    child: RoundIconButton(
                      icon: FontAwesomeIcons.stop,
                      onPressed: () => _isAppBarExpanded
                          ? setState(
                            () {


                          _pageState = CustomPageState.CLOCK_STOPPED;
                          _controllerFadeInClock1.reverse();
                          _controllerFadeInClock2.reverse();
                          _controllerFadeInClock3.reverse();
                          _controllerFadeInClockTotal.forward();
                          _controllerCountTimer3.stop();

                          //Armazena os valores dos 3 timers
                          Duration durationTimer1 =
                              _controllerCountTimer1.duration *
                                  _controllerCountTimer1.value;
                          Duration durationTimer2 =
                              _controllerCountTimer2.duration *
                                  _controllerCountTimer2.value;
                          Duration durationTimer3 =
                              _controllerCountTimer3.duration *
                                  _controllerCountTimer3.value;

                          // TODO: Implementar o salvamento de dados na base aqui
                          //Retorna o somatório dos 3 timers
                          totalTime = secondsToTime(
                              durationTimer1.inSeconds +
                                  durationTimer3.inSeconds);

//                          userData.add(new UserGraphDetail(mDay: userData.length.toString(), mTotalTime: Random().nextInt(10)));

                          _insert(userData.length.toString(), Random().nextInt(10).toString());

                          //Retorna o total de pausa
                          pauseTime =
                              secondsToTime(durationTimer2.inSeconds);

                          if (_controllerIconPlayPause.status ==
                              AnimationStatus.completed)
                            _controllerIconPlayPause.reverse();
                        },
                      )
                          : null,
                    ),
                  ),
                ),
                Positioned(
                  top: 230.0,
                  left: 290.0,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 150),
                    opacity: initialOpacityPlayButtom,
                    child: _pageState != CustomPageState.CLOCK_RESTARTED
                        ? RoundAnimatedIconButton(
                      icon: AnimatedIcons.play_pause,
                      onPressed: () => _isAppBarExpanded
                          ? setState(() {
                        //Se o processo ainda não foi parado
                        if (_pageState !=
                            CustomPageState.CLOCK_STOPPED) {
                          alternateAnimations(
                              _controllerIconPlayPause);

                          if (_pageState ==
                              CustomPageState.APP_STARTED) {
                            _controllerCountTimer1.forward();
                            _controllerIconPlayPause.forward();
                            _controllerFadeInClock1.forward();
                            _controllerPositionStopButton.forward();
                            _controllerFadeInStopButton.forward();
                            _pageState =
                                CustomPageState.CLOCK_STARTED;

                            print('CLOCK_STARTED');
                          } else if (_pageState ==
                              CustomPageState.CLOCK_STARTED) {
                            _controllerCountTimer1.stop();
                            _controllerCountTimer2.forward();
                            _controllerFadeInClock2.forward();
                            _pageState =
                                CustomPageState.PAUSE_STARTED;

                            print('PAUSE_STARTED');
                          } else if (_pageState ==
                              CustomPageState.PAUSE_STARTED) {
                            _controllerCountTimer2.stop();
                            _controllerCountTimer3.forward();
                            _controllerFadeOutIconPlayPause
                                .forward();
                            _controllerPositionStopButton.reverse();
                            _controllerFadeInClock3.forward();
                            _pageState =
                                CustomPageState.CLOCK_RESTARTED;

                            print('CLOCK_RESTARTED');
                          }
                        } else {
                          _controllerFadeInClockTotal.reset();
                          _controllerIconPlayPause.reset();
                          _controllerCountTimer1.reset();
                          _controllerCountTimer2.reset();
                          _controllerCountTimer3.reset();
                          _controllerFadeInClock1.reset();
                          _controllerFadeInClock2.reset();
                          _controllerFadeInClock3.reset();
                          _controllerFadeOutIconPlayPause.reset();
                          _controllerPositionStopButton.reset();
                          _controllerFadeInStopButton.reset();

                          _pageState = CustomPageState.APP_STARTED;
                        }
                      })
                          : null,
                      controller: _controllerIconPlayPause,
                    )
                        : Container(), //Elimina widget da renderização
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

    void _insert(String day, String value) async {
      userData.clear();
      Map<String, dynamic> row = {
        DatabaseHelper.columnDay : day,
        DatabaseHelper.columnTotal  : value
      };
      await dbHelper.insert(row);
      _query();
    }

    void _query() async {
      final allRows = await dbHelper.queryAllRows();
      allRows.forEach((row){
//        var totalTime = int.parse(dbHelper.queryTotal(row).toString());
        userData.add(UserGraphDetail(
            mDay: dbHelper.queryDay(row).toString(), mTotalTime: dbHelper.queryTotal(row).toString()));
        _streamController.sink.add(userData);
        print(row);
      });
    }
}
