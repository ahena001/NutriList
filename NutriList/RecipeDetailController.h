//
//  RecipeDetailController.h
//  
//
//  Created by Leonardo Martin on 11/26/15.
//
//

#import <UIKit/UIKit.h>
#import "Singleton.h"
@interface RecipeDetailController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *recipeNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *recipePicture;
@property (weak, nonatomic) IBOutlet UILabel *instructionsLabel;

@property Singleton *sharedData;

- (IBAction)addToShoppingListButton:(id)sender;

@end
