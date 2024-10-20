import 'package:analytics_manager/analytics_manager.dart';
import 'package:example/analytics/analytics_events.dart';
import 'package:flutter/material.dart';

import 'dummy_firebase_analytics_handler.dart';

void main() async {
  await AnalyticsManager.initialize(
    loggingEnabled: true,
    handlers: [
      DummyFirebaseAnalyticsHandler(),
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _logSomeThings() {
    AnalyticsManager.instance.logEvent(SignupEvent());
    AnalyticsManager.instance.logEvent(LoginEvent());
    AnalyticsManager.instance.logEvent(LogoutEvent());
    AnalyticsManager.instance.logEvent(AddToCartEvent('Bande dessinnée'));
    AnalyticsManager.instance.setUserId('john_doe');
    AnalyticsManager.instance.setUserEmail('john@doe.com');
    AnalyticsManager.instance.setUserProperty('age', 25);
    AnalyticsManager.instance.logOutUser();
    AnalyticsManager.instance.deleteAccount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(child: Text('Hello')),
      floatingActionButton: FloatingActionButton(
        onPressed: _logSomeThings,
        child: const Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
