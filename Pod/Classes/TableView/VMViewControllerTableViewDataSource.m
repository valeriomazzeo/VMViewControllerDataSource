//
//  VMViewControllerTableViewDataSource.m
//  Pods
//
//  Created by Valerio Mazzeo on 27/10/2014.
//  Copyright (c) 2014 Valerio Mazzeo. All rights reserved.
//

#import "VMViewControllerTableViewDataSource.h"
#import "VMViewControllerTableViewDataSourceCell.h"
#import <objc/runtime.h>

@implementation VMViewControllerTableViewDataSource

#pragma mark - Initialization

- (id)initWithParentController:(UIViewController *)parentViewController
{
    return [self initWithParentController:parentViewController delegate:nil];
}

- (id)initWithParentController:(UIViewController *)parentViewController delegate:(id<VMViewControllerTableViewDataSource>)delegate
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
    description = protocol_getMethodDescription(@protocol(VMViewControllerTableViewDataSource), selector, NO, YES);
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

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberOfRows = 0;
    
    if ([self.delegate respondsToSelector:@selector(tableView:numberOfRowsInSection:)]) {
        numberOfRows = [self.delegate tableView:tableView numberOfRowsInSection:section];
    }
    
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class viewControllerClass;
    
    if ([self.delegate respondsToSelector:@selector(viewControllerTableViewDataSource:classForViewControllerAtIndexPath:)]) {
        viewControllerClass = [self.delegate viewControllerTableViewDataSource:self classForViewControllerAtIndexPath:indexPath];
    } else {
        viewControllerClass = [self viewControllerTableViewDataSource:self classForViewControllerAtIndexPath:indexPath];
    }
    
    NSAssert([viewControllerClass conformsToProtocol:@protocol(VMViewControllerDataSourceObject)], @"The viewControllerClass must conform to the VMViewControllerDataSourceObject protocol.");
    
    NSString *reusableCellIdentifier = NSStringFromClass(viewControllerClass);
    
    VMViewControllerTableViewDataSourceCell *cell = [tableView dequeueReusableCellWithIdentifier:reusableCellIdentifier];
    
    if (!cell) {
        
        if (self.parentViewController) {
            cell = [[VMViewControllerTableViewDataSourceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusableCellIdentifier];
            
            [cell.viewController willMoveToParentViewController:self.parentViewController];
            [self.parentViewController addChildViewController:cell.viewController];
            cell.viewController.view.frame = cell.contentView.bounds;
            [cell.contentView addSubview:cell.viewController.view];
            [cell.viewController didMoveToParentViewController:self.parentViewController];
        }
    }
    
    if ([self.delegate respondsToSelector:@selector(viewControllerTableViewDataSource:viewController:forRowAtIndexPath:)]) {
        [self.delegate viewControllerTableViewDataSource:self viewController:cell.viewController forRowAtIndexPath:indexPath];
    }
    
    return cell;
}

#pragma mark - VMViewControllerTableViewDataSource

- (Class)viewControllerTableViewDataSource:(VMViewControllerTableViewDataSource *)viewControllerTableViewDataSource classForViewControllerAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
