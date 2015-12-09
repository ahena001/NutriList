//
//  SecondViewController.m
//  NutriList
//
//  Created by Leonardo Martin on 11/24/15.
//  Copyright (c) 2015 Leonardo Martin. All rights reserved.
//

#import "CookbookListController.h"

@interface CookbookListController ()

@end

@implementation CookbookListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    static NSString *CellIdentifier = @"cookbook";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = ([[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]);
    }
    
    //and makes a cell out of it
    cell.textLabel.text = @"lol";
    
    return cell;
}


@end
