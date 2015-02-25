//
//  VMViewControllerDataSourceObject.h
//  Pods
//
//  Created by Valerio Mazzeo on 27/10/2014.
//  Copyright (c) 2014 Valerio Mazzeo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VMViewControllerDataSourceObject <NSObject>

@optional

- (void)prepareForReuse;

@end
