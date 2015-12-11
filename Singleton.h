//
//  Singleton.h
//  
//
//  Created by Leonardo Martin on 12/9/15.
//
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@class Cookbook, Recipe;

@interface Singleton : NSObject

@property BOOL inCookbook;

@property NSArray *globalRecipes;
@property NSMutableArray *userCookbooks;
@property NSMutableArray *recipeNames;
@property Recipe *currentRecipe;
@property Cookbook *currentCookbook;
@property NSMutableArray *shoppingList;

@property (nonatomic, readonly) NSManagedObjectContext *managedObjectContext;

+(Singleton *) sharedData;

@end
