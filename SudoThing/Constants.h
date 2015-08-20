#import <Foundation/Foundation.h>

@interface Constants : NSObject

extern NSString *const kParseApplicationId;
extern NSString *const kParseClientKey;
extern NSString *const kParseRESTAPIKey;
extern NSString *const kParseMasterKey;

#pragma mark - Storyboard IDS
extern NSString *const kLoneWolfSTIDLoginNavKey;

#pragma mark - Segues
extern NSString *const kSegueLoginKey;
extern NSString *const kSegueSignupKey;
extern NSString *const kSegueProfileKey;
extern NSString *const kSegueProfileWikiKey;

#pragma mark - Parse Thing Class Keys

extern NSString *const kParseThingClassKey;
extern NSString *const kParseThingNameKey;
extern NSString *const kParseThingDescriptionKey;
extern NSString *const kParseThingInventoryIDKey;
extern NSString *const kParseThingInInventorySystemKey;
extern NSString *const kParseThingWikiLinkKey;
extern NSString *const kParseThingCommentsKey;

@end

typedef NS_ENUM(NSInteger, ParseFetchError)  {
    ParseFetchErrorUserNotLoggedInError,
    ParseFetchErrorNoDataError,
    ParseFetchErrorNetworkCallFailedError,
    ParseFetchErrorBadParameter
};