//
//  ViewController.m
//  Sample1
//
//  Created by 藤井 裕子 on 12/01/29.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    UIButton* btn1m = [self makeUIButton:CGRectMake(20, 20, 280, 37) text:@"1分" tag:60];
//    UIButton* btn30m = [self makeUIButton:CGRectMake(20, 65, 280, 37) text:@"30分" tag:1800];
//    UIButton* btn1h = [self makeUIButton:CGRectMake(20, 110, 280, 37) text:@"1時間" tag:3600];
//    UIButton* btn4h = [self makeUIButton:CGRectMake(20, 155, 280, 37) text:@"4時間" tag:14400];
//    UIButton* btn8h = [self makeUIButton:CGRectMake(20, 200, 280, 37) text:@"8時間" tag:28800];
//    UIButton* btnStop = [self makeUIButton:CGRectMake(20, 245, 280, 37) text:@"解除" tag:0];
    UIButton* btnStop = [self makeUIButton:CGRectMake(20, 65, 280, 37) text:@"解除" tag:0];
    
    [self.view addSubview:btn1m];
//    [self.view addSubview:btn30m];
//    [self.view addSubview:btn1h];
//    [self.view addSubview:btn4h];
//    [self.view addSubview:btn8h];
    [self.view addSubview:btnStop];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (UIButton*)makeUIButton:(CGRect)rect text:(NSString *)text tag:(int)tag
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:rect];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTag:tag];
    
    [button addTarget:self action:@selector(setNotification:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

-(void)setNotification:(UIButton *)button
{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:button.tag/60];
    
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:button.tag];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    [localNotification setFireDate:date];
    [localNotification setTimeZone:[NSTimeZone defaultTimeZone]];
    [localNotification setHasAction:NO];
    [localNotification setAlertBody:@"おはよー"];
    [localNotification setSoundName:UILocalNotificationDefaultSoundName];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"設定しました" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
}
@end
