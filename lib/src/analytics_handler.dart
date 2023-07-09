import 'analytics_event.dart';

abstract class AnalyticsHandler {
  Future<void> initialize();

  Future<void> handleEvent(AnalyticsEvent event);

  Future<void> setUserId(String userId);

  Future<void> setUserEmail(String userEmail);

  Future<void> setUserProperty(String name, dynamic value);

  Future<void> deleteAccount();

  List<Type> ignoredEvents() {
    return [];
  }

  String formatToSnakeCase(String value) {
    return value.toLowerCase().replaceAll(' ', '_');
  }
}
