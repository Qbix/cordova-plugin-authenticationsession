#import <Availability.h>
#import "AuthenticationSession.h"

#import <SafariServices/SFAuthenticationSession.h>
#import <AuthenticationServices/ASWebAuthenticationSession.h>

#import <Cordova/CDVAvailability.h>

id _authenticationVC;

@implementation AuthenticationSession

- (void)start:(CDVInvokedUrlCommand*)command {
  NSString* redirectScheme = [command.arguments objectAtIndex:0];
    NSURL* requestURL = [NSURL URLWithString:[command.arguments objectAtIndex:1]];

  if (@available(iOS 12.0, *)) {
        ASWebAuthenticationSession* authenticationVC =
        [[ASWebAuthenticationSession alloc] initWithURL:requestURL
                                   callbackURLScheme:redirectScheme
                                   completionHandler:^(NSURL * _Nullable callbackURL,
                                                       NSError * _Nullable error) {
                                       _authenticationVC = nil;
                                       CDVPluginResult *result;
                                       if (callbackURL) {
                                           result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: callbackURL.absoluteString];

                                       } else {
                                           result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"error"];
                                       }
                                       [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
                                   }];
        _authenticationVC = authenticationVC;
        [authenticationVC start];
  } else if (@available(iOS 11.0, *)) {
        SFAuthenticationSession* authenticationVC =
        [[SFAuthenticationSession alloc] initWithURL:requestURL
                                   callbackURLScheme:redirectScheme
                                   completionHandler:^(NSURL * _Nullable callbackURL,
                                                       NSError * _Nullable error) {
                                       _authenticationVC = nil;
                                       CDVPluginResult *result;
                                       if (callbackURL) {
                                           result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: callbackURL.absoluteString];

                                       } else {
                                           result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"error"];
                                       }
                                       [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
                                   }];
        _authenticationVC = authenticationVC;
        [authenticationVC start];
    } else {
      [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"This plugin supported iOS 11+"] callbackId:command.callbackId];
    }
}

@end
