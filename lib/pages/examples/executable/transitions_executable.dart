import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class AnimatedPage extends Page {
  final Widget child;

  AnimatedPage(this.child, LocalKey key, String name) : super(key: key, name: name);

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (_, animation, __) => Material(
        clipBehavior: Clip.hardEdge,
        child: RotationTransition(
          turns: animation,
          child: child,
        ),
      ),
    );
  }
}

abstract class BaseWidget extends StatelessWidget {
  String get title;

  String get buttonText;

  String get pushTo;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => context.vRouter.push(pushTo),
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends BaseWidget {
  @override
  String get title => 'Home';

  @override
  String get buttonText => 'Go to Settings';

  @override
  String get pushTo => '/examples/transitions/settings';
}

class SettingsScreen extends BaseWidget {
  @override
  String get title => 'Settings';

  @override
  String get buttonText => 'Go to Home';

  @override
  String get pushTo => '/examples/transitions/';
}
