//
//  Cookbook.m
//  
//
//  Created by Leonardo Martin on 12/9/15.
//
//

#import "Cookbook.h"

@implementation Cookbook

@synthesize name, recipeNames;

- (instancetype)initWithName: (NSString *)name_
{
    self = [super init];
    if (self) {
        name = name_;
    }
    return self;
}


@end
