//
//  Singleton.h
//  
//
//  Created by Leonardo Martin on 12/9/15.
//
//

#import <Foundation/Foundation.h>

@class Cookbook, Recipe;

@interface Singleton : NSObject

@property BOOL inCookbook;

@property NSMutableDictionary *globalRecipes;
@property NSMutableArray *userCookbooks;
@property NSArray *recipeNames;
@property Recipe *currentRecipe;
@property Cookbook *currentCookbook;
@property NSMutableArray *shoppingList;

+(Singleton *) sharedData;

@end
