//
//  VMViewControllerTableViewDataSource.h
//  Pods
//
//  Created by Valerio Mazzeo on 27/10/2014.
//  Copyright (c) 2014 Valerio Mazzeo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VMViewControllerDataSourceObject.h"

@class VMViewControllerTableViewDataSource;

@protocol VMViewControllerTableViewDataSource <UITableViewDataSource>

@required

- (Class)viewControllerTableViewDataSource:(VMViewControllerTableViewDataSource *)viewControllerTableViewDataSource classForViewControllerAtIndexPath:(NSIndexPath *)indexPath;

@optional

- (void)viewControllerTableViewDataSource:(VMViewControllerTableViewDataSource *)viewControllerTableViewDataSource viewController:(UIViewController *)viewController forRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface VMViewControllerTableViewDataSource : NSObject <VMViewControllerTableViewDataSource>

@property (nonatomic, weak) UIViewController *parentViewController;
@property (nonatomic, weak) VMViewControllerTableViewDataSource *delegate;

- (id)initWithParentController:(UIViewController *)parentViewController;
- (id)initWithParentController:(UIViewController *)parentViewController delegate:(id<VMViewControllerTableViewDataSource>)delegate;

@end
