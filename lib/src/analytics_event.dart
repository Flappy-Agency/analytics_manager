abstract class AnalyticsEvent {
  final String name;
  final Map<String, dynamic>? parameters;

  const AnalyticsEvent({required this.name, this.parameters});
}
