//
//  SosServeViewController.m
//  SOS
//
//  Created by user on 2017/12/2.
//  Copyright © 2017年 fangwei. All rights reserved.
//

#import "SosServeViewController.h"
#import "SosRegisterViewController.h"

#define D_MainScreenWidth                   [[UIScreen mainScreen] bounds].size.width
#define D_MainScreenHeight                  [[UIScreen mainScreen] bounds].size.height

@interface SosServeViewController ()

@property (nonatomic,strong) UIScrollView * scrollView;

@property (nonatomic,strong) UIImageView * banner;
@property (nonatomic,strong) UILabel * noPayLabel;//未购买
@property (nonatomic,strong) UILabel * numberLabel;//剩余保险天数
@property (nonatomic,strong) UIButton * payBtn; //pay保险

@property (nonatomic,strong) UIButton * changeInfoBtn; //修改救援信息
@property (nonatomic,strong) UIButton * telBtn; //电话救援
@property (nonatomic,strong) UIButton * noteBtn; //短信救援

@end

@implementation SosServeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"SOS救援服务";
    self.view.backgroundColor = KMGlobalBackground;

    [self createUI];
}

- (void)createUI{
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, D_MainScreenWidth, D_MainScreenHeight)];
//    self.scrollView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.scrollView];
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    //        imageView.image = [UIImage imageNamed:@"banner"];
    [self.scrollView addSubview:imageView];
    self.banner = imageView;
    self.banner.image = [UIImage imageNamed:@"banner"];
    self.banner.sd_layout
    .topSpaceToView(self.scrollView,0)
    .heightIs(150)
    .leftSpaceToView(self.scrollView, 0)
    .rightSpaceToView(self.scrollView, 0);
    
    //////////////////第一段内容////////////////////
    UIView * view1 = [[UIView alloc]initWithFrame:CGRectZero];
    view1.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:view1];
    view1.sd_layout
    .topSpaceToView(self.banner, 0)
    .heightIs(85)
    .leftSpaceToView(self.scrollView, 0)
    .rightSpaceToView(self.scrollView, 0);
    UILabel * label1 = [[UILabel alloc]initWithFrame:CGRectZero];
    label1.text = @"境外救援保险";
    label1.textColor = KMGlobalBlackColor;
    label1.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
    [view1 addSubview:label1];
    label1.sd_layout
    .topSpaceToView(view1, 18)
    .heightIs(20)
    .leftSpaceToView(view1, 15);
    [label1 setSingleLineAutoResizeWithMaxWidth:0];
    UILabel * noPayLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    noPayLabel.text = @"暂未购买";
    noPayLabel.textColor = D_RGB(128, 128, 128, 1);
    noPayLabel.font = [UIFont systemFontOfSize:15];
    noPayLabel.hidden = true;
    [view1 addSubview:noPayLabel];
    self.noPayLabel = noPayLabel;
    noPayLabel.sd_layout
    .topSpaceToView(label1, 8)
    .heightIs(20)
    .leftEqualToView(label1);
    [noPayLabel setSingleLineAutoResizeWithMaxWidth:0];
    UILabel * numberLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    numberLabel.text = @"剩余30天";
    numberLabel.textColor = D_RGB(255, 144, 0, 1);
    numberLabel.font = [UIFont systemFontOfSize:15];
    numberLabel.hidden = true;
    [view1 addSubview:numberLabel];
    self.numberLabel = numberLabel;
    numberLabel.sd_layout
    .topSpaceToView(label1, 8)
    .heightIs(20)
    .leftEqualToView(label1);
    [numberLabel setSingleLineAutoResizeWithMaxWidth:0];
    
    UIButton * payBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [payBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    payBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    payBtn.tintColor = [UIColor whiteColor];
    payBtn.backgroundColor = KMGlobalGiftSOSColor;
    payBtn.layer.cornerRadius = 20.f;
    [payBtn addTarget:self action:@selector(clickWithPayInsurance) forControlEvents:UIControlEventTouchUpInside];
    [view1 addSubview:payBtn];
    self.payBtn = payBtn;
    payBtn.sd_layout
    .centerYEqualToView(view1)
    .heightIs(40)
    .widthIs(180)
    .rightSpaceToView(view1, 15);
    
    /////////////第二段内容////////////////////
    UIView * view2 = [[UIView alloc]initWithFrame:CGRectZero];
    view2.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:view2];
    view2.sd_layout
    .topSpaceToView(view1, 10)
    .leftSpaceToView(self.scrollView, 0)
    .rightSpaceToView(self.scrollView, 0);
    UILabel * topLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    topLabel.text = @"两种救援方式";
    topLabel.textColor = KMGlobalBlackColor;
    topLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
    [view2 addSubview:topLabel];
    topLabel.sd_layout
    .topSpaceToView(view2, 18)
    .heightIs(20)
    .leftSpaceToView(view2, 15);
    [topLabel setSingleLineAutoResizeWithMaxWidth:0];
    UIButton * changeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [changeBtn setTitle:@"变更救援信息" forState:UIControlStateNormal];
    changeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    changeBtn.tintColor = D_RGB(0, 188, 210, 1);
    [changeBtn addTarget:self action:@selector(clickWithChangeInfo) forControlEvents:UIControlEventTouchUpInside];
    [changeBtn setImage:[UIImage imageNamed:@"ic_right_hs_arrow"] forState:UIControlStateNormal];
    [view2 addSubview:changeBtn];
    self.changeInfoBtn = changeBtn;
    changeBtn.sd_layout
    .topSpaceToView(view2, 18)
    .heightIs(20)
    .widthIs(120)
    .rightSpaceToView(view2, 15);
    changeBtn.imageView.sd_layout
    .centerYEqualToView(changeBtn)
    .rightSpaceToView(changeBtn,0)
    .widthIs(6)
    .heightIs(9);
    changeBtn.titleLabel.sd_layout
    .centerYEqualToView(changeBtn)
    .rightSpaceToView(changeBtn.imageView,7)
    .heightIs(20);
    
    ////////////两方式求救描述/////////////////
    UIImageView * imgView1 = [[UIImageView alloc]initWithFrame:CGRectZero];
    imgView1.image = [UIImage imageNamed:@"sos_choice_1"];
    [view2 addSubview:imgView1];
    imgView1.sd_layout
    .topSpaceToView(topLabel, 20)
    .heightIs(15)
    .widthIs(15)
    .leftEqualToView(topLabel);
    UILabel * imgLabel1 = [[UILabel alloc]initWithFrame:CGRectZero];
    imgLabel1.text = @"点击电话救援立即拨通所属地救援中心";
    imgLabel1.textColor = KMGlobalBlackColor;
    imgLabel1.font = [UIFont systemFontOfSize:14];
    [view2 addSubview:imgLabel1];
    imgLabel1.sd_layout
    .topEqualToView(imgView1)
    .leftSpaceToView(imgView1, 12)
    .heightIs(15);
    [imgLabel1 setSingleLineAutoResizeWithMaxWidth:D_MainScreenWidth - 42];
    UIImageView * imgView2 = [[UIImageView alloc]initWithFrame:CGRectZero];
    imgView2.image = [UIImage imageNamed:@"sos_choice_2"];
    [view2 addSubview:imgView2];
    imgView2.sd_layout
    .topSpaceToView(imgView1, 20)
    .heightIs(15)
    .widthIs(15)
    .leftEqualToView(topLabel);
    UILabel * imgLabel2 = [[UILabel alloc]initWithFrame:CGRectZero];
    imgLabel2.text = @"点击短信救援立即下发求救信息至紧急联系人";
    imgLabel2.textColor = KMGlobalBlackColor;
    imgLabel2.font = [UIFont systemFontOfSize:14];
    [view2 addSubview:imgLabel2];
    imgLabel2.sd_layout
    .topEqualToView(imgView2)
    .leftSpaceToView(imgView2, 12)
    .heightIs(15);
    [imgLabel2 setSingleLineAutoResizeWithMaxWidth:D_MainScreenWidth - 42];
    //救援按钮
    UIButton * telBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [telBtn setImage:[UIImage imageNamed:@"sos_help_call"] forState:UIControlStateNormal];
    telBtn.backgroundColor = [UIColor clearColor];
    telBtn.layer.masksToBounds = true;
    telBtn.layer.cornerRadius = 32.f;
    [telBtn addTarget:self action:@selector(clickWithTelSOS) forControlEvents:UIControlEventTouchUpInside];
    [view2 addSubview:telBtn];
    self.telBtn = telBtn;
    telBtn.sd_layout
    .topSpaceToView(imgLabel2, 23)
    .heightIs(64)
    .widthIs(64)
    .leftSpaceToView(view2, D_MainScreenWidth/4 - 32);
    UILabel * btnLabel1 = [[UILabel alloc]initWithFrame:CGRectZero];
    btnLabel1.text = @"电话救援";
    btnLabel1.textColor = KMGlobalBlackColor;
    btnLabel1.textAlignment = NSTextAlignmentCenter;
    btnLabel1.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    [view2 addSubview:btnLabel1];
    btnLabel1.sd_layout
    .topSpaceToView(telBtn, 12)
    .leftEqualToView(telBtn)
    .heightIs(20)
    .widthIs(64);
    [btnLabel1 setSingleLineAutoResizeWithMaxWidth:0];
    UIButton * noteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [noteBtn setImage:[UIImage imageNamed:@"sos_help_message"] forState:UIControlStateNormal];
    noteBtn.backgroundColor = [UIColor clearColor];
    noteBtn.layer.masksToBounds = true;
    noteBtn.layer.cornerRadius = 32.f;
    [noteBtn addTarget:self action:@selector(clickWithNoteSOS) forControlEvents:UIControlEventTouchUpInside];
    [view2 addSubview:noteBtn];
    self.noteBtn = noteBtn;
    noteBtn.sd_layout
    .topSpaceToView(imgLabel2, 23)
    .heightIs(64)
    .widthIs(64)
    .rightSpaceToView(view2, D_MainScreenWidth/4 - 32);
    UILabel * btnLabel2 = [[UILabel alloc]initWithFrame:CGRectZero];
    btnLabel2.text = @"短信救援";
    btnLabel2.textColor = KMGlobalBlackColor;
    btnLabel2.textAlignment = NSTextAlignmentCenter;
    btnLabel2.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    [view2 addSubview:btnLabel2];
    btnLabel2.sd_layout
    .topSpaceToView(noteBtn, 12)
    .leftEqualToView(noteBtn)
    .heightIs(20)
    .widthIs(64);
    [btnLabel2 setSingleLineAutoResizeWithMaxWidth:0];
    [view2 setupAutoHeightWithBottomView:btnLabel2 bottomMargin:23];
    
    UILabel * tips = [[UILabel alloc]initWithFrame:CGRectZero];
    tips.textAlignment = NSTextAlignmentCenter;
    tips.text = @"触发服务系统会采取相应救援，请谨慎操作";
    tips.textColor = D_RGB(255.f, 60.f, 48.f, 1.f);
    tips.font = [UIFont systemFontOfSize:12];
    [self.scrollView addSubview:tips];
    tips.sd_layout
    .topSpaceToView(view2, 20)
    .centerXEqualToView(self.view)
    .leftSpaceToView(self.scrollView, 0)
    .rightSpaceToView(self.scrollView, 0)
    .heightIs(20);
    
    self.scrollView.contentSize = CGSizeMake(300, 680);
    self.noPayLabel.hidden = false;
}
#pragma mark - Click Action

- (void)clickWithPayInsurance{ //购买保险

}

- (void)clickWithChangeInfo{ //变更救援信息
    SosRegisterViewController * vc = [[SosRegisterViewController alloc]initWithNibName:@"SosRegisterViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:true];
}

- (void)clickWithTelSOS{ //tel

    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel://00864008185050"]];
    
//    NSMutableString *tel=[[NSMutableString alloc]initWithFormat:@"tel:%@",@"00864008185050"];
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:tel preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
//
//    }];
//    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"呼叫" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:tel]];
//    }];
//    // Add the actions.
//    [alertController addAction:cancelAction];
//    [alertController addAction:otherAction];
//    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)clickWithNoteSOS{ //短信
    self.noPayLabel.hidden = false;
    self.numberLabel.hidden = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
