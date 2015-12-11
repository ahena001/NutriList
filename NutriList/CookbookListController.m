//
//  SecondViewController.m
//  NutriList
//
//  Created by Leonardo Martin on 11/24/15.
//  Copyright (c) 2015 Leonardo Martin. All rights reserved.
//

#import "CookbookListController.h"
#import "Cookbook.h"

@interface CookbookListController ()

@end

@implementation CookbookListController

@synthesize sharedData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    sharedData = [Singleton sharedData];
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
    sharedData.inCookbook = true;
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [sharedData.userCookbooks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cookbook";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = ([[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]);
    }
    
    Cookbook *cb = [sharedData.userCookbooks objectAtIndex:indexPath.row];
    //and makes a cell out of it
    cell.textLabel.text = @"leo";
    
    return cell;
}

//if you select a row
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    sharedData.currentCookbook = [sharedData.userCookbooks objectAtIndex:indexPath.row];
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

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    
    if (editing) {
        // Add the + button
        UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAction:)];
        self.navigationItem.leftBarButtonItem = addBtn;
    } else {
        // remove the + button
        self.navigationItem.leftBarButtonItem = nil;
    }
}

-(IBAction)addBarButton:(id)sender{

}


@end
