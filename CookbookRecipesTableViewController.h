//
//  CookbookRecipesTableViewController.h
//  
//
//  Created by Leonardo Martin on 12/10/15.
//
//

#import <UIKit/UIKit.h>

@class Singleton;

@interface CookbookRecipesTableViewController : UITableViewController

@property Singleton *sharedData;

@end
