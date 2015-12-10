//
//  CCCookbook.h
//  CoreCookbook
//
//  Created by Alex Henao on 12/10/15.
//  Copyright (c) 2015 HenServer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CCRecipe;

@interface CCCookbook : NSManagedObject

@property (nonatomic, retain) NSString * cookbookName;
@property (nonatomic, retain) NSData * recipeNames;
@property (nonatomic, retain) NSSet *recipes;
@end

@interface CCCookbook (CoreDataGeneratedAccessors)

- (void)addRecipesObject:(CCRecipe *)value;
- (void)removeRecipesObject:(CCRecipe *)value;
- (void)addRecipes:(NSSet *)values;
- (void)removeRecipes:(NSSet *)values;

@end
