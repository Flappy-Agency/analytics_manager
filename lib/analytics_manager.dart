library analytics_manager;

import 'package:analytics_manager/src/analytics_event.dart';
import 'package:analytics_manager/src/analytics_handler.dart';
import 'package:flutter/foundation.dart';

export 'src/analytics_event.dart';
export 'src/analytics_handler.dart';

class AnalyticsManager {
  final List<AnalyticsHandler> handlers;
  final bool loggingEnabled;

  static AnalyticsManager? _instance;

  static Future<AnalyticsManager> initialize({
    required List<AnalyticsHandler> handlers,
    bool loggingEnabled = true,
  }) async {
    if (_instance != null) {
      throw Exception('AnalyticsManager is already initialized');
    }

    final List<AnalyticsHandler> initializedHandlers = [];

    for (final handler in handlers) {
      await handler.initialize();
      initializedHandlers.add(handler);
    }

    _instance = AnalyticsManager._internal(handlers: initializedHandlers, loggingEnabled: loggingEnabled);
    return _instance!;
  }

  AnalyticsManager._internal({required this.handlers, this.loggingEnabled = true});

  static AnalyticsManager get instance {
    if (_instance == null) {
      throw Exception('AnalyticsManager is not initialized');
    }

    return _instance!;
  }

  void logEvent(AnalyticsEvent event) async {
    if (!loggingEnabled) {
      if (kDebugMode) {
        print('[AnalyticsManager] ${event.name} event ignored because logging is disabled}');
      }
      return;
    }
    for (final handler in handlers) {
      final ignoredEvents = handler.ignoredEvents();
      if (ignoredEvents.contains(event.runtimeType)) {
        continue;
      }

      handler.handleEvent(event);
    }
  }

  Future setUserEmail(String userEmail) async {
    if (!loggingEnabled) {
      if (kDebugMode) {
        print('[AnalyticsManager] setUserEmail ignored because logging is disabled}');
      }
      return;
    }
    for (final handler in handlers) {
      await handler.setUserEmail(userEmail);
    }
  }

  Future setUserId(String userId) async {
    if (!loggingEnabled) {
      if (kDebugMode) {
        print('[AnalyticsManager] setUserId ignored because logging is disabled}');
      }
      return;
    }
    for (final handler in handlers) {
      await handler.setUserId(userId);
    }
  }

  Future logOutUser() async {
    if (!loggingEnabled) {
      if (kDebugMode) {
        print('[AnalyticsManager] logOutUser ignored because logging is disabled');
      }
      return;
    }

    for (final handler in handlers) {
      await handler.logOutUser();
    }
  }

  Future setUserProperty(String name, dynamic value) async {
    if (!loggingEnabled) {
      if (kDebugMode) {
        print('[AnalyticsManager] setUserProperty ignored because logging is disabled}');
      }
      return;
    }

    for (final handler in handlers) {
      await handler.setUserProperty(name, value);
    }
  }

  Future deleteAccount() async {
    if (!loggingEnabled) {
      if (kDebugMode) {
        print('[AnalyticsManager] deleteAccount ignored because logging is disabled');
      }
      return;
    }

    for (final handler in handlers) {
      await handler.deleteAccount();
    }
  }
}
