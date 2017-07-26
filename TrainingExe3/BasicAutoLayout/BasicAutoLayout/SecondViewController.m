//
//  SecondViewController.m
//  BasicAutoLayout
//
//  Created by Timothy Lee on 10/24/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic, strong) UIView *grayView;
@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation SecondViewController

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.grayView = [[UIView alloc] initWithFrame:CGRectMake(10, 90, 300, 100)];
    self.grayView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.grayView];
    
    self.blueView = [[UIView alloc] initWithFrame:CGRectMake(230, CGRectGetMaxY(self.grayView.frame) + 20, 80, 80)];
    self.blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.blueView];
    
    self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.grayView.frame) + 20, 200, 80)];
    self.textLabel.text = @"I have some longer text here that I want to wrap onto multiple lines.";
    self.textLabel.numberOfLines = 0;
    [self.view addSubview:self.textLabel];
    
    self.redView = [[UIView alloc] initWithFrame:CGRectMake(125, 400, 70, 70)];
    self.redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Second";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateViewConstraints {
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-[grayView(>=200)]-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(self.grayView)]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:[grayView(==200)]-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(self.grayView)]];
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
