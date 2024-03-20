# Why this package?

It happens a lot that a project has multiple analytics handlers, like Firebase, Amplitude, OneSignal, etc.  
This package aims to provide a simple way to handle multiple Analaytics handlers.


## Getting started

### Create as `AnalyticsHandler` as needed:
```
class DummyAnalyticsHandler extends AnalyticsHandler {  

  @override  
  Future<void> initialize() {  
    ...  
  }  
  
  @override  
  Future<void> deleteAccount() {  
    ...  
  }  
  
  @override  
  Future<void> handleEvent(AnalyticsEvent event) {  
    ...  
  }  
 
  
  @override  
  Future<void> setUserEmail(String userEmail) {  
    ...  
  }  
  
  @override  
  Future<void> setUserId(String userId) {  
    ...  
  }  
  
  @override  
  Future<void> setUserProperty(String name, value) {  
    ...  
  }  
}
```

### Initialize AnalyticsHandler:

```
await AnalyticsManager.initialize(handlers: [DummyAnalyticsHandler()]);
```
### Create custom events:

``` 
class AddToCartEvent extends AnalyticsEvent {  
  final String productName;  
  
  AddToCartEvent(this.productName)  
      : super(  
          name: 'add_to_cart',  
          parameters: {  
            'product_name': productName,  
          },  
        );  
}
```

### Send events & user properties when needed in your widgets:
```
AnalyticsManager.instance.logEvent(AddToCartEvent('My awesome product'));
AnalyticsManager.instance.setUserProperty('first_name', 'Bob');
```