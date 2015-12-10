//
//  CookbooksViewController.m
//  CoreCookbook
//
//  Created by Alex Henao on 12/10/15.
//  Copyright (c) 2015 HenServer. All rights reserved.
//

#import "CCCookbooksViewController.h"
#import "CCCookbook.h"
#import "AppDelegate.h"

@interface CCCookbooksViewController ()
//@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSArray *lists;
@property NSArray *cookbooksInCC;
@property(nonatomic,retain) IBOutlet UITableViewCell *cookbookCell;

@property (nonatomic, readonly) NSManagedObjectContext *managedObjectContext; // helper
-(IBAction)addCookBook:(id)sender;
//-(void)retryCookbookName:(UIAlertView *)alertView;


@end

@implementation CCCookbooksViewController

@synthesize lists  = _lists; // holds what is to be presented
@synthesize cookbooksInCC;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"ViewDidLoad, in fact");
    
    NSFetchRequest * fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"CCCookbook"];
    fetchRequest.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"cookbookName" ascending:YES]];
    
    self.lists = [[NSMutableArray alloc] init];
    NSError *error = nil;
    self.cookbooksInCC = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
 
   // MapViewController * mapvc = [self.tabBarController.viewControllers objectAtIndex:0];
    
    for(int i =0; i<cookbooksInCC.count; i++){
        CCCookbook * cookbook = [cookbooksInCC objectAtIndex:i];
        NSString * cookbookName = cookbook.cookbookName;
        NSLog(@"COOKBOOK at %i, is of name:%@", i,cookbookName);
        [self.tableView reloadData];
        
        
        for(int i = 0; i < [self.lists count]; i++)
            NSLog(@"Name of CCCookbook in self.lists %@",[[self.lists objectAtIndex:i] name]);
        
        
    }
}

//
//    // TODO: Load the lists
//    // ask the managedObjectContext to retrieve all of the stored cookbooks with a fetchrequest
//    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"CCCookbook"]; // query in object form..gets all the cookbooks
//    fetchRequest.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"cookbookName" ascending:YES]];
//    
//    NSError *error = nil;
//    self.lists =[self.managedObjectContext executeFetchRequest:fetchRequest error:&error]; // make the global equal the results of the fetch request
//    NSLog(@"DEVXX: Size of lists in viewDidLoad %lu", self.lists.count);
//    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSManagedObjectContext *)managedObjectContext
{
    return [(AppDelegate*) [[UIApplication sharedApplication]delegate]managedObjectContext];
}


#pragma mark - IBAction
-(void)addCookBook:(id)sender
{
    //when add Cookbook is clicked then popup an aler asking for a cookbookname
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Cookbook Name" message:@"Name your new Cookbook" delegate:self cancelButtonTitle:@"Create" otherButtonTitles:nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
    
}


#pragma mark - AlertView input
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *alertViewInputText =[ [alertView textFieldAtIndex:0]text];
   
    if([alertViewInputText length] < 2 )
    {
        NSLog(@"EMPTY INPUT REACHED");
        alertViewInputText = [NSString stringWithFormat:@"invalidNameSOMENUMBER"];
        
//        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Cookbook Name" message:@"Cookbook name must be minimum 3 characters" delegate:self cancelButtonTitle:@"Create" otherButtonTitles:nil];
//        alert.alertViewStyle = UIAlertViewStylePlainTextInput;
//        [alert show];

    }
    
    NSLog(@"Entered: %@", alertViewInputText);

    
    CCCookbook *newCookbook= [NSEntityDescription insertNewObjectForEntityForName:@"CCCookbook" inManagedObjectContext:self.managedObjectContext]; // new CCCookbook object created and hooked up to managedObjectContext

//     set properties
    newCookbook.cookbookName = alertViewInputText;
//        newCookbook.cookbookName = @"staticCookbook"; // TODO
    [self.managedObjectContext save:nil]; // save entity to core data


    self.lists = [self.lists arrayByAddingObject:newCookbook];

    [self.tableView reloadData];
    
    
    
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    static NSString *CellIdentifier = @"CookbookCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    CCCookbook *currentCookbook = [self.lists objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    cell.textLabel.text = currentCookbook.cookbookName;
    
//    CCCookbook *currentCookbook = [self.lists objectAtIndex: self.tableView.indexPathForSelectedRow.row];
//    cell.textLabel.text = currentCookbook.cookbookName;
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
