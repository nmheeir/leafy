import 'package:flutter/material.dart';

class HistoryObserver extends NavigatorObserver {
  final List<Route<dynamic>> _history = [];

  // Hàm helper để in log stack hiện tại
  void _printStack() {
    print('--- CURRENT NAVIGATION STACK ---');
    if (_history.isEmpty) {
      print('Stack is empty');
    } else {
      // Duyệt qua history và in tên route (hoặc path trong GoRouter)
      for (var i = 0; i < _history.length; i++) {
        final route = _history[i];
        final name = route.settings.name ?? 'Unnamed Route';
        final args = route.settings.arguments != null
            ? ' | Args: ${route.settings.arguments}'
            : '';
        print('Index $i: $name $args');
      }
    }
    print('--------------------------------');
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _history.add(route);

    print('🔴 ACTION: Push -> ${route.settings.name}');

    // NẾU LÀ ROUTE SEARCH-OL BỊ LỖI, HÃY IN STACK TRACE
    if (route.settings.name == '/search-ol') {
      // Hoặc check biến Routes.searchOl
      print('🔍 TÌM THẤY KẺ GỌI SEARCH-OL! Dưới đây là bằng chứng:');
      // In 10 dòng đầu tiên của stack trace để biết file nào gọi lệnh push
      print(StackTrace.current.toString().split('\n').join('\n'));
    }

    _printStack();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _history.remove(route);
    print('ACTION: Pop');
    _printStack();
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    _history.remove(route);
    print('ACTION: Remove');
    _printStack();
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
    print('ACTION: Replace');
    _printStack();
  }
}
