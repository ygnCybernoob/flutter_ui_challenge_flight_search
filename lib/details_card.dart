import 'package:flight_search/multicity_input.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatefulWidget {
  @override
  _DetailsCardState createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard>
    with SingleTickerProviderStateMixin {
  AnimationController _transitionAnimationController;

  @override
  void initState() {
    super.initState();
    _transitionAnimationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: DefaultTabController(
        child: new LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return AnimatedBuilder(
              animation: _transitionAnimationController,
              builder: (context, child) => Column(
                    children: <Widget>[
                      _tabBar(
                          showFirstOption:
                              !_transitionAnimationController.isCompleted),
                      Expanded(
                        child: SingleChildScrollView(
                          child: new ConstrainedBox(
                            constraints: new BoxConstraints(
                              minHeight: viewportConstraints.maxHeight - 48.0,
                            ),
                            child: new IntrinsicHeight(
                                child: Column(
                              children: <Widget>[
                                MulticityInput(),
                                Expanded(
                                  child: Container(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      _transitionAnimationController.forward();
                                    },
                                    child: Icon(Icons.timeline),
                                  ),
                                ),
                              ],
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
            );
          },
        ),
        length: 3,
      ),
    );
  }

  Stack _tabBar({bool showFirstOption}) {
    return Stack(
      children: <Widget>[
        new Positioned.fill(
          top: null,
          child: new Container(
            height: 2.0,
            color: new Color(0xFFEEEEEE),
          ),
        ),
        new TabBar(
          tabs: [
            Tab(text: showFirstOption ? "Flight" : "Price"),
            Tab(text: showFirstOption ? "Train" : "Duration"),
            Tab(text: showFirstOption ? "Bus" : "Stops"),
          ],
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
        ),
      ],
    );
  }
}