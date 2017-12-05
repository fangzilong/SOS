//
//  SosRegisterViewController.m
//  SOS
//
//  Created by user on 2017/12/1.
//  Copyright © 2017年 fangwei. All rights reserved.
//

#import "SosRegisterViewController.h"
#import "SosTextField.h"
#import "FWRegularExpression.h"

#define D_MainScreenWidth                   [[UIScreen mainScreen] bounds].size.width
#define D_MainScreenHeight                  [[UIScreen mainScreen] bounds].size.height

@interface SosRegisterViewController ()<UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet SosTextField *nameTextField;
@property (weak, nonatomic) IBOutlet SosTextField *idTextField;
@property (weak, nonatomic) IBOutlet SosTextField *telTextField;
//联系人
@property (weak, nonatomic) IBOutlet SosTextField *c_nameTF;
@property (weak, nonatomic) IBOutlet SosTextField *c_telTF;

@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

@end

@implementation SosRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = KMGlobalBackground;
    
//    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    if (([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0)) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    self.title = @"激活救援服务";
    _submitBtn.layer.cornerRadius = 5.f;
    self.submitBtn.alpha = 0.5;
}

- (IBAction)submit:(id)sender {
    
}

#pragma mark - UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField == self.c_telTF || textField == self.c_nameTF) {
        CGRect textFieldFrame      = textField.frame;
        //当前输入框的Y
        CGFloat textField_Y        = textFieldFrame.origin.y + 230;
        //当前输入框的高度
        CGFloat textFieldHight     = textFieldFrame.size.height;
        //屏幕高度
        CGFloat screenHight        = D_MainScreenHeight - 44;
        //键盘高度
        CGFloat keyBordHight       = 216;
        //键盘tabbar高度
        CGFloat keyBordTabbarHight = 35;
        //计算输入框向上移动的偏移量
        int offset = textField_Y + textFieldHight - (screenHight - keyBordHight - keyBordTabbarHight);
        
        //根据键盘遮挡的高度开始移动动画
        [UIView animateWithDuration:0.3 animations:^{
            if (offset > 0) {
                
                float width = D_MainScreenWidth;
                float hight = D_MainScreenHeight;
                
                CGRect rect = CGRectMake(0, -offset, width, hight);
                self.view.frame = rect;
            }
        }];
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    [UIView animateWithDuration:0.2 animations:^{
        self.view.frame =CGRectMake(0, 64, D_MainScreenWidth, D_MainScreenHeight);
    }];
    [self textFeildHasText];
    
    if (textField == self.idTextField) {
        if (![FWRegularExpression checkUserID:textField.text]) {//检测身份证有效
//            NSLog(@"no");
            UIAlertController * ac = [UIAlertController alertControllerWithTitle:@"提示" message:@"无效身份证信息" preferredStyle:UIAlertControllerStyleAlert];
            [ac addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }]];
            [self presentViewController:ac animated:true completion:nil];
//            UIAlertView * a = [[UIAlertView alloc]initWithTitle:@"提示" message:@"无效身份证信息" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//            [a show];
        }
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return true;
}

-(void)fieldChange:(UITextField *)textField{
//    if (textField == self.phoneNumField) {
//        if (textField.text.length > 11) {
//            return;
//        }
//        self.phoneString = textField.text;
//    }else{
//        self.verifyString = textField.text;
//    }
    [self textFeildHasText];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField == self.nameTextField) {
        
    }
    if (textField == self.idTextField) {
        
    }
    if (textField == self.telTextField) {
        if (textField.text.length > 10) {
            return NO;
        }
    }
    if (textField == self.c_nameTF) {
        
    }
    if (textField == self.c_telTF) {
        if (textField.text.length > 10) {
            return NO;
        }
    }
    if ([string isEqualToString:@""]) {
        return YES;
    }
    
    return YES;
}

-(void)textFeildHasText{
    if (self.nameTextField.text.length > 0 && self.idTextField.text.length > 0 && self.telTextField.text.length > 0&& self.c_nameTF.text.length > 0&& self.c_telTF.text.length > 0) {
        self.submitBtn.alpha = 1.0;
    }else{
        self.submitBtn.alpha = 0.5;
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:true];
}


@end
