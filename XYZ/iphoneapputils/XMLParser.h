//
//  XMLParser.h
//  XML
//
//  Created by iPhone SDK Articles on 11/23/08.
//  Copyright 2008 www.iPhoneSDKArticles.com.
//

#import <UIKit/UIKit.h>
#import "UserObject.h"
#import "DealObject.h"
#import "ProfileObject.h"
#import "QuestionObj.h"
#import "Pointobject.h"
@interface XMLParser : NSObject 
{
	//UserGetInfo *objuserlist;
	//BlockUser *objblock;
	//Message *objmessage;	
	//MessageWithImg *objmsgimg;
}


-(NSMutableArray *)GetStores:(NSData *)xmlData;
-(UserObject *)GetUserdetail:(NSData *)xmlData;
-(DealObject *)GetStordetail:(NSData *)xmlData;
-(NSMutableArray *)GetProducts:(NSData *)xmlData;
//-(NSString *)GetpointFromBarcode:(NSData *)xmlData;
-(NSMutableArray *)GetRewards:(NSData *)xmlData;
-(NSString *)GetAlredyBarcode:(NSData *)xmlData;
-(NSMutableArray *)GetOffers:(NSData *)xmlData;
-(NSMutableArray *)GetFans:(NSData *)xmlData;
-(NSString *)JoinFans:(NSData *)xmlData;
-(NSMutableArray *)GetDeals:(NSData *)xmlData;
-(NSString *)GetRedeemData:(NSData *)xmlData;
-(ProfileObject *)GetProfiledetail:(NSData *)xmlData;
-(QuestionObj *)GetQuestion:(NSData *)xmlData;
-(NSString *)GetAnswer:(NSData *)xmlData;
-(Pointobject*)GetpointFromBarcode:(NSData *)xmlData;
-(NSString *)Getfavresult:(NSData *)xmlData;
-(NSString *)GetRegisterId:(NSData *)xmlData;
-(NSMutableArray *)GetCategory:(NSData *)xmlData;
-(NSString*)GetParseLoginData:(NSData *)xmlData;
-(NSString *)GetupdateProfile:(NSData *)xmlData;
-(NSString *)GetProfiledata:(NSData *)xmlData;
-(NSString *)GetfavresultDeal:(NSData *)xmlData;
-(NSString *)favoritesresult:(NSData *)xmlData;
@end
