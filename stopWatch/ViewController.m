//
//  ViewController.m
//  stopWatch
//
//  Created by Student P_04 on 12/04/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.'
    self.running=self;
    self.startdate=[NSDate dateWithTimeIntervalSinceNow:0];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc]init];
    [dateformatter setDateFormat:@"hh:mm:ss $$$"];
    NSString *timerString=[dateformatter stringFromDate:self.startdate];
    self.timerLabel.text=timerString;
}
-(void)changeTimerValue
{
    NSDate *currentDate=[NSDate date];
    NSTimeInterval timeInterval=[currentDate timeIntervalSinceDate:self.startdate];
    NSDate *timerDate=[currentDate dateByAddingTimeInterval:timeInterval];
    NSDateFormatter *dateformater=[[NSDateFormatter alloc]init];
    [dateformater setDateFormat:@"hh:mm:ss $$$"];
    NSString *timerString=[dateformater stringFromDate:timerDate];
    self.timerLabel.text=timerString;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)start_button:(id)sender
{
    UIButton *button=sender;
    if(self.running)
    {
        [button setTitle:@"Stop" forState:UIControlStateNormal];
        if(self.myTimer==nil)
        {
            self.myTimer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeTimerValue) userInfo:nil repeats:YES];
            self.running=YES;
        }
    }
    else
    {
        [button setTitle:@"start" forState:UIControlStateNormal];
        self.running=NO;
        [self.myTimer invalidate];
        self.myTimer=nil;
        
    }
}

- (IBAction)resume_button:(id)sender
{
    self.running=NO;
    self.timerLabel.text=@"00.00 000";
}
@end
