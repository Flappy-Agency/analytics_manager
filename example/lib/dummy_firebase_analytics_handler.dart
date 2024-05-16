import 'package:analytics_manager/analytics_manager.dart';
import 'package:example/analytics/analytics_events.dart';

class DummyFirebaseAnalyticsHandler extends AnalyticsHandler {
  @override
  List<Type> ignoredEvents() {
    return <Type>[LoginEvent];
  }

  @override
  Future<void> initialize() async {
    print('DummyFirebaseAnalyticsHandler: initializing');
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> handleEvent(AnalyticsEvent event) async {
    final formattedEventName = formatToSnakeCase(event.name);
    print('DummyFirebaseAnalyticsHandler: event $formattedEventName with parameters: ${event.parameters}');
  }

  @override
  Future<void> setUserEmail(String userEmail) async {
    print('DummyFirebaseAnalyticsHandler, setting user email: $userEmail');
  }

  @override
  Future<void> setUserId(String userId) async {
    print('DummyFirebaseAnalyticsHandler, setting user id: $userId');
  }

  @override
  Future<void> setUserProperty(String name, dynamic value) async {
    print('DummyFirebaseAnalyticsHandler, setting user property: $name, $value');
  }

  @override
  Future<void> deleteAccount() async {
    print('DummyFirebaseAnalyticsHandler, deleting account');
  }

  @override
  Future<void> logOutUser() async {
    print('DummyFirebaseAnalyticsHandler, logging out user');
  }
}
