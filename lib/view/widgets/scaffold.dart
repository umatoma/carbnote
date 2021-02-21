import 'package:carbnote/view/screens/home/home_screen.dart';
import 'package:carbnote/view/screens/record/record_form_screen.dart';
import 'package:carbnote/view/screens/record/record_summary_screen.dart';
import 'package:carbnote/view/screens/user/user_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CnScaffold extends StatelessWidget {
  const CnScaffold({
    Key key,
    this.resizeToAvoidBottomInset = false,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
  }) : super(key: key);

  final bool resizeToAvoidBottomInset;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final PreferredSizeWidget appBar;
  final Widget body;
  final Widget floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final Widget bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: Theme.of(context).backgroundColor,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      appBar: appBar,
      body: body,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

class CnFavButton extends StatelessWidget {
  const CnFavButton() : super();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.of(context).push(
        CupertinoPageRoute<void>(
          builder: (_) => const RecordFormScreen(),
          fullscreenDialog: true,
        ),
      ),
      child: const Icon(CupertinoIcons.add),
    );
  }
}

class CnBottomNav extends StatelessWidget {
  const CnBottomNav({
    @required this.index,
  }) : super();

  final int index;

  @override
  Widget build(BuildContext context) {
    final List<IconData> icons = [
      CupertinoIcons.home,
      CupertinoIcons.bell,
      CupertinoIcons.chart_bar,
      CupertinoIcons.person,
    ];
    return Hero(
      tag: 'CnBottomNav',
      child: Material(
        elevation: 16,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (final i in [0, 1])
                IconButton(
                  onPressed: index == i ? null : () => _onPressed(context, i),
                  icon: Icon(
                    icons[i],
                    color: index == i
                        ? Theme.of(context).primaryColorLight
                        : Theme.of(context).primaryColor,
                  ),
                ),
              const SizedBox(width: 32),
              for (final i in [2, 3])
                IconButton(
                  onPressed: index == i ? null : () => _onPressed(context, i),
                  icon: Icon(
                    icons[i],
                    color: index == i
                        ? Theme.of(context).primaryColorLight
                        : Theme.of(context).primaryColor,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressed(BuildContext context, int toIndex) {
    switch (toIndex) {
      case 0:
        Navigator.of(context).pushReplacement(
          PageTransition<void>(
            child: const HomeScreen(),
            type: PageTransitionType.fade,
          ),
        );
        break;
      case 1:
        break;
      case 2:
        Navigator.of(context).pushReplacement(
          PageTransition<void>(
            child: const RecordSummaryScreen(),
            type: PageTransitionType.fade,
          ),
        );
        break;
      case 3:
        Navigator.of(context).pushReplacement(
          PageTransition<void>(
            child: const ProfileScreen(),
            type: PageTransitionType.fade,
          ),
        );
        break;
      default:
    }
  }
}
