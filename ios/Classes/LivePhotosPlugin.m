#import "LivePhotosPlugin.h"
#if __has_include(<live_photos/live_photos-Swift.h>)
#import <live_photos/live_photos-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "live_photos-Swift.h"
#endif

@implementation LivePhotosPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLivePhotosPlugin registerWithRegistrar:registrar];
}
@end
