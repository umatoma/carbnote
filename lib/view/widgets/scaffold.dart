import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CnScaffold extends StatelessWidget {
  const CnScaffold({
    Key key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
  }) : super(key: key);

  final PreferredSizeWidget appBar;
  final Widget body;
  final Widget floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final Widget bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBar,
      body: body,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

class CnBottomNav extends StatelessWidget {
  const CnBottomNav({
    @required this.index,
    @required this.onPressed,
  }) : super();

  final int index;
  final void Function(int index) onPressed;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: index == 0 ? null : () => onPressed(0),
            icon: Icon(
              CupertinoIcons.home,
              color: index == 0
                  ? Theme.of(context).primaryColorLight
                  : Theme.of(context).primaryColor,
            ),
          ),
          IconButton(
            onPressed: index == 1 ? null : () => onPressed(1),
            icon: Icon(
              CupertinoIcons.bell,
              color: index == 1
                  ? Theme.of(context).primaryColorLight
                  : Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(width: 32),
          IconButton(
            onPressed: index == 2 ? null : () => onPressed(2),
            icon: Icon(
              CupertinoIcons.chart_bar,
              color: index == 2
                  ? Theme.of(context).primaryColorLight
                  : Theme.of(context).primaryColor,
            ),
          ),
          IconButton(
            onPressed: index == 3 ? null : () => onPressed(3),
            icon: Icon(
              CupertinoIcons.person,
              color: index == 3
                  ? Theme.of(context).primaryColorLight
                  : Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
