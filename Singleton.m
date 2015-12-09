//
//  Singleton.m
//  
//
//  Created by Leonardo Martin on 12/9/15.
//
//

#import "Singleton.h"
#import "Recipe.h"
#import "Ingredient.h"
#import "Cookbook.h"

#define NUMBER_OF_RECIPES 10
#define NUMBER_OF_COOKBOOKS 5

@implementation Singleton

@synthesize globalRecipes, userCookbooks, recipeNames, currentRecipe, shoppingList, currentCookbook, inCookbook;

-(void) stub{
    
    /*
     for(int i = 0; i < [coreData.recipes count]; i++)
     {
        Recipe *newRecipe = [Recipe alloc]initWithName:coreData[i].recipe.name];
        recipe.ingredients = coreData.recipe.ingredients;
        recipe.instructions = coreData.recipe.instructions;
        .
        .
        .
        [globalRecipes addObject newRecipe];
     
     }
     */
    
    Recipe *r1 = [[Recipe alloc]initWithName:@"Chicken Pot Pie"];
    Ingredient *ing1 = [[Ingredient alloc] initWith:@"Chicken" :1 :@"lb"];
    Ingredient *ing2 = [[Ingredient alloc] initWith:@"Flour" :2 :@"scoops"];
    Ingredient *ing3 = [[Ingredient alloc] initWith:@"Pie" :1 :@"slice"];
    
    NSMutableArray *arr1 = [[NSMutableArray alloc] initWithObjects:ing1, ing2, ing3, nil];
    r1.ingredients = arr1;
    
    r1.instructions = @"1. Beat the chicken.\n2. Put it in the over at 500 degrees F.\n3. Roll it in flour.\n4. Stick in the pie.\5. Enjoy!";
    
    r1.image = nil;
    
//    for (int i = 0; i < NUMBER_OF_RECIPES; i++) {
        [globalRecipes setObject:r1 forKey:r1.name];
        Recipe *r = [globalRecipes objectForKey:r1.name];
        NSLog(@"%@", r.name);
//    }
    
    
    
    /*
     for(int i = 0; i < [coreData.cookbooks count]; i++)
     {
     
     }
     */
    
    Cookbook *cb = [[Cookbook alloc]initWithName:@"I love Chicken"];
    [cb.recipeNames addObject:@"Chicken Pot Pie"];
//    [cb.recipeNames addObject:@"Chicken Breast"];
//    [cb.recipeNames addObject:@"Grilled Chiecken"];
    
    for(int i = 0 ; i < NUMBER_OF_COOKBOOKS; i++){
        [userCookbooks addObject:cb];
    }
    
    recipeNames = [globalRecipes allKeys];
    
    
}

+(Singleton *) sharedData{
    //this is the shared address book
    static Singleton *single = nil;
    
    //if it has not been initialized, alloc for it and initialize it
    if(single == nil){
        single = [[self alloc] initPrivate];
    }
    
    return single;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[Singleton sharedSingleton]" userInfo:nil];

    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        globalRecipes = [[NSMutableDictionary alloc]init];
        userCookbooks = [[NSMutableArray alloc] init];
        shoppingList = [[NSMutableArray alloc] init];
        currentRecipe = [[Recipe alloc] initWithName:@""];
        currentCookbook = [[Cookbook alloc]initWithName:@""];
        [self stub];

    }
    return self;
}

@end
