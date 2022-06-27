import 'package:flutter/material.dart';
import 'package:ummah/services/navService/INavigationService.dart';

class NavigationService implements INavigationService {

  final GlobalKey<NavigatorState> _key =  GlobalKey<NavigatorState>();

  @override
  Future<dynamic>?  pushNamed(String path, {Object? object}) {
    return _key.currentState?.pushNamed(path, arguments: object);
  }

  @override
  Future<dynamic>? pushNamedAndRemoveUntil(String path, {Object? object}) {
    return _key.currentState?.pushNamedAndRemoveUntil(path, (route) => false, arguments: object);
  }

  @override
  Future<dynamic>? pushReplacementNamed(String path, {Object? object}) {
    return _key.currentState?.pushReplacementNamed(path, arguments: object);
  }

  @override
  GlobalKey<NavigatorState> key() => _key;

  @override
  void pop([Object? result]) {
    return _key.currentState?.pop(result);
  }

  @override
  Future<bool?> showNAVDialog(String title, String content, {bool dismissOnly = false}) async {

 return await showDialog<bool>(
      context: _key.currentContext!,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title:  Text(title),
          content: Text(content),
          actions: dismissOnly?<Widget>[ TextButton(
            child: const Text('Dismiss'),
            onPressed: () {
              _key.currentState?.pop(true); // Dismiss alert dialog
            },
          ),] :<Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                _key.currentState?.pop(false); // Dismiss alert dialog
              },
            ),
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                _key.currentState?.pop(true); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }


}

