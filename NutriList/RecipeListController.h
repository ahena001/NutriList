//
//  FirstViewController.h
//  NutriList
//
//  Created by Leonardo Martin on 11/24/15.
//  Copyright (c) 2015 Leonardo Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Singleton.h"

@interface RecipeListController : UITableViewController <UINavigationControllerDelegate>

@property NSMutableDictionary *recipes;
@property NSMutableArray *chickenPieIngredients;
@property NSArray *recipeNames;

@property Singleton *sharedData;

@end

