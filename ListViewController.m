//
//  ListViewController.m
//  BirdGenius3
//
//  Created by Lea Ingold on 11/20/15.
//  Copyright © 2015 Pencilskirt Studio. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()



@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSegueWithIdentifier:@"showLogin" sender:self];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}


@end
