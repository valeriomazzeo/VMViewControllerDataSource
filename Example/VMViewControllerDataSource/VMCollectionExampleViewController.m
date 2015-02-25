//
//  VMCollectionExampleViewController.m
//  VMViewControllerDataSource
//
//  Created by Valerio Mazzeo on 25/02/2015.
//  Copyright (c) 2015 Valerio Mazzeo. All rights reserved.
//

#import "VMCollectionExampleViewController.h"
#import "VMColorViewController.h"
#import "VMViewControllerDataSource.h"

@interface VMCollectionExampleViewController () <VMViewControllerCollectionViewDataSource>

@property (nonatomic, strong) VMViewControllerCollectionViewDataSource *model;

@end

@implementation VMCollectionExampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *) self.collectionView.collectionViewLayout;
    layout.itemSize = CGSizeMake(320.0, 80.0);
    
    self.title = @"CollectionView Demo";
    
    self.model = [[VMViewControllerCollectionViewDataSource alloc] initWithParentController:self delegate:self];
    
    self.collectionView.dataSource = self.model;
    
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 120;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

#pragma mark - VMViewControllerCollectionViewDataSource

- (Class)viewControllerCollectionViewDataSource:(VMViewControllerCollectionViewDataSource *)viewControllerCollectionViewDataSource
              classForViewControllerAtIndexPath:(NSIndexPath *)indexPath
{
    return [VMColorViewController class];
}

- (void)viewControllerCollectionViewDataSource:(VMViewControllerCollectionViewDataSource *)viewControllerCollectionViewDataSource
                                viewController:(VMColorViewController *)viewController
                             forItemAtIndexPath:(NSIndexPath *)indexPath
{
    viewController.titleLabel.text = [NSString stringWithFormat:@"Section: %ld | Item: %ld", (long)indexPath.section, (long)indexPath.item];
}

@end
