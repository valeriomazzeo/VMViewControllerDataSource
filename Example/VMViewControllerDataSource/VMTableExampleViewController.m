//
//  VMTableExampleViewController.m
//  VMViewControllerDataSource
//
//  Created by Valerio Mazzeo on 25/02/2015.
//  Copyright (c) 2015 Valerio Mazzeo. All rights reserved.
//

#import "VMTableExampleViewController.h"
#import "VMColorViewController.h"
#import "VMViewControllerDataSource.h"

@interface VMTableExampleViewController () <VMViewControllerTableViewDataSource>

@property (nonatomic, strong) VMViewControllerTableViewDataSource *model;

@end

@implementation VMTableExampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"TableView Demo";
    
    self.model = [[VMViewControllerTableViewDataSource alloc] initWithParentController:self delegate:self];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.dataSource = self.model;
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 120;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[NSString alloc] initWithFormat:@"Section %ld", (long)section];
}

#pragma mark - VMViewControllerTableViewDataSource

- (Class)viewControllerTableViewDataSource:(VMViewControllerTableViewDataSource *)viewControllerTableViewDataSource
         classForViewControllerAtIndexPath:(NSIndexPath *)indexPath
{
    return [VMColorViewController class];
}

- (void)viewControllerTableViewDataSource:(VMViewControllerTableViewDataSource *)viewControllerTableViewDataSource
                           viewController:(VMColorViewController *)viewController
                        forRowAtIndexPath:(NSIndexPath *)indexPath
{
    viewController.titleLabel.text = [NSString stringWithFormat:@"Section: %ld | Row: %ld", (long)indexPath.section, (long)indexPath.row];
}

@end
