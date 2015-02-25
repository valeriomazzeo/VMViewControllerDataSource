//
//  VMViewControllerCollectionViewDataSourceCell.h
//  Pods
//
//  Created by Valerio Mazzeo on 27/10/2014.
//  Copyright (c) 2014 Valerio Mazzeo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VMViewControllerDataSourceObject.h"

@interface VMViewControllerCollectionViewDataSourceCell : UICollectionViewCell

@property (nonatomic, strong, readonly) UIViewController<VMViewControllerDataSourceObject> *viewController;

@end
