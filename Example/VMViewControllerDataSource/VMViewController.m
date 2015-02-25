//
//  VMViewController.m
//  VMViewControllerDataSource
//
//  Created by Valerio Mazzeo on 02/25/2015.
//  Copyright (c) 2014 Valerio Mazzeo. All rights reserved.
//

#import "VMViewController.h"
#import "VMTableExampleViewController.h"
#import "VMCollectionExampleViewController.h"

@interface VMViewController ()

@end

@implementation VMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"VMViewController";
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewControllerDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"TableView Demo";
            break;
        case 1:
            cell.textLabel.text = @"CollectionView Demo";
            break;
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *viewController = nil;
    
    switch (indexPath.row) {
        case 0:
            viewController = [[VMTableExampleViewController alloc] initWithStyle:UITableViewStylePlain];
            break;
        case 1:
            viewController = [[VMCollectionExampleViewController alloc] initWithCollectionViewLayout:[UICollectionViewFlowLayout new]];
            break;
    }
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
