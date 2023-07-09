import 'package:analytics_manager/analytics_manager.dart';

class SignupEvent extends AnalyticsEvent {
  SignupEvent() : super(name: 'signup');
}

class LoginEvent extends AnalyticsEvent {
  LoginEvent() : super(name: 'login');
}

class LogoutEvent extends AnalyticsEvent {
  LogoutEvent() : super(name: 'logout');
}

class AddToCartEvent extends AnalyticsEvent {
  final String productName;

  AddToCartEvent(this.productName) : super(name: 'Add to cart', parameters: {'product_name': productName});
}
