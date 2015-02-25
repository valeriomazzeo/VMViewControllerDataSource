//
//  VMViewControllerCollectionViewDataSource.m
//  Pods
//
//  Created by Valerio Mazzeo on 27/10/2014.
//  Copyright (c) 2014 Valerio Mazzeo. All rights reserved.
//

#import "VMViewControllerCollectionViewDataSource.h"
#import "VMViewControllerCollectionViewDataSourceCell.h"
#import <objc/runtime.h>

@implementation VMViewControllerCollectionViewDataSource

#pragma mark - Initialization

- (id)initWithParentController:(UIViewController *)parentViewController
{
    return [self initWithParentController:parentViewController delegate:nil];
}

- (id)initWithParentController:(UIViewController *)parentViewController delegate:(id<VMViewControllerCollectionViewDataSource>)delegate
{
    if (self = [super init]) {
        self.parentViewController = parentViewController;
        self.delegate = delegate;
    }
    return self;
}

#pragma mark - Forward Invocations

- (BOOL)shouldForwardSelector:(SEL)selector
{
    struct objc_method_description description;
    description = protocol_getMethodDescription(@protocol(VMViewControllerCollectionViewDataSource), selector, NO, YES);
    return (description.name != NULL && description.types != NULL);
}

- (BOOL)respondsToSelector:(SEL)selector
{
    if ([super respondsToSelector:selector]) {
        
        return YES;
        
    } else if ([self shouldForwardSelector:selector]) {
        
        if ([self.delegate respondsToSelector:selector]) {
            return YES;
        }
    }
    return NO;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
    NSMethodSignature *signature = [super methodSignatureForSelector:selector];
    if (signature == nil) {
        if ([self.delegate respondsToSelector:selector]) {
            signature = [(id)self.delegate methodSignatureForSelector:selector];
        }
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    BOOL didForward = NO;
    
    if ([self shouldForwardSelector:invocation.selector]) {
        if ([self.delegate respondsToSelector:invocation.selector]) {
            [invocation invokeWithTarget:self.delegate];
            didForward = YES;
        }
    }
    
    if (!didForward) {
        [super forwardInvocation:invocation];
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger numberOfItems = 0;
    
    if ([self.delegate respondsToSelector:@selector(collectionView:numberOfItemsInSection:)]) {
        numberOfItems = [self.delegate collectionView:collectionView numberOfItemsInSection:section];
    }
    
    return numberOfItems;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Class viewControllerClass;
    
    if ([self.delegate respondsToSelector:@selector(viewControllerCollectionViewDataSource:classForViewControllerAtIndexPath:)]) {
        viewControllerClass = [self.delegate viewControllerCollectionViewDataSource:self classForViewControllerAtIndexPath:indexPath];
    } else {
        viewControllerClass = [self viewControllerCollectionViewDataSource:self classForViewControllerAtIndexPath:indexPath];
    }
    
    NSAssert([viewControllerClass conformsToProtocol:@protocol(VMViewControllerDataSourceObject)], @"The viewControllerClass must conform to the VMViewControllerCollectionViewDataSourceObject protocol.");
    
    NSString *reusableCellIdentifier = NSStringFromClass(viewControllerClass);
    
    [collectionView registerClass:[VMViewControllerCollectionViewDataSourceCell class] forCellWithReuseIdentifier:reusableCellIdentifier];
    
    VMViewControllerCollectionViewDataSourceCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reusableCellIdentifier forIndexPath:indexPath];
    
    if (self.parentViewController) {

        [cell.viewController willMoveToParentViewController:self.parentViewController];
        [self.parentViewController addChildViewController:cell.viewController];
        cell.viewController.view.frame = cell.contentView.bounds;
        [cell.contentView addSubview:cell.viewController.view];
        [cell.viewController didMoveToParentViewController:self.parentViewController];
    }
    
    if ([self.delegate respondsToSelector:@selector(viewControllerCollectionViewDataSource:viewController:forItemAtIndexPath:)]) {
        [self.delegate viewControllerCollectionViewDataSource:self viewController:cell.viewController forItemAtIndexPath:indexPath];
    }
    
    return cell;
}

#pragma mark - VMViewControllerCollectionViewDataSource

- (Class)viewControllerCollectionViewDataSource:(VMViewControllerCollectionViewDataSource *)viewControllerCollectionViewDataSource classForViewControllerAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
