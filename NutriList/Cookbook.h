//
//  Cookbook.h
//  
//
//  Created by Leonardo Martin on 12/10/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Recipe;

@interface Cookbook : NSManagedObject

@property (nonatomic, retain) NSString * cookbook_name;
@property (nonatomic, retain) NSData * cookbook_recipes;
@property (nonatomic, retain) NSSet *recipes;
@end

@interface Cookbook (CoreDataGeneratedAccessors)

- (void)addRecipesObject:(Recipe *)value;
- (void)removeRecipesObject:(Recipe *)value;
- (void)addRecipes:(NSSet *)values;
- (void)removeRecipes:(NSSet *)values;

@end
