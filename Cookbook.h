//
//  Cookbook.h
//  
//
//  Created by Leonardo Martin on 12/9/15.
//
//

#import <Foundation/Foundation.h>

@interface Cookbook : NSObject

@property NSString *name;
@property NSMutableArray *recipeNames;

- (instancetype)initWithName: (NSString *)name_;

@end
