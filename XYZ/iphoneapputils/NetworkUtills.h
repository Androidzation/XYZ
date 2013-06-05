//
//  NetworkUtills.h
//  IFINotes
//
//  Testingxyz on 2/29/12.
//  Copyright (c) 2012 Testingxyz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Myalert.h"
#import "SLoadingView.h"
//#import "AppDelegate.h"
@class AppDelegate;
@interface NetworkUtills : NSObject
{
    int tag;
    SEL callbackSelector;
    id  CallBackObject;
    Myalert *myAlert;
    SLoadingView *loading;
    NSString *strResponse;
    NSData *data;
    UIImage *Img;
    int flag;
    int CheckForUpdate;  
    UIWindow *screenWindow; 
    UIImageView *loadingImage;
    // Boolean isNeededData;
    AppDelegate *app;
}
@property int CheckForUpdate;
@property  int tag;
@property int flag;
-(BOOL)isInternetAvailable;
-(void)GetResponseByASIHttpRequest:(NSString *)strURL;
-(void)GetResponseByASIFormDataRequest:(NSString *)strURL WithDictionary:(NSDictionary *)dictPostParamas;
-(NetworkUtills *)initWithSelector:(SEL )selector WithCallBackObject:(id)objcallbackObject;
@property ( nonatomic,retain) NSString *strResponse;
@property ( nonatomic,retain) NSData *data;
@property ( nonatomic,retain)  UIImage *Img;
-(void)RequestFinished;
//-(void)GetResponseByASIHttpRequest1:(NSString *)strURL;
//@property(nonatomic,retain)Boolean *isNeededData;
//-(void)ASIHTTPRequestRequestFinished1:(ASIHTTPRequest *)request;
@end
