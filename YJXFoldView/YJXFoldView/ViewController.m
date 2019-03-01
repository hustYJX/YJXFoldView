//
//  ViewController.m
//  YJXFoldView
//
//  Created by 尤建峡 on 2019/3/1.
//  Copyright © 2019 尤建峡. All rights reserved.
//

#import "ViewController.h"
#import "YJXFoldView.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupFoldView];
}

#pragma mark - 设置setupFoldView

- (void)setupFoldView {
    NSArray *titles = @[@"测试1", @"测试2", @"测试3", @"测试4", @"测试5", @"测试6", @"测试7", @"测试8"];
    UIImage *image = [UIImage imageNamed:@"Celtics"];
    NSArray *images = @[image, image, image, image, image, image, image, image];
    YJXFoldView *foldView = [[YJXFoldView alloc] initWithFrame:CGRectMake(100, 100, 150, 40)];
    [foldView configurationWithTitles:titles images:images];
//    foldView.backgroundColor = UIColor.blueColor;
    [self.view addSubview:foldView];
}


@end
