//
//  Recipe.h
//  
//
//  Created by Leonardo Martin on 12/9/15.
//
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject

@property NSString *name;
@property NSMutableArray *ingredients;
@property NSString *instructions;
@property id image;

- (instancetype)initWithName:(NSString *)name_;

@end
