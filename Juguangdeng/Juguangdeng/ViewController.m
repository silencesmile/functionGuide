//
//  ViewController.m
//  Juguangdeng
//
//  Created by youngstar on 16/3/3.
//  Copyright © 2016年 杨铭星. All rights reserved.
//

#import "ViewController.h"
#import "RAYNewFunctionGuideVC.h"

#define WINSIZE [UIScreen mainScreen].bounds.size
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
/*
 如果都添加了却不能运行，可能原因是原来的字体中添加了字体（ “娃娃体”：在RAYNewFunctionGuideVC.m 文件的第168行）
 如果你没有添加就会运行失败，具体添加方法已放入截图中
 */
    
    
}
// 只会出现一次
- (void)viewDidAppear:(BOOL)animated {
    // Show coach marks
    BOOL coachMarksShown = [[NSUserDefaults standardUserDefaults] boolForKey:@"isFirstShown"];
    if (coachMarksShown == NO) {
        // Don't show again
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isFirstShown"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        // Show coach marks
        [self makeGuideView];
        
        // Or show coach marks after a second delay  间隔n秒后再出现
        // [coachMarksView performSelector:@selector(start) withObject:nil afterDelay:1.0f];
    }
}



// 重复出现
//- (void)viewDidAppear:(BOOL)animated{
//    [self makeFunctionGuide];
//}

//- (void)makeFunctionGuide{
//    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//    NSString *firstComeInTeacherDetail = @"isFirstEnterHere";
//    [user setBool:NO forKey:firstComeInTeacherDetail];
//    
//    if (![user boolForKey:firstComeInTeacherDetail]) {
//        [user setBool:YES forKey:firstComeInTeacherDetail];
//        [user synchronize];
//        [self makeGuideView];
//    }
//    
//}

- (void)makeGuideView{
    RAYNewFunctionGuideVC *vc = [[RAYNewFunctionGuideVC alloc]init];
    vc.titles = @[@"新增: 功能1，",@"新增: 功能2，",@"新增: 功能3，",@"新增: 功能4，",@"新增: 功能5，",];
    vc.frames = @[@"{{0,  60},{100,80}}",
                  @"{{200,60},{100,80}}",
                  @"{{0,  360},{100,80}}",
                  @"{{200,360},{100,80}}",
                  @"{{100,210},{100,80}}",
                  ];
    
    [self presentViewController:vc animated:YES completion:nil];
    
}


@end
