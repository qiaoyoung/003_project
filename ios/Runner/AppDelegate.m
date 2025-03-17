#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSArray *arr = @[@"CurrentVC", @"GeneratedPluginRegistrant"];
    NSMutableArray *mutableArr = (NSMutableArray *)arr;
    [mutableArr addObject:@"info"];

  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
