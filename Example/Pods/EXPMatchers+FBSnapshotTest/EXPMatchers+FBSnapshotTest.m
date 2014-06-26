//
//  EXPMatchers+FBSnapshotTest.h
//  Artsy
//
//  Created by Daniel Doubrovkine on 1/14/14.
//  Copyright (c) 2014 Artsy Inc. All rights reserved.
//

#import "EXPMatchers+FBSnapshotTest.h"
#import "EXPMatcherHelpers.h"
#import "FBSnapshotTestController.h"


@interface EXPExpectFBSnapshotTest()
@property (nonatomic, strong) NSString *referenceImagesDirectory;
@end

@implementation EXPExpectFBSnapshotTest

+ (id)instance
{
    static EXPExpectFBSnapshotTest *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


+ (BOOL)compareSnapshotOfViewOrLayer:(id)viewOrLayer snapshot:(NSString *)snapshot testCase:(id)testCase record:(BOOL)record referenceDirectory:(NSString *)referenceDirectory error:(NSError **)error
  
{
    FBSnapshotTestController *snapshotController = [[FBSnapshotTestController alloc] initWithTestClass:[testCase class]];
    snapshotController.recordMode = record;
    snapshotController.referenceImagesDirectory = referenceDirectory;
    
    if (! snapshotController.referenceImagesDirectory) {
        [NSException raise:@"Missing value for referenceImagesDirectory" format:@"Call [[EXPExpectFBSnapshotTest instance] setReferenceImagesDirectory"];
    }

    return [snapshotController compareSnapshotOfViewOrLayer:viewOrLayer
                                                   selector:NSSelectorFromString(snapshot)
                                                 identifier:nil
                                                      error:error];
}

+ (NSString *)combinedError:(NSString *)message test:(NSString *)test error:(NSError *)error
{
    NSAssert(message, @"missing message");
    NSAssert(test, @"missing test name");

    NSMutableArray *ary = [NSMutableArray array];

    [ary addObject:[NSString stringWithFormat:@"%@ %@", message, test]];

    for(NSString *key in error.userInfo.keyEnumerator) {
        [ary addObject:[NSString stringWithFormat:@" %@: %@", key, [error.userInfo valueForKey:key]]];
    }
    
    return [ary componentsJoinedByString:@"\n"];
}

@end

void setGlobalReferenceImageDir(char *reference) {
    NSString *referenceImagesDirectory = [NSString stringWithFormat:@"%s", reference];
    [[EXPExpectFBSnapshotTest instance] setReferenceImagesDirectory:referenceImagesDirectory];
};

@interface EXPExpect(ReferenceDirExtension)
- (NSString *)_getDefaultReferenceDirectory;
@end

@implementation EXPExpect(ReferenceDirExtension)

- (NSString *)_getDefaultReferenceDirectory
{
    NSString *globalReference = [[EXPExpectFBSnapshotTest instance] referenceImagesDirectory];
    if (globalReference) {
        return globalReference;
    }
    
    // Search the test file's path to find the first folder with the substring "tests"
    // then append "/ReferenceImages" and use that
    
    NSString *testFileName = [NSString stringWithCString:self.fileName encoding:NSUTF8StringEncoding];
    NSArray *pathComponents = [testFileName pathComponents];
    
    for (NSString *folder in pathComponents) {
        if ([folder.lowercaseString rangeOfString:@"tests"].location != NSNotFound) {
            
            NSArray *folderPathComponents = [pathComponents subarrayWithRange:NSMakeRange(0, [pathComponents indexOfObject:folder] + 1)];
            return [NSString stringWithFormat:@"%@/ReferenceImages", [folderPathComponents componentsJoinedByString:@"/"]];
            
        }
    }
    
    [NSException raise:@"Could not infer reference image folder" format:@"You should provide a reference dir using setGlobalReferenceImageDir(FB_REFERENCE_IMAGE_DIR);"];
    return nil;
}
@end



// If you're bringing in Speca via CocoaPods
// use the test path to get the test's image file URL

#ifdef COCOAPODS_POD_AVAILABLE_Specta
#import "Specta.h"
#import "SpectaUtility.h"
#import "SPTExample.h"

NSString *sanitizedTestPath();

NSString *sanitizedTestPath(){
    SPTXCTestCase *test = [[NSThread currentThread] threadDictionary][SPTCurrentTestCaseKey];
    
    SPTExample *compiledExample = [test spt_getCurrentExample];
    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_"];
    NSString *currentTestName = [[compiledExample.name componentsSeparatedByCharactersInSet:[charSet invertedSet]] componentsJoinedByString:@"_"];
    
    return [NSString stringWithFormat:@"%@", currentTestName];
}

EXPMatcherImplementationBegin(haveValidSnapshot, (void)){
    __block NSError *error = nil;

    match(^BOOL{
        NSString *referenceImageDir = [self _getDefaultReferenceDirectory];
        NSString *name = sanitizedTestPath();
        return [EXPExpectFBSnapshotTest compareSnapshotOfViewOrLayer:actual snapshot:name testCase:[self testCase] record:NO referenceDirectory:referenceImageDir error:&error];
    });
    
    failureMessageForTo(^NSString *{
        return [EXPExpectFBSnapshotTest combinedError:@"expected a matching snapshot in" test:sanitizedTestPath() error:error];
    });
    
    failureMessageForNotTo(^NSString *{
        return [EXPExpectFBSnapshotTest combinedError:@"expected to not have a matching snapshot in" test:sanitizedTestPath() error:error];
    });
}
EXPMatcherImplementationEnd

EXPMatcherImplementationBegin(recordSnapshot, (void)) {
    __block NSError *error = nil;

    match(^BOOL{
        NSString *referenceImageDir = [self _getDefaultReferenceDirectory];
        [EXPExpectFBSnapshotTest compareSnapshotOfViewOrLayer:actual snapshot:sanitizedTestPath() testCase:[self testCase] record:YES referenceDirectory:referenceImageDir error:&error];
        return NO;
    });
    
    failureMessageForTo(^NSString *{
        if (error) {
            return [EXPExpectFBSnapshotTest combinedError:@"expected to record a snapshot in" test:sanitizedTestPath() error:error];
        } else {
            return [NSString stringWithFormat:@"snapshot %@ successfully recorded, replace recordSnapshot with a check", sanitizedTestPath()];
        }
    });
    
    failureMessageForNotTo(^NSString *{
        if (error) {
            return [EXPExpectFBSnapshotTest combinedError:@"expected to record a snapshot in" test:sanitizedTestPath() error:error];
        } else {
            return [NSString stringWithFormat:@"snapshot %@ successfully recorded, replace recordSnapshot with a check", sanitizedTestPath()];
        }
    });
}
EXPMatcherImplementationEnd

#else

// If you don't have Speca stub the functions

EXPMatcherImplementationBegin(haveValidSnapshot, (void)){
  
    prerequisite(^BOOL{
        return NO;
    });
    
    failureMessageForTo(^NSString *{
        return @"you need Specta installed via CocoaPods to use haveValidSnapshot, use haveValidSnapshotNamed instead";
    });
    
    failureMessageForNotTo(^NSString *{
        return @"you need Specta installed via CocoaPods to use haveValidSnapshot, use haveValidSnapshotNamed instead";
    });
}
EXPMatcherImplementationEnd


EXPMatcherImplementationBegin(recordSnapshot, (void)) {
    __block NSError *error = nil;
    
    prerequisite(^BOOL{
        return NO;
    });
    
    failureMessageForTo(^NSString *{
        return @"you need Specta installed via CocoaPods to use recordSnapshot, use recordSnapshotNamed instead";
    });
    
    failureMessageForNotTo(^NSString *{
        return @"you need Specta installed via CocoaPods to use recordSnapshot, use recordSnapshotNamed instead";
    });
}
EXPMatcherImplementationEnd


#endif



EXPMatcherImplementationBegin(haveValidSnapshotNamed, (NSString *snapshot)){
    BOOL snapshotIsNil = (snapshot == nil);
    __block NSError *error = nil;
    
    prerequisite(^BOOL{
        return !(snapshotIsNil);
    });
    
    match(^BOOL{
        NSString *referenceImageDir = [self _getDefaultReferenceDirectory];
        return [EXPExpectFBSnapshotTest compareSnapshotOfViewOrLayer:actual snapshot:snapshot testCase:[self testCase] record:NO referenceDirectory:referenceImageDir error:&error];
    });
    
    failureMessageForTo(^NSString *{
        return [EXPExpectFBSnapshotTest combinedError:@"expected a matching snapshot named" test:snapshot error:error];

    });
    
    failureMessageForNotTo(^NSString *{
        return [EXPExpectFBSnapshotTest combinedError:@"expected not to have a matching snapshot named" test:snapshot error:error];
    });
}
EXPMatcherImplementationEnd

EXPMatcherImplementationBegin(recordSnapshotNamed, (NSString *snapshot)) {
    BOOL snapshotIsNil = (snapshot == nil);
    __block NSError *error = nil;
    
    prerequisite(^BOOL{
        return !(snapshotIsNil);
    });
    
    match(^BOOL{
        NSString *referenceImageDir = [self _getDefaultReferenceDirectory];
        [EXPExpectFBSnapshotTest compareSnapshotOfViewOrLayer:actual snapshot:snapshot testCase:[self testCase] record:YES referenceDirectory:referenceImageDir error:&error];
        return NO;
    });
    
    failureMessageForTo(^NSString *{
        if (error) {
            return [EXPExpectFBSnapshotTest combinedError:@"expected to record a matching snapshot named" test:snapshot error:error];
        } else {
            return [NSString stringWithFormat:@"snapshot %@ successfully recorded, replace recordSnapshot with a check", snapshot];
        }
    });
    
    failureMessageForNotTo(^NSString *{
        if (error) {
            return [EXPExpectFBSnapshotTest combinedError:@"expected to record a matching snapshot named" test:snapshot error:error];
        } else {
            return [NSString stringWithFormat:@"snapshot %@ successfully recorded, replace recordSnapshot with a check", snapshot];
        }
    });
}
EXPMatcherImplementationEnd
