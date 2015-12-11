//
//  Recipe.h
//  
//
//  Created by Leonardo Martin on 12/10/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Cookbook, Ingredient;

@interface Recipe : NSManagedObject

@property (nonatomic, retain) NSString * recipe_name;
@property (nonatomic, retain) NSData * recipe_ingredients;
@property (nonatomic, retain) NSString * recipe_instructions;
@property (nonatomic, retain) Cookbook *cookbook;
@property (nonatomic, retain) NSSet *ingredients;
@end

@interface Recipe (CoreDataGeneratedAccessors)

- (void)addIngredientsObject:(Ingredient *)value;
- (void)removeIngredientsObject:(Ingredient *)value;
- (void)addIngredients:(NSSet *)values;
- (void)removeIngredients:(NSSet *)values;

@end
