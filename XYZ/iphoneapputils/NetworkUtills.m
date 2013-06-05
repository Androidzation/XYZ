//
//  NetworkUtills.m
//  IFINotes
//
//  Testingxyz on 2/29/12.
//  Copyright (c) 2012 Testingxyz. All rights reserved.
//

#import "NetworkUtills.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "Myalert.h"
#import "Reachability.h"
#import "SLoadingView.h"
@class AppDelegate;
@implementation NetworkUtills

@synthesize tag,strResponse;
@synthesize data;
@synthesize Img;
@synthesize flag;
@synthesize CheckForUpdate;
//@synthesize isNeededData;
// to Check that internet is available or not

-(NetworkUtills *)initWithSelector:(SEL )selector WithCallBackObject:(id)objcallbackObject
{
    [super init];
     //screenWindow = [[UIApplication sharedApplication] keyWindow];
    app=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    loadingImage=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"black_box.png"]];
    loadingImage.frame=CGRectMake(0, 0, 320, 460);
    
    UIActivityIndicatorView *act=[[UIActivityIndicatorView alloc] init];
    act.frame=CGRectMake(60, 60, 30, 30);
    act.color=[UIColor grayColor];
    act.backgroundColor=[UIColor clearColor];
    [act startAnimating];
    [loadingImage addSubview:act];
    loading=[[SLoadingView alloc] init];
    myAlert=[[Myalert alloc] init];
    callbackSelector=selector;
    CallBackObject=objcallbackObject;
    return self;
}
-(BOOL)isInternetAvailable
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];  
    NetworkStatus networkStatus = [reachability currentReachabilityStatus]; 
    if (networkStatus==NotReachable) 
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Internet Connection" message:@"Your internet connection is down right now. Please try when internet is available." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
        alert=nil;
        return NO;
    }
    return YES;
}
-(void)RequestFinished
{
    if (CallBackObject)
    {
        [CallBackObject performSelector:callbackSelector withObject:self afterDelay:0.0];
    }
}
-(void)GetResponseByASIHttpRequest:(NSString *)strURL
{
    //NSLog(@"Requested URL is %@",strURL);
    if ([self isInternetAvailable])
    {
        if (flag==1)
        {
            
        }
        else
        {
           // [self.vi addSubview:loadingImage];
            //[loading show];
            [myAlert showAlert];
        }
        
        strURL=[strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
          //NSLog(@"Requested URL is %@",strURL);
        NSURL *url=[NSURL URLWithString:strURL];
        ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:url];
        [request setDelegate:self];
        [request setDidFailSelector:@selector(ASIHTTPRequestRequestFailed:)];
        [request setDidFinishSelector:@selector(ASIHTTPRequestRequestFinished:)];
        [request setTimeOutSeconds:60.0];
        [request startAsynchronous];
        
    }
    
}


/*-(void)GetResponseByASIHttpRequest1:(NSString *)strURL
{
    //NSLog(@"Requested URL is %@",strURL);
    if ([self isInternetAvailable])
    {
        [myAlert showAlert];
        strURL=[strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        //NSLog(@"Requested URL is %@",strURL);
        NSURL *url=[NSURL URLWithString:strURL];
        ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:url];
        [request setDelegate:self];
        [request setDidFailSelector:@selector(ASIHTTPRequestRequestFailed:)];
        [request setDidFinishSelector:@selector(ASIHTTPRequestRequestFinished1:)];
        [request setTimeOutSeconds:30.0];
        [request startAsynchronous];
        
    }
    
}
*/

#pragma  ASIHTTPRequest request delegate
-(void)ASIHTTPRequestRequestFinished:(ASIHTTPRequest *)request
{
    if (flag==1) 
    {
        
    }
    else
    {
         //[loadingImage removeFromSuperview];
       [myAlert hideAlert];
        //[loading hide];
    }
    NSLog(@"status code %d",[request responseStatusCode]);
    self.data=[request responseData];
    /*if (self.data)
    {
        self.Img=[UIImage imageWithData:data];
    }*/
	//self.strResponse = [request responseString];
    self.strResponse =[NSString stringWithFormat:@"%d",[request responseStatusCode]];
	//NSLog(@"Response : %@",strResponse);
    [self RequestFinished];
}

/*-(void)ASIHTTPRequestRequestFinished1:(ASIHTTPRequest *)request
{
    [myAlert hideAlert];
	self.strResponse= [request responseString];
    const char *utfString = [self.strResponse UTF8String];
    //NSLog(@"%s", utfString);
    NSData *data1 = [NSData dataWithBytes:utfString length:strlen(utfString)];
    //NSLog(@"puneet %@", data1);
	//NSLog(@"Response : %@",strResponse);
    [self RequestFinished];
}
*/
- (void)ASIHTTPRequestRequestFailed:(ASIHTTPRequest *)request
{
    if (flag==1) 
    {
        
    }
    else
    {
       // [loadingImage removeFromSuperview];
        [myAlert hideAlert];
       // [loading hide];
    }

	NSError *error = [request error];
	NSString *errorString = [error localizedDescription];
	//NSLog(@"Error %@",errorString);
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [alert release];
   // [self RequestFinished];
    
}
-(void)GetResponseByASIFormDataRequest:(NSString *)strURL WithDictionary:(NSDictionary *)dictPostParamas
{
    //NSLog(@"Requested URL is %@",strURL);
    if ([self isInternetAvailable])
    {
        if (flag==1)
        {
            
        }
        else
        {
           // [loadingImage removeFromSuperview];
            [myAlert showAlert];
            //[loading show];
        }
        NSString *strmain=[NSString stringWithFormat:@"%@/%@",mainurl,strURL];
        strURL=[strmain stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *url=[NSURL URLWithString:strURL];
        ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
        [request setDelegate:self];
        [request setDidFailSelector:@selector(ASIFormDataRequestRequestRequestFailed:)];
        [request setDidFinishSelector:@selector(ASIFormDataRequestRequestRequestFinished:)];
        [request setTimeOutSeconds:60.0];
        NSArray *arrAllKeys=[dictPostParamas allKeys];
       /* for (int i=0; i<[arrAllKeys count]; i++) 
        {
            NSString *strKeyName=[arrAllKeys objectAtIndex:i];
            
            if ([[dictPostParamas objectForKey:strKeyName] isKindOfClass:[UIImage class]]) 
            {
                UIImage *img=[dictPostParamas objectForKey:strKeyName];
                NSData *data1=UIImageJPEGRepresentation(img, 1.0);
                
                [request setData:data1 forKey:strKeyName];
            }
            else
            {
                NSLog(@"key %@ and value %@",strKeyName,[dictPostParamas objectForKey:strKeyName]);
                [request setPostValue:[dictPostParamas objectForKey:strKeyName] forKey:strKeyName];
            }
            
            
        }*/
        for (NSString *strKey in arrAllKeys) 
        {
            NSLog(@"%@=%@&",strKey,[dictPostParamas objectForKey:strKey]);
            
            if ([strKey isEqualToString:@"picture"])
            {
                //document
                //[request addFile:[DictParameter objectForKey:strKey] forKey:strKey];
                [request addFile:[dictPostParamas objectForKey:strKey] forKey:@"picture"];
                NSLog(@"photo %@",[dictPostParamas objectForKey:strKey]);
            }
            else
            {
                [request setPostValue:[dictPostParamas valueForKey:strKey] forKey:strKey]; 
            }
        }

        [request startAsynchronous];
    }
    else
    {
        [self RequestFinished];
    }
    
}


#pragma Login ASIHTTPRequest request delegate
-(void)ASIFormDataRequestRequestRequestFinished:(ASIFormDataRequest *)request
{
    if (flag==1)
    {
        
    }
    else
    {
        //[loadingImage removeFromSuperview];
       [myAlert hideAlert];
        //[loading hide];
    }

   
	self.strResponse = [request responseString];
	//NSLog(@"Response : %@",strResponse);
    [self RequestFinished];
}
- (void)ASIFormDataRequestRequestRequestFailed:(ASIFormDataRequest *)request
{
    if (flag==1)
    {
        
    }
    else
    {
        //[loadingImage removeFromSuperview];
       [myAlert hideAlert];
      //  [loading hide];
    }

   // [myAlert hideAlert];
	NSError *error = [request error];
	NSString *errorString = [error localizedDescription];
	//NSLog(@"Error %@",errorString);
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Message" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [alert release];
    //[myAlert hideAlert];
    //[self RequestFinished];
    
}

@end
