import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@lazySingleton
class HistoryObserver extends NavigatorObserver {
  final Logger _logger;
  final List<Route<dynamic>> _history = [];

  HistoryObserver(this._logger);

  // Helper để log stack hiện tại gom vào 1 message
  void _logStack() {
    if (_history.isEmpty) {
      _logger.d('Navigation Stack: [EMPTY]');
      return;
    }

    final buffer = StringBuffer('--- CURRENT NAVIGATION STACK ---\n');
    for (var i = 0; i < _history.length; i++) {
      final route = _history[i];
      final name = route.settings.name ?? 'Unnamed Route';
      final args = route.settings.arguments != null
          ? ' | Args: ${route.settings.arguments}'
          : '';
      buffer.writeln('[$i] $name $args');
    }
    _logger.d(buffer.toString());
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _history.add(route);

    _logger.i('🔴 ACTION: Push -> ${route.settings.name}');

    // Logic debug đặc biệt cho /search-ol
    if (route.settings.name == '/search-ol') {
      _logger.w(
        '🔍 TÌM THẤY KẺ GỌI SEARCH-OL!',
        error: 'Route /search-ol vừa được push vào stack.',
        stackTrace:
            StackTrace.current, // Logger sẽ tự format stack trace đẹp hơn
      );
    }

    _logStack();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _history.remove(route);
    _logger.i('ACTION: Pop -> ${route.settings.name}');
    _logStack();
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    _history.remove(route);
    _logger.i('ACTION: Remove -> ${route.settings.name}');
    _logStack();
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (oldRoute != null) {
      final index = _history.indexOf(oldRoute);
      if (index != -1 && newRoute != null) {
        _history[index] = newRoute;
      } else {
        _history.remove(oldRoute);
        if (newRoute != null) _history.add(newRoute);
      }
    }
    _logger.i('ACTION: Replace');
    _logStack();
  }
}
