//
//  MsgListController.m
//  alarm
//
//  Created by Dreamover Studio on 29/3/2018.
//  Copyright © 2018年 Dreamover Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MacroDefine.h"
#import "MsgListController.h"
#import "NewQuestionController.h"
#import "MyMsgController.h"
#import "MsgDetailController.h"

@interface MsgListController () <UITableViewDataSource, UITableViewDelegate>
@property UITableView *tableView;
@end

@implementation MsgListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.]
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"常見問題";
    
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    float marginTop = rectStatus.size.height + self.navigationController.navigationBar.frame.size.height;
    
    //    UIView *topButton = [[UIView alloc] initWithFrame:CGRectMake(0, marginTop, self.view.frame.size.width, 44)];
    //    topButton.backgroundColor = [UIColor orangeColor];
    //    UIButton *topButtonLeft = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, topButton.frame.size.width/2, topButton.frame.size.height)];
    //    [topButtonLeft setTitle:@"我要提問" forState:UIControlStateNormal];
    //    [topButtonLeft addTarget:self action:@selector(clickButtonLeft) forControlEvents:UIControlEventTouchUpInside];
    //    [topButton addSubview:topButtonLeft];
    //    //
    //    UIButton *topButtonRight = [[UIButton alloc] initWithFrame:CGRectMake(topButton.frame.size.width/2, 0, topButton.frame.size.width/2, topButton.frame.size.height)];
    //    [topButtonRight setTitle:@"我的訊息" forState:UIControlStateNormal];
    //    [topButtonRight addTarget:self action:@selector(clickButtonRight) forControlEvents:UIControlEventTouchUpInside];
    //    [topButton addSubview:topButtonRight];
    
    //    CALayer *topButtonBorder = [CALayer layer];
    //    topButtonBorder.frame = CGRectMake(0, 0, 1, topButtonRight.frame.size.height);
    //    topButtonBorder.backgroundColor = [UIColor whiteColor].CGColor;
    //    [topButtonRight.layer addSublayer:topButtonBorder];
    //    //
    //    [self.view addSubview:topButton];
    
    //    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, marginTop+topButton.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-marginTop-topButton.frame.size.height-self.tabBarController.tabBar.frame.size.height)];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-self.tabBarController.tabBar.frame.size.height)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = @"每天什麽時間鍛煉最合適？";
    cell.imageView.image = [UIImage imageNamed:@"feedback"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MsgDetailController *msgDetailController = [[MsgDetailController alloc] init];
    [self.navigationController pushViewController:msgDetailController animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//- (void)clickButtonLeft {
//    NewQuestionController *newQuestionController = [[NewQuestionController alloc] init];
//    [self.navigationController pushViewController:newQuestionController animated:YES];
//}
//
//- (void)clickButtonRight {
//    MyMsgController *myMsgController = [[MyMsgController alloc] init];
//    [self.navigationController pushViewController:myMsgController animated:YES];
//}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

@end