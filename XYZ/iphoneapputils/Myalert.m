
#import "Myalert.h"

@implementation Myalert
-(void)showAlert
{
	self.title=@"Hash.ly...";
	av=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
	NSLog(@"x=%f y=%f",self.bounds.origin.x,self.bounds.origin.y);
	NSLog(@"x=%f width y=%f height",self.bounds.size.width,self.bounds.size.height);
    //	av.center= CGPointMake((self.bounds.size.width+self.bounds.origin.x) / 2, (self.bounds.size.height+self.bounds.origin.y)/2);
	av.center=CGPointMake(150, 60);
	[self show];
	[av startAnimating];
	[self addSubview:av];
    
}
-(void)hideAlert
{
	[av stopAnimating];
	[av removeFromSuperview];
	[self dismissWithClickedButtonIndex:0 animated:YES];
}

@end
