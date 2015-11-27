//
//  RecipeDetailController.m
//  
//
//  Created by Leonardo Martin on 11/26/15.
//
//

#import "RecipeDetailController.h"

@implementation RecipeDetailController

@synthesize ingredients, recipeNameLabel, recipePicture, instructionsLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ingredients = [NSArray arrayWithObjects:@"Tomatoes", @"Cheese", @"Bread", @"caca",@"caca",@"Tomatoes", @"Cheese", @"Bread", @"caca",@"caca",@"Tomatoes", @"Cheese", @"Bread", @"caca",@"caca",@"Tomatoes", @"Cheese", @"Bread", @"caca",@"caca",@"Tomatoes", @"Cheese", @"Bread", @"caca",@"caca",@"Tomatoes", @"Cheese", @"Bread", @"caca",@"caca",@"Tomatoes", @"Cheese", @"Bread", @"caca",@"caca",@"Tomatoes", @"Cheese", @"Bread", @"caca",@"caca",nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    recipeNameLabel.text = @"Turkey Bonanza";
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of entries in the shared addressbook .
    //    return [myAddressBook.myAddressBook count];
    return [ingredients count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ingredientsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = ([[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]);
    }
    
    //and makes a cell out of it
    cell.textLabel.text = [ingredients objectAtIndex:indexPath.row];
    
    return cell;
}



- (IBAction)addToShoppingListButton:(id)sender {
}
@end
