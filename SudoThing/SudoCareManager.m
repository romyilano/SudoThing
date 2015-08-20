//
//  BACEManager.m
//  ParseStarterProject
//
//  Created by Romy on 6/15/15.
//
//

#import "SudoCareManager.h"
#import <Parse/Parse.h>
#import "Constants.h"

NSString *SudoCareManagerErrorDomain = @"SudoCareManagerErrorDomain";

@interface SudoCareManager()

@end

@implementation SudoCareManager

// singleton
+ (instancetype)sharedManager {
    static id _sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
    });
    return _sharedManager;
}

#pragma mark - Parse API Methods

- (void)fetchObjectsWithClassNameInBackground:(NSString *)className
                           andCompletionBlock:(void (^)(NSArray *, BOOL, NSError *))completionBlock {
    PFQuery *classQuery = [PFQuery queryWithClassName:className];
    [classQuery findObjectsInBackgroundWithBlock:^(NSArray * __nullable objects, NSError * __nullable error) {
        if (completionBlock) {
            if (!error) {
                completionBlock(objects, YES, nil);
            } else {
                completionBlock(@[], NO, error);
            }
        }
    }];
}

- (void)fetchAllUsers:(void (^)(NSArray *, BOOL, NSError *))completionBlock {
    
    PFQuery *userQuery = [PFUser query];
    [userQuery findObjectsInBackgroundWithBlock:^(NSArray * __nullable objects, NSError * __nullable error) {
        if (completionBlock) {
            if (!error) {
                 completionBlock(objects, YES, error);
            } else {
                 completionBlock(@[], NO, error);
            }
        }
    }];
}

- (void)fetchAllSudoRoomThings:(void(^)(NSArray *thingsArray, BOOL success, NSError *error))completionBlock {
    [self fetchObjectsWithClassNameInBackground:kParseThingClassKey
                                        andCompletionBlock:^(NSArray *objectsArray, BOOL success, NSError *error) {
                                            if (completionBlock) {
                                                if (success) {
                                                    completionBlock(objectsArray, success, nil);
                                                } else {
                                                    completionBlock(@[], NO, error);
                                                }
                                            }
                                        }];
}

@end
