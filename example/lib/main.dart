import 'package:analytics_manager/analytics_manager.dart';
import 'package:example/analytics/analytics_events.dart';
import 'package:flutter/material.dart';

import 'dummy_firebase_analytics_handler.dart';

void main() async {
  await AnalyticsManager.initialize(handlers: [
    DummyFirebaseAnalyticsHandler(),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  void _incrementCounter() {
    AnalyticsManager.instance.logEvent(SignupEvent());
    AnalyticsManager.instance.logEvent(LoginEvent());
    AnalyticsManager.instance.logEvent(LogoutEvent());
    AnalyticsManager.instance.logEvent(AddToCartEvent('Bande dessinnée'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(child: Text('Hello')),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
