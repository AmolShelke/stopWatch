//
//  ViewController.h
//  stopWatch
//
//  Created by Student P_04 on 12/04/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)start_button:(id)sender;
- (IBAction)resume_button:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property NSTimer *myTimer;
@property NSDate *startdate;
@property BOOL running;

@end

