//
//  ViewController.m
//  WWLJLabel
//
//  Created by iShareme on 15/8/20.
//  Copyright (c) 2015年 iShareme. All rights reserved.
//

#import "ViewController.h"
#import "WWLJLabel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WWLJLabel *label = [[WWLJLabel alloc] initWithFrame:CGRectMake(100, 200, 200, 40)];
    label.text = @"可实现复制功能的label";
    label.textColor = [UIColor blueColor];
    [self.view addSubview:label];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
