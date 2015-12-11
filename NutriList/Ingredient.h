//
//  Ingredient.h
//  
//
//  Created by Leonardo Martin on 12/10/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Recipe;

@interface Ingredient : NSManagedObject

@property (nonatomic, retain) NSString * ingredient_name;
@property (nonatomic, retain) NSString * ingredient_measure;
@property (nonatomic, retain) NSNumber * ingredient_qty;
@property (nonatomic, retain) Recipe *recipe;

@end
