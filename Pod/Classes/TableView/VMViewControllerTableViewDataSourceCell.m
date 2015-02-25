//
//  VMViewControllerTableViewDataSourceCell.m
//  Pods
//
//  Created by Valerio Mazzeo on 27/10/2014.
//  Copyright (c) 2014 Valerio Mazzeo. All rights reserved.
//

#import "VMViewControllerTableViewDataSourceCell.h"

@interface VMViewControllerTableViewDataSourceCell()

@property (nonatomic, strong) UIViewController<VMViewControllerDataSourceObject> *viewController;

@end

@implementation VMViewControllerTableViewDataSourceCell

#pragma mark - Initialization

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        Class viewControllerClass = NSClassFromString(reuseIdentifier);

        self.viewController = [viewControllerClass new];        
    }
    return self;
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
