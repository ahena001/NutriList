//
//  Recipe.m
//  
//
//  Created by Leonardo Martin on 12/9/15.
//
//

#import "Recipe.h"

@implementation Recipe

@synthesize name, ingredients, instructions, image;

- (instancetype)initWithName:(NSString *)name_ 
{
    self = [super init];
    if (self) {
        name = name_;
    }
    return self;
}

@end
