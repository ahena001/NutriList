//
//  FirstViewController.m
//  NutriList
//
//  Created by Leonardo Martin on 11/24/15.
//  Copyright (c) 2015 Leonardo Martin. All rights reserved.
//

#import "RecipeListController.h"

@interface RecipeListController ()

@end

@implementation RecipeListController

@synthesize recipes, chickenPieIngredients, recipeNames, sharedData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    sharedData = [Singleton sharedData];
    NSLog(@"%@",[sharedData.recipeNames description]);
    NSLog(@"%@",[sharedData.globalRecipes description]);
    PFObject *testObject = [PFObject objectWithClassName:@"Cookbook"];
    testObject[@"name"] = @"bar";
    [testObject saveInBackground];
    
    chickenPieIngredients = [[NSMutableArray alloc] init];
    [chickenPieIngredients addObject:@"Chicken"];
    [chickenPieIngredients addObject:@"1 lb"];
    [chickenPieIngredients addObject:@"Pie"];
    [chickenPieIngredients addObject:@"1 pic"];
    [chickenPieIngredients addObject:@"Bread"];
    [chickenPieIngredients addObject:@"1 loaf"];
    
    recipes = [[NSMutableDictionary alloc] init];
    [recipes setObject:chickenPieIngredients forKey:@"Chicken Pie"];
    [recipes setObject:chickenPieIngredients forKey:@"Pizza"];
    [recipes setObject:chickenPieIngredients forKey:@"Turkey Bonanza"];
    
    recipeNames = [recipes allKeys];
    
    //can only delete one row at a time
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
    //create edit button on the right
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    
}

//reload data every time the view re-appears
-(void) viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of entries in the shared addressbook .
//    return [myAddressBook.myAddressBook count];
    return [sharedData.recipeNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"recipes";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    

    //and makes a cell out of it
    cell.textLabel.text = [sharedData.recipeNames objectAtIndex:indexPath.row];
    
    return cell;
}

//if you select a row
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *curRName = [sharedData.recipeNames objectAtIndex:indexPath.row];
    sharedData.currentRecipe = [sharedData.globalRecipes objectForKey:curRName];
    
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //for deleting purposes
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        //actual deletion of row
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        
    }
}


@end
