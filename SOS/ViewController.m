//
//  ViewController.m
//  SOS
//
//  Created by user on 2017/12/1.
//  Copyright © 2017年 fangwei. All rights reserved.
//

#import "ViewController.h"
#import "SosRegisterViewController.h"
#import "SosServeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor = KMGlobalBackground;
    self.title = @"Root";
//    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
}

- (IBAction)push:(id)sender {
    
    SosRegisterViewController * vc = [[SosRegisterViewController alloc]initWithNibName:@"SosRegisterViewController" bundle:nil];
//
    
    [self.navigationController pushViewController:vc animated:true];
}

- (IBAction)Serve:(id)sender {
    SosServeViewController * vc = [[SosServeViewController alloc]init];
    [self.navigationController pushViewController:vc animated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
