//
//  VMColorViewController.m
//  VMViewControllerDataSource
//
//  Created by Valerio Mazzeo on 25/02/2015.
//  Copyright (c) 2015 Valerio Mazzeo. All rights reserved.
//

#import "VMColorViewController.h"
#import "VMViewControllerDataSource.h"

@interface VMColorViewController () <VMViewControllerDataSourceObject>

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation VMColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [super viewDidLoad];
    
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    self.view.backgroundColor = color;
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50.0f, 20.0f, 0.0f, 0.0f)];
    self.titleLabel.text = [NSString stringWithFormat:@"ViewController [%.2f,%.2f,%.2f]", hue, saturation, brightness];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.backgroundColor = [UIColor lightGrayColor];
    [self.titleLabel sizeToFit];
    
    [self.view addSubview:self.titleLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForReuse
{
    NSLog(@"prepareForReuse");
}

@end
