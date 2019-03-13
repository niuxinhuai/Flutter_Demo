#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
    NSLog(@"Hello World!");
  // Override point for customization after application launch.
    NSLog(@"%@",NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, true).firstObject);
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
