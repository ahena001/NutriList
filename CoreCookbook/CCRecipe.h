//
//  CCRecipe.h
//  CoreCookbook
//
//  Created by Alex Henao on 12/10/15.
//  Copyright (c) 2015 HenServer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CCCookbook;

@interface CCRecipe : NSManagedObject

@property (nonatomic, retain) NSString * recipeName; // recipe identifier
@property (nonatomic, retain) NSData * ingredients; // array of ingredients
@property (nonatomic, retain) NSString * instructions; // the instructions on making the recipee
@property (nonatomic, retain) NSDate * created; // date the recipe was created
@property (nonatomic, retain) NSData * image; // image data
@property (nonatomic, retain) CCCookbook *cookbook;

@end
