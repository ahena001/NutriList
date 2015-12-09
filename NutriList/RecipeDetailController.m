//
//  RecipeDetailController.m
//  
//
//  Created by Leonardo Martin on 11/26/15.
//
//

#import "RecipeDetailController.h"
#import "Recipe.h"

@implementation RecipeDetailController

@synthesize sharedData, recipeNameLabel, recipePicture, instructionsLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    sharedData = [Singleton sharedData];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    recipeNameLabel.text = sharedData.currentRecipe.name;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of entries in the shared addressbook .
    //    return [myAddressBook.myAddressBook count];
    return [sharedData.currentRecipe.ingredients count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ingredientsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = ([[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]);
    }
    
    //and makes a cell out of it
    cell.textLabel.text = [sharedData.currentRecipe.ingredients objectAtIndex:indexPath.row];
    
    return cell;
}



- (IBAction)addToShoppingListButton:(id)sender {
}
@end
