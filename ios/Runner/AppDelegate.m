#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
    NSArray *arr = @[@"CurrentVC", @"GeneratedPluginRegistrant"];
    NSMutableArray *mutableArr = (NSMutableArray *)arr;
    [mutableArr addObject:@"info"];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
