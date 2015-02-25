//
//  VMViewControllerCollectionViewDataSource.h
//  Pods
//
//  Created by Valerio Mazzeo on 27/10/2014.
//  Copyright (c) 2014 Valerio Mazzeo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VMViewControllerDataSourceObject.h"

@class VMViewControllerCollectionViewDataSource;

@protocol VMViewControllerCollectionViewDataSource <UICollectionViewDataSource>

@required

- (Class)viewControllerCollectionViewDataSource:(VMViewControllerCollectionViewDataSource *)viewControllerCollectionViewDataSource classForViewControllerAtIndexPath:(NSIndexPath *)indexPath;

@optional

- (void)viewControllerCollectionViewDataSource:(VMViewControllerCollectionViewDataSource *)viewControllerCollectionDataSource viewController:(UIViewController *)viewController forItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface VMViewControllerCollectionViewDataSource : NSObject <VMViewControllerCollectionViewDataSource>

@property (nonatomic, weak) UIViewController *parentViewController;
@property (nonatomic, weak) VMViewControllerCollectionViewDataSource *delegate;

- (id)initWithParentController:(UIViewController *)parentViewController;
- (id)initWithParentController:(UIViewController *)parentViewController delegate:(id<VMViewControllerCollectionViewDataSource>)delegate;

@end
