//
//  ViewController.m
//  Calculator
//
//  Created by Kirill Kirikov on 8/3/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *result;
@property (assign, nonatomic) BOOL didUserStartTyping;
@property (strong, nonatomic) CalculatorBrain *model;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [[CalculatorBrain alloc] init];

    UIButton *sqrtButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 160, 50, 50)];
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
    if ([[sender currentTitle]  isEqual: @"√"]) {
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        NSNumber *digit = [formatter numberFromString:self.result.text];
        [self.model addDigit:[digit floatValue]];
        float result = [self.model executeOperation:[operator operation]];
        [self.model addDigit:result];
        self.result.text = [NSString stringWithFormat:@"%f", result];
        self.didUserStartTyping = NO;
    } else {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *digit = [formatter numberFromString:self.result.text];
    [self.model executeOperation:[operator operation] withDigit:[digit floatValue]];
    self.didUserStartTyping = NO;
    }
}

- (IBAction)touchReturn:(id)sender {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *digit = [formatter numberFromString:self.result.text];
    [self.model addDigit:[digit floatValue]];
    float result = [self.model executeOperation:[self.model returnOperator]];
    [self.model addDigit:result];
    self.result.text = [NSString stringWithFormat:@"%f", result];
    self.didUserStartTyping = NO;
}


@end
