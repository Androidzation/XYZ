//
//  ClickableMapAnnotationView.m
//  DangerousWatersTV
//
//  Testingxyz on 6/15/12.
//  Copyright (c) 2012 Testingxyz. All rights reserved.
//


#import "ClickableMapAnnotationView.h"

@implementation ClickableMapAnnotationView

@synthesize pinClicked;
@synthesize delegate;

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ( delegate != nil && [delegate respondsToSelector:pinClicked] )
        [delegate performSelector:pinClicked withObject:self.annotation];
    
    [super touchesEnded:touches withEvent:event];
 
}
/*- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event { 
    
    if ( delegate != nil && [delegate respondsToSelector:pinClicked] )
        [delegate performSelector:pinClicked withObject:self.annotation];
    
    [super touchesBegan:touches withEvent:event];
}*/

@end
