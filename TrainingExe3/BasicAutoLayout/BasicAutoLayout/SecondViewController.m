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
    
    [self addViewConstraint];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addViewConstraint {
    UIView *parent= self.view;
    
    _grayView.translatesAutoresizingMaskIntoConstraints = NO;
    _blueView.translatesAutoresizingMaskIntoConstraints = NO;
    _textLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _redView.translatesAutoresizingMaskIntoConstraints = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //grayView constraint
    NSLayoutConstraint *grayLeft =[NSLayoutConstraint
                               constraintWithItem:_grayView
                               attribute:NSLayoutAttributeLeftMargin
                               relatedBy:NSLayoutRelationEqual
                               toItem:parent
                               attribute:NSLayoutAttributeLeftMargin
                               multiplier:1.0f
                               constant:8];

    NSLayoutConstraint *grayRight = [NSLayoutConstraint
                                 constraintWithItem:_grayView
                                 attribute:NSLayoutAttributeRightMargin
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:parent
                                 attribute:NSLayoutAttributeRightMargin
                                 multiplier:1.0f
                                 constant:-8];
    
    NSLayoutConstraint *grayTop =[NSLayoutConstraint
                              constraintWithItem:_grayView
                              attribute:NSLayoutAttributeTopMargin
                              relatedBy:NSLayoutRelationEqual
                              toItem:parent
                              attribute:NSLayoutAttributeTopMargin
                              multiplier:1.0f
                              constant:22];
    
    NSLayoutConstraint *grayHeight = [NSLayoutConstraint
                                  constraintWithItem:_grayView
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                  toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute
                                  multiplier:0
                                  constant:129];
    
    //blueView constraint
    NSLayoutConstraint *blueRight = [NSLayoutConstraint
                                     constraintWithItem:_blueView
                                     attribute:NSLayoutAttributeRightMargin
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:parent
                                     attribute:NSLayoutAttributeRightMargin
                                     multiplier:1.0f
                                     constant:-8];
    
    NSLayoutConstraint *blueTop =[NSLayoutConstraint
                                  constraintWithItem:_blueView
                                  attribute:NSLayoutAttributeTopMargin
                                  relatedBy:NSLayoutRelationEqual
                                  toItem:parent
                                  attribute:NSLayoutAttributeTopMargin
                                  multiplier:1.0f
                                  constant:160];
    
    NSLayoutConstraint *blueWidth = [NSLayoutConstraint
                                      constraintWithItem:_blueView
                                      attribute:NSLayoutAttributeWidth
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:nil
                                      attribute:NSLayoutAttributeNotAnAttribute
                                      multiplier:0
                                      constant:73];
    
    NSLayoutConstraint *blueHeight = [NSLayoutConstraint
                                      constraintWithItem:_blueView
                                      attribute:NSLayoutAttributeHeight
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:nil
                                      attribute:NSLayoutAttributeNotAnAttribute
                                      multiplier:0
                                      constant:67];
    
    //textLabel constraint
    NSLayoutConstraint *textRight = [NSLayoutConstraint
                                     constraintWithItem:_textLabel
                                     attribute:NSLayoutAttributeRightMargin
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:parent
                                     attribute:NSLayoutAttributeRightMargin
                                     multiplier:1.0f
                                     constant:-100];
    
    NSLayoutConstraint *textTop =[NSLayoutConstraint
                                  constraintWithItem:_textLabel
                                  attribute:NSLayoutAttributeTopMargin
                                  relatedBy:NSLayoutRelationEqual
                                  toItem:parent
                                  attribute:NSLayoutAttributeTopMargin
                                  multiplier:1.0f
                                  constant:160];
    
    NSLayoutConstraint *textLeft = [NSLayoutConstraint
                                     constraintWithItem:_textLabel
                                     attribute:NSLayoutAttributeLeftMargin
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:parent
                                     attribute:NSLayoutAttributeLeftMargin
                                     multiplier:1.0f
                                     constant:8];
    
    NSLayoutConstraint *textHeight = [NSLayoutConstraint
                                      constraintWithItem:_textLabel
                                      attribute:NSLayoutAttributeHeight
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:nil
                                      attribute:NSLayoutAttributeNotAnAttribute
                                      multiplier:0
                                      constant:67];
    
    //redView constraint
    NSLayoutConstraint *redBottom = [NSLayoutConstraint
                                     constraintWithItem:_redView
                                     attribute:NSLayoutAttributeBottomMargin
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:parent
                                     attribute:NSLayoutAttributeBottomMargin
                                     multiplier:1.0f
                                     constant:-15];
    
    NSLayoutConstraint *redRight =[NSLayoutConstraint
                                  constraintWithItem:_redView
                                  attribute:NSLayoutAttributeCenterX
                                  relatedBy:NSLayoutRelationEqual
                                  toItem:parent
                                  attribute:NSLayoutAttributeCenterX
                                  multiplier:1.0f
                                  constant:0];
    
    NSLayoutConstraint *redWidth = [NSLayoutConstraint
                                     constraintWithItem:_redView
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                     multiplier:0
                                     constant:71];
    
    NSLayoutConstraint *redHeight = [NSLayoutConstraint
                                      constraintWithItem:_redView
                                      attribute:NSLayoutAttributeHeight
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:nil
                                      attribute:NSLayoutAttributeNotAnAttribute
                                      multiplier:0
                                      constant:69];
    
    //Add constraints to the Parent
    [parent addConstraint:grayLeft];
    [parent addConstraint:grayTop];
    [parent addConstraint:grayRight];
    
    [parent addConstraint:blueTop];
    [parent addConstraint:blueRight];
    
    [parent addConstraint:textRight];
    [parent addConstraint:textTop];
    [parent addConstraint:textLeft];
    
    [parent addConstraint:redBottom];
    [parent addConstraint:redRight];
    
    //Add height constraint to the subview, as subview owns it.
    [_grayView addConstraint:grayHeight];
    
    [_blueView addConstraint:blueWidth];
    [_blueView addConstraint:blueHeight];
    
    [_textLabel addConstraint:textHeight];
    
    [_redView addConstraint:redWidth];
    [_redView addConstraint:redHeight];
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
