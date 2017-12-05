//
//  WJNavigationController.m
//  WJZTERegard
//
//  Created by apple03 on 17/3/15.
//  Copyright © 2017年 apple03. All rights reserved.
//

#import "WJNavigationController.h"
#import "UIBarButtonItem+Extension.h"

@interface WJNavigationController ()<UINavigationControllerDelegate>

@end

@implementation WJNavigationController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    self.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationBar.translucent = NO;
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:KMGlobalBlackColor};
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 43.5f, [UIScreen mainScreen].bounds.size.width, 0.5f)];
    line.backgroundColor = KMGlobalLineColor;
    [self.navigationBar addSubview:line];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        [self setLeftBackImageNormal:viewController];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)setLeftBackImageNormal:(UIViewController *)viewController {
    UIBarButtonItem *iteam = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"back_b" highImage:@"back_b_s"];
    viewController.navigationItem.leftBarButtonItem = iteam;
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

@end
