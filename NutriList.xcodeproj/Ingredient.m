//
//  Ingredient.m
//  
//
//  Created by Leonardo Martin on 12/9/15.
//
//

#import "Ingredient.h"

@implementation Ingredient

@synthesize name, quantity, measure;

- (instancetype)initWith: (NSString *)name_: (int) quantity_: (NSString *)measure_;
{
    self = [super init];
    if (self) {
        name = name_;
        measure = measure_;
        quantity = quantity_;
    }
    return self;
}

@end
