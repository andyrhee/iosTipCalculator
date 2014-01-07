//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Andy Rhee on 1/7/14.
//  Copyright (c) 2014 andyrhee. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tip1TextField;
@property (weak, nonatomic) IBOutlet UITextField *tip2TextField;
@property (weak, nonatomic) IBOutlet UITextField *tip3TextField;
- (IBAction)onTap:(id)sender;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *myTipString1 = [defaults objectForKey:@"myTipString1"];
    NSString *myTipString2 = [defaults objectForKey:@"myTipString2"];
    NSString *myTipString3 = [defaults objectForKey:@"myTipString3"];
    
    self.tip1TextField.text = myTipString1;
    self.tip2TextField.text = myTipString2;
    self.tip3TextField.text = myTipString3;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self saveSettings];
}

- (void)saveSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.tip1TextField.text forKey:@"myTipString1"];
    [defaults setObject:self.tip2TextField.text forKey:@"myTipString2"];
    [defaults setObject:self.tip3TextField.text forKey:@"myTipString3"];
    [defaults synchronize];
}
@end
