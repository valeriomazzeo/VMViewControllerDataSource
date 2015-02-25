//
//  VMViewControllerCollectionViewDataSourceCell.m
//  Pods
//
//  Created by Valerio Mazzeo on 27/10/2014.
//  Copyright (c) 2014 Valerio Mazzeo. All rights reserved.
//

#import "VMViewControllerCollectionViewDataSourceCell.h"

@interface VMViewControllerCollectionViewDataSourceCell()

@property (nonatomic, strong) UIViewController<VMViewControllerDataSourceObject> *viewController;

@end

@implementation VMViewControllerCollectionViewDataSourceCell

#pragma mark - Properties

- (UIViewController<VMViewControllerDataSourceObject> *)viewController
{
    if (!_viewController) {
        
        Class viewControllerClass = NSClassFromString(self.reuseIdentifier);
        
        _viewController = [viewControllerClass new];
    }
    
    return _viewController;
}

#pragma mark - View Lifecycle

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.viewController.view.frame = self.contentView.bounds;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    if ([self.viewController respondsToSelector:@selector(prepareForReuse)]) {
        [self.viewController prepareForReuse];
    }
}

#pragma mark - Finalization

- (void)dealloc
{
    [self.viewController willMoveToParentViewController:nil];
    [self.viewController.view removeFromSuperview];
    [self.viewController removeFromParentViewController];
}

@end
