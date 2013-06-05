//
//  SLoadingView.m
//  Alhayat
//
//  Created by SOHAN LAL SEERVI on 8/21/12.
//  Copyright (c) 2012 Testingxyz. All rights reserved.
//

#import "SLoadingView.h"

@implementation SLoadingView
@synthesize title;
- (id)init
{
	self = [super init];
    UIActivityIndicatorView *loadingView=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
   // self.frame=CGRectMake(0, 64, 320, 367);
      self.frame=CGRectMake(-2, 0, 325, 490);
    [self setBackgroundColor:[UIColor clearColor]];
    loadingView.center=self.center;
    lblTitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 230, 40)];
    [lblTitle setNumberOfLines:2];
    [lblTitle setFont:[UIFont fontWithName:@"helvetica" size:25.0]];
    [lblTitle setBackgroundColor:[UIColor clearColor]];
    [lblTitle setTextAlignment:UITextAlignmentCenter];
    [lblTitle setTextColor:[UIColor whiteColor]];
    if (!self.title) 
    {
        [lblTitle setText:@"Just a moment..."];
    }
    else
    {
        [lblTitle setText:self.title];
    }
   // UIImageView *imgRectangle=[[UIImageView alloc]initWithFrame:CGRectMake(20, 110, 280, 113)];
      UIImageView *imgRectangle=[[UIImageView alloc]initWithFrame:CGRectMake(-2, 0, 325, 490)];
    [imgRectangle setImage:[UIImage imageNamed:@"black_box.png"]];
    [self addSubview:imgRectangle];
   // [imgRectangle addSubview:lblTitle];
   // loadingView.center=CGPointMake(140, 65);
    loadingView.center=CGPointMake(160, 230);
    [loadingView startAnimating];
    [imgRectangle addSubview:loadingView];  
    
	return self;
}
-(void)show
{
    if (!self.title)
    {
        [lblTitle setText:@"Just a moment..."];
    }
    else
    {
        [lblTitle setText:self.title];
    }   
    self.alpha=0.1;
    [UIView beginAnimations: @"Fade In" context:nil];
    [UIView setAnimationDuration:0.3];
    self.alpha = 1;
   

    UIWindow* window = [UIApplication sharedApplication].keyWindow;
	if (!window) {
		window = [[UIApplication sharedApplication].windows objectAtIndex:0];
	}
    [window addSubview:self];
     [UIView commitAnimations];
}
-(void)hide
{
    self.alpha=1.0;
    [UIView beginAnimations: @"Fade In" context:nil];
    [UIView setAnimationDuration:0.3];
    self.alpha = 0.1;
    [self removeFromSuperview];
    [UIView commitAnimations];


}
@end
