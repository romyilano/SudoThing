//
//  BACEManager.h
//  ParseStarterProject
//
//  Created by Romy on 6/15/15.
//
//

#import <Foundation/Foundation.h>

extern NSString *SudoCareManagerErrorDomain;

@interface SudoCareManager : NSObject

+ (instancetype)sharedManager;

#pragma mark - Parse API Methods

- (void)fetchObjectsWithClassNameInBackground:(NSString *)className
                           andCompletionBlock:(void(^)(NSArray *objectsArray, BOOL success, NSError *error))completionBlock;

- (void)fetchAllSudoRoomThings:(void(^)(NSArray *thingsArray, BOOL success, NSError *error))completionBlock;

- (void)fetchAllUsers:(void(^)(NSArray *peopleArray, BOOL success, NSError *error))completionBlock;

@end
