//
//  ViewController.m
//  Calculator
//
//  Created by Kirill Kirikov on 8/3/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"
#import <objc/runtime.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *result;
@property (assign) BOOL didUserStartTyping;
@property (strong) CalculatorBrain *model;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [[CalculatorBrain alloc] init];
    UIButton *sqrtButton = [[UIButton alloc] initWithFrame:CGRectMake(230, 160, 50, 50)];
    [sqrtButton setTitle:@"√" forState:UIControlStateNormal];
    [sqrtButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:sqrtButton];
    [sqrtButton addTarget:self action:@selector(touchOperator:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)touchDigit:(UIButton *)sender {
    
    if (!self.didUserStartTyping) {
        self.result.text = sender.currentTitle;
        self.didUserStartTyping = YES;
    } else {
        self.result.text = [self.result.text stringByAppendingString:sender.currentTitle];
    }
}

- (IBAction)touchOperator:(UIButton *)sender {
    NSString *operator = [sender currentTitle];
    float digit = self.result.text.floatValue;
    float result = [self.model executeOperation:[operator operation] withDigit:digit];
    self.result.text = [NSString stringWithFormat:@"%f", result];
    self.didUserStartTyping = NO;
}

- (IBAction)touchClearButton:(UIButton *)sender {
    [self.model cleanMemory];
    self.result.text = @"0";
    self.didUserStartTyping = NO;
}



@end
