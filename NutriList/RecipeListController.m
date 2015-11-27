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

@synthesize recipes, chickenPieIngredients, recipeNames;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
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
    return [recipeNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"recipes";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    

    //and makes a cell out of it
    cell.textLabel.text = [recipeNames objectAtIndex:indexPath.row];
    
    return cell;
}

//
////if you select a row
//-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
////    //set the shared address book's current contact to the selected contact
////    myAddressBook.currentContact = [myAddressBook.myAddressBook objectAtIndex:indexPath.row];
////    //same for the index
////    myAddressBook.currentIndex = indexPath.row;
//}
//
//// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}
//
//
//
//// Override to support editing the table view.
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    //for deleting purposes
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        // Delete the row from the data source
////        [myAddressBook.myAddressBook removeObjectAtIndex:indexPath.row];
//        //actual deletion of row
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//        
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        
//    }
//}
//

@end
