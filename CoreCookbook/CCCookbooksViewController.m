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
@property (nonatomic,strong) NSString *currentName;

@property (nonatomic, readonly) NSManagedObjectContext *managedObjectContext; // helper
-(IBAction)addCookBook:(id)sender;
//-(void)retryCookbookName:(UIAlertView *)alertView;


@end

@implementation CCCookbooksViewController

@synthesize lists  = _lists; // holds what is to be presented
@synthesize cookbooksInCC = _cookbooksInCC; // new holder of presentation

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"ViewDidLoad, in fact");
    
    NSFetchRequest * fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"CCCookbook"];
    fetchRequest.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"cookbookName" ascending:YES]];
    
   // self.lists = [[NSMutableArray alloc] init];
    NSError *error = nil;
    self.cookbooksInCC = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
 
   // MapViewController * mapvc = [self.tabBarController.viewControllers objectAtIndex:0];
    
    for(int i =0; i< [self.cookbooksInCC count]; i++){
        CCCookbook * cookbook = [self.cookbooksInCC objectAtIndex:i];
        NSString * cookbookName = cookbook.cookbookName;
        NSLog(@"COOKBOOK at %i, is of name: %@", i,cookbookName);
    }
    
    
  //   [self.tableView reloadData];
}

3
//reload data every time the view re-appears
-(void) viewWillAppear:(BOOL)animated{
    //sharedData.inCookbook = true;
    NSLog(@"print: viewWIllAppear");
    [self.tableView reloadData];
}
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
        
    }
    
    NSLog(@"Entered: %@", alertViewInputText);
    self.currentName = alertViewInputText;
    [self saveInCoreData:self.currentName];

    
}

-(void)saveInCoreData:(NSString*)textFieldInput
{
    
    CCCookbook *newCookbook= [NSEntityDescription insertNewObjectForEntityForName:@"CCCookbook" inManagedObjectContext:self.managedObjectContext]; // new CCCookbook object created and hooked up to managedObjectContext
    
    //     set properties
    newCookbook.cookbookName = textFieldInput;
    
    self.cookbooksInCC = [self.cookbooksInCC arrayByAddingObject:newCookbook];
    
    [self.managedObjectContext save:nil]; // save entity to core data
    [self.tableView reloadData];
    NSLog(@"reloadedData");
    for(int i =0; i< [self.cookbooksInCC count]; i++){
        CCCookbook * cookbook = [self.cookbooksInCC objectAtIndex:i];
        NSString * cookbookName = cookbook.cookbookName;
        NSLog(@"COOKBOOK at %i, is of name: %@", i,cookbookName);
    }
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.cookbooksInCC count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *MyIdentifier = @"CookbookCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    if(cell ==nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyIdentifier"];
    }
    CCCookbook * currentCookbook = [self.cookbooksInCC objectAtIndex:indexPath.row];
    
    
    cell.textLabel.text = currentCookbook.cookbookName;
    
    return cell;
}




@end
