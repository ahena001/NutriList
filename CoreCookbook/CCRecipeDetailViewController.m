//
//  RecipeDetailViewController.m
//  CoreCookbook
//
//  Created by Alex Henao on 12/10/15.
//  Copyright (c) 2015 HenServer. All rights reserved.
//

#import "CCRecipeDetailViewController.h"


//#import "Recipe.h"

@interface CCRecipeDetailViewController ()
-(IBAction)save:(id)sender;


@end


@implementation CCRecipeDetailViewController



#pragma mark - IBAction

-(void)save:(id)sender
{
    
    //Todo
}


//@synthesize  recipeNameLabel, recipePicture, instructionsLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // sharedData = [Singleton sharedData];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //   recipeNameLabel.text = sharedData.currentRecipe.name;
    //recipeNameLabel.text = @"A recipe Name goes here"; // TODO
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of entries in the shared addressbook .
    //    return [myAddressBook.myAddressBook count];
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ingredientsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = ([[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]);
    }
    
    //and makes a cell out of it
    cell.textLabel.text = @"XXX";
    
    return cell;
}



- (IBAction)addToShoppingListButton:(id)sender {
}

@end
