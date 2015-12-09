//
//  ShoppingListController.m
//  
//
//  Created by Leonardo Martin on 11/24/15.
//
//

#import "ShoppingListController.h"
#import "IngredientTableViewCell.h"

@implementation ShoppingListController


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of entries in the shared addressbook .
    //    return [myAddressBook.myAddressBook count];
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ingredient";
    IngredientTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = ([[IngredientTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]);
    }
    
    //and makes a cell out of it
    cell.nameLabel.text = @"Chicken";
    cell.measureLabel.text = @"lb";
    cell.valueLabel.text = @"1";
    
    return cell;
}


@end
