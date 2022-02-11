# TouchPoint

## Requirements

- iOS 10.0+ 
- Xcode 11+ 
- Swift 5.1+

## Swift Integration:

###### Import  TouchPoint SDK  `import TouchPointKit` & add following code snippet on `didFinishLaunchingWithOptions`

```
let apiKey = API_KEY
let apiSecret = API_SECRET
let podName = TouchPointPods.dev2 //Environment e.g. dev1, dev2, na1, na2 etc.
let screenNames = ["Demo 1", "Demo 2"]
let visitor = ["id": "100", "email": "dinesh_demo@gmail.com", "role": "dev"]

TouchPointActivity.shared.configure(apiKey: apiKey,
                                    apiSecret: apiSecret,
                                    podName: podName,
                                    screenNames: screenNames,
                                    visitor: visitor)
 
// Note: Following are optional properties for developer convenience
// For testing you can set this property to false so that API will not filter data based on visitor id and uuid
TouchPointActivity.shared.shouldApplyAPIFilter = false

// To disable wkwebview caching, set it to true
TouchPointActivity.shared.disableCaching = true

// To change banner height, you can set this property
TouchPointActivity.shared.defaultBannerHeight = 50

// To enable debug logs, set this property to true
TouchPointActivity.shared.enableDebugLogs = true

// If status bar style is dark, set this property to false
TouchPointActivity.shared.isStatusBarStyleLight = false
```

###### In `ViewController`, Import  TouchPoint SDK  `import TouchPointKit` & set the screen name using following code snippet:

```
TouchPointActivity.shared.setScreenName(screenName: SCREEN_NAME)
```

###### This will lookup for any banner for current screen ( SCREEN_NAME) and display the banner automatically. If you want to open TouchPoint activity directly, you can directly call the following method:

```
TouchPointActivity.shared.openActivity(screenName: SCREEN_NAME, delegate: self)
```

###### `TouchPointActivityCompletionDelegate` is required if you want the callback when the TouchPointActivity completed. Otherwise you can pass `nil` in delegate. Following is the `TouchPointActivityCompletionDelegate` delegate method.

```
public func didActivityCompleted() {
    // Calls when TouchPoint activity is completed.
}
```

###### Before calling `openActivityWithScreenName` function, you can check if TouchPoint activity need to be shown or not using following method: 

```
if TouchPointActivity.shared.shouldShowActivity(screenName: SCREEN_NAME) {
    // Call openActivity function of TouchPointActivity
}
```


## ObjC Integration:

###### Import  TouchPoint SDK  `@import TouchPointKit;` & add following code snippet on `didFinishLaunchingWithOptions`

```
NSString *apiKey = API_KEY;
NSString *apiSecret = API_SECRET;
TouchPointPods pod = TouchPointPodsDev2; //Environment e.g. dev1, dev2, na1, na2 etc.
NSArray *screens = [[NSArray alloc] initWithObjects:@"Demo 1", @"Demo 2", @"Animals", nil];
NSDictionary *visitorDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"id",@"179",@"email",@"dinesh_demogmailcom", nil];

[[TouchPointActivity shared] configureWithApiKey: apiKey apiSecret: apiSecret podName: pod screenNames: screens visitor: visitorDict];

// Note: Following are optional properties for developer convenience
// For testing you can set this property to false so that API will not filter data based on visitor id and uuid
[TouchPointActivity shared].shouldApplyAPIFilter = false;

// To disable wkwebview caching, set it to true
[TouchPointActivity shared].disableCaching = true;

// To change banner height, you can set this property
[TouchPointActivity shared].defaultBannerHeight = 50;

// To enable debug logs, set this property to true
[TouchPointActivity shared].enableDebugLogs = true;

// If status bar style is dark, set this property to false
[TouchPointActivity shared].isStatusBarStyleLight = false;

```

###### In `ViewController`, Import  TouchPoint SDK  `@import TouchPointKit;` & set the screen name using following code snippet:

```
[[TouchPointActivity shared] setScreenNameWithScreenName:SCREEN_NAME];
```

###### This will lookup for any banner for current screen ( SCREEN_NAME) and display the banner automatically. If you want to open TouchPoint activity directly, you can directly call the following method:

```
[[TouchPointActivity shared] openActivityWithScreenName: SCREEN_NAME delegate: self];
```

###### `TouchPointActivityCompletionDelegate` is required if you want the callback when the TouchPointActivity completed. Otherwise you can pass `nil` in delegate. Following is the `TouchPointActivityCompletionDelegate` delegate method.

```
- (void)didActivityCompleted {
    // Calls when TouchPoint activity is completed.
}
```

###### Before calling `openActivityWithScreenName` function, you can check if TouchPoint activity need to be shown or not using following method: 

```
if ([[TouchPointActivity shared] shouldShowActivityWithScreenName: SCREEN_NAME]) {
    // Call openActivityWithScreenName function of TouchPointActivity
}
```

## React Native Integration

###### Integrate `TouchPointKit` through cocoapods. Inside React-Native project, Go to `ios` folder, update `Podfile` as follows:
```
// Under project target add following line:
pod 'TouchPointKit', :git => 'https://github.com/vcilabs/touchpoint-kit-ios.git', :tag => '0.0.5'
```

###### Open terminal and cd to `YOUR_RN_PROJECT/ios/` and run `pod install` . `TouchPointKit` will be added to your ios project.

###### In `AppDelegate.m` file Import  TouchPoint SDK by adding  `@import TouchPointKit;` line at top of file & add following code snippet on `AppDelegate.m`'s  `didFinishLaunchingWithOptions` function

```
NSString *apiKey = API_KEY;
NSString *apiSecret = API_SECRET;
TouchPointPods pod = TouchPointPodsDev2; //Environment e.g. dev1, dev2, na1, na2 etc.
NSArray *screens = [[NSArray alloc] initWithObjects:@"Demo 1", @"Demo 2", nil];
NSDictionary *visitorDict = [[NSDictionary alloc] initWithObjectsAndKeys:@"id",@"179",@"email",@"dinesh_demogmailcom", nil];

[[TouchPointActivity shared] configureWithApiKey: apiKey apiSecret: apiSecret podName: pod screenNames: screens visitor: visitorDict];

//NOTE: visitorDict is optional. You can also set it later by calling `NativeModules.TouchPointKitBridge.setVisitor(VISITOR)` from .js file

// Note: Following are optional properties for developer convenience
// For testing you can set this property to false so that API will not filter data based on visitor id and uuid
[TouchPointActivity shared].shouldApplyAPIFilter = false;

// To disable wkwebview caching, set it to true
[TouchPointActivity shared].disableCaching = true;

// To change banner height, you can set this property
[TouchPointActivity shared].defaultBannerHeight = 50;

// To enable debug logs, set this property to true
[TouchPointActivity shared].enableDebugLogs = true;

// If status bar style is dark, set this property to false
[TouchPointActivity shared].isStatusBarStyleLight = false;

```

###### NOTE: Use Above step to configure SDK through AppDelegate file only if you are not calling this from .js file.

###### Create TouchPointKitBridge.h, TouchPointKitBridge.m file inside ios project. Add following code to these files:

```
//  TouchPointKitBridge.h
#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
@import TouchPointKit;

NS_ASSUME_NONNULL_BEGIN

@interface TouchPointKitBridge : RCTEventEmitter <RCTBridgeModule, TouchPointActivityCompletionDelegate>

@end

NS_ASSUME_NONNULL_END
```

```
//  TouchPointKitBridge.m
#import "TouchPointKitBridge.h"

@implementation TouchPointKitBridge
{
  bool hasListeners;
}

// Will be called when this module's first listener is added.
-(void)startObserving {
    hasListeners = YES;
}

// Will be called when this module's last listener is removed, or on dealloc.
-(void)stopObserving {
    hasListeners = NO;
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(configure:(NSString *)apiKey apiSecret:(NSString *)apiSecret pod:(int)pod screens:(NSArray *)screens visitor:(NSDictionary *)visitor )
{
  [[TouchPointActivity shared] configureWithApiKey: apiKey apiSecret: apiSecret podName: pod screenNames: screens visitor: visitor];
}

RCT_EXPORT_METHOD(setVisitor:(NSDictionary *)visitor)
{
  [TouchPointActivity shared].visitor = visitor;
}

RCT_EXPORT_METHOD(enableDebugLogs:(BOOL)enable)
{
  [TouchPointActivity shared].enableDebugLogs = enable;
}

RCT_EXPORT_METHOD(disableAllLogs:(BOOL)disable)
{
  [TouchPointActivity shared].disableAllLogs = disable;
}

RCT_EXPORT_METHOD(shouldApplyAPIFilter:(BOOL)apiFilter)
{
  [TouchPointActivity shared].shouldApplyAPIFilter = apiFilter;
}

RCT_EXPORT_METHOD(disableCaching:(BOOL)caching)
{
  [TouchPointActivity shared].disableCaching = caching;
}

RCT_EXPORT_METHOD(setScreen:(NSString *)name banner:(BOOL)banner)
{
  [[TouchPointActivity shared] setScreenNameWithScreenName:name banner:banner];
}

RCT_EXPORT_METHOD(openActivity:(NSString *)name)
{
  if ([[TouchPointActivity shared] shouldShowActivityWithScreenName: name]) {
    //dispatch_sync(dispatch_get_main_queue(),^(void){
        [[TouchPointActivity shared] openActivityWithScreenName: name delegate: self];
    //});
  }
}

RCT_EXPORT_METHOD(clearCache)
{
  NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
  NSDictionary * dict = [userDefaults dictionaryRepresentation];
  for (id key in dict) {
      [userDefaults removeObjectForKey:key];
  }
  [userDefaults synchronize];
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

- (void) didActivityCompleted {
  if (hasListeners) {
    [self sendEventWithName:@"didActivityCompletedEvent" body:@"ActivityCompleted"];
  }
}

- (NSArray<NSString *> *)supportedEvents {
  return @[@"didActivityCompletedEvent"];
}

@end


```

###### From your App.js call `TouchPointKitBridge` methods using `NativeModules`.

````
import {
  NativeModules,
  NativeEventEmitter,
} from 'react-native';

// Register for event listening from SDK (activity complete event)
const { TouchPointKitBridge } = NativeModules;
const eventEmitter = new NativeEventEmitter(TouchPointKitBridge);
const subscription = eventEmitter.addListener('didActivityCompletedEvent', didActivityCompletedEvent);

const didActivityCompletedEvent = (event) => {
   console.log(event);
}


// SDK Configuration
NativeModules.TouchPointKitBridge.clearCache(); // For testing. It will clear 'Activity Seen' status
NativeModules.TouchPointKitBridge.configure(API_KEY, API_SECRET, POD_NAME, SCREEN_NAMES, VISITOR);
NativeModules.TouchPointKitBridge.enableDebugLogs(true); // Optional, default is false
NativeModules.TouchPointKitBridge.shouldApplyAPIFilter(false); // Optional, default is true

// NOTE: POD_NAME value is integer. na1=0, na2=1, eu1=2, eu2=3, ap2=4, dev1=5, dev2=6, sit1=7, pub=8
// API_KEY, API_SECRET are String values
// SCREEN_NAMES is an array. e.g. ['Demo 1', 'Demo 2']
// VISITOR is json, e.g. { id: 'VISITOR_ID', email: 'VISITOR_EMAIL' }


// To show default banner styling
NativeModules.TouchPointKitBridge.setScreen(
  'SCREEN_NAME',
  true
);

// To use custom component
NativeModules.TouchPointKitBridge.setScreen(
  'SCREEN_NAME',
  false
);


// Call this method on your custom component click event
openActivity = () => {
    NativeModules.TouchPointKitBridge.openActivity('SCREEN_NAME');
}

````

Copyright © 2020 Vision Critical Communications Inc. All rights reserved.
# touchpointkit-sample-ios
