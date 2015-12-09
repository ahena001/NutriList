//
//  Ingredient.h
//  
//
//  Created by Leonardo Martin on 12/9/15.
//
//

#import <Foundation/Foundation.h>

@interface Ingredient : NSObject

@property NSString *name;
@property int quantity;
@property NSString *measure;

- (instancetype)initWith: (NSString *)name: (int) quantity: (NSString *)measure;

@end
