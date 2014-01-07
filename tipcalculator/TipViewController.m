//
//  TipViewController.m
//  tipcalculator
//
//  Created by Andy Rhee on 1/7/14.
//  Copyright (c) 2014 andyrhee. All rights reserved.
//

#import "AppDelegate.h"
#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (void)updateValues;
- (IBAction)onTap:(id)sender;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateValues];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Setting" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
    
    NSMutableString *myTipStr1, *myTipStr2, *myTipStr3;
    float myTip1, myTip2, myTip3;
    
    [myTipStr1 appendString: tip1];
    [myTipStr2 appendString: tip2];
    [myTipStr3 appendString: tip3];
        
    myTip1 = tip1.floatValue;
    myTip2 = tip2.floatValue;
    myTip3 = tip3.floatValue;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *myTipString1 = [defaults objectForKey:@"myTipString1"];
    NSString *myTipString2 = [defaults objectForKey:@"myTipString2"];
    NSString *myTipString3 = [defaults objectForKey:@"myTipString3"];

    
    if ( ![myTipString1 isEqualToString: @""] && ![myTipString1 isEqualToString:myTipStr1] ) {
        
        NSMutableString *myTipPercent1 = [[NSMutableString alloc] initWithString:@""];
        
        [myTipPercent1 appendString:myTipString1];
        [myTipPercent1 appendString:@"%"];
        
        [self.tipControl setTitle:myTipPercent1 forSegmentAtIndex:0];
        
        myTip1 = myTipString1.floatValue;
    }
    
    if ( ![myTipString2 isEqualToString: @""] && ![myTipString2 isEqualToString:myTipStr2] ) {
        
        NSMutableString *myTipPercent2 = [[NSMutableString alloc] initWithString:@""];
        
        [myTipPercent2 appendString:myTipString2];
        [myTipPercent2 appendString:@"%"];
        
        [self.tipControl setTitle:myTipPercent2 forSegmentAtIndex:1];
        
        myTip2 = myTipString2.floatValue;
    }
    
    if ( ![myTipString3 isEqualToString: @""] && ![myTipString3 isEqualToString:myTipStr3] ) {
        
        NSMutableString *myTipPercent3 = [[NSMutableString alloc] initWithString:@""];
        
        [myTipPercent3 appendString:myTipString3];
        [myTipPercent3 appendString:@"%"];
        
        [self.tipControl setTitle:myTipPercent3 forSegmentAtIndex:2];
        
        myTip3 = myTipString3.floatValue;
    }

    NSArray * myTipValues = @[@(myTip1), @(myTip2), @(myTip3)];
    
    float tipAmount = billAmount * [myTipValues[self.tipControl.selectedSegmentIndex] floatValue] * 0.01;
    
    float totalAmount = tipAmount + billAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void) onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (void) viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
}

- (void) viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
    [self updateValues];
}

- (void) viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void) viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}

@end
