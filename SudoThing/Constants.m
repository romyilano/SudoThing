//
//  Constants.m
//  ParseStarterProject
//
//  Created by Romy on 6/5/15.
//
//

#import "Constants.h"
#import "SecretKeys.h"

@implementation Constants

NSString *const kParseApplicationId = kSecretParseApplicationId;
NSString *const kParseClientKey = kSecretParseClientKey;
NSString *const kParseRESTAPIKey = kSecretParseRESTAPIKey;
NSString *const kParseMasterKey = kSecretParseMasterKey;

#pragma mark - Storyboard IDS
NSString *const kLoneWolfSTIDLoginNavKey = @"LoneWolfLoginScene";

#pragma mark - Segues

NSString *const kSegueLoginKey = @"LoginSegue";
NSString *const kSegueSignupKey = @"SignupSegue";
NSString *const kSegueProfileKey = @"ProfileSegue";
NSString *const kSegueProfileWikiKey = @"ProfileWikiSegue";

#pragma mark - Parse Thing Class Keys

NSString *const kParseThingClassKey = @"Thing";
NSString *const kParseThingDescriptionKey = @"thingDescription";
NSString *const kParseThingNameKey = @"name";
NSString *const kParseThingInventoryIDKey = @"inventoryID";
NSString *const kParseThingInInventorySystemKey = @"inInventorySystem";
NSString *const kParseThingWikiLinkKey = @"wikiLink";
NSString *const kParseThingCommentsKey = @"comments";

@end
