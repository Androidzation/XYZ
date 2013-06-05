//
//  XMLParser.m
//  XML
//
//  Created by iPhone SDK Articles on 11/23/08.
//  Copyright 2008 www.iPhoneSDKArticles.com.
//

#import "XMLParser.h"
#import "CXMLElement.h"
#import "TouchXML.h"
#import "StoreObject.h"
#import "UserObject.h"
#import "DealObject.h"
#import "Productobj.h"
#import "RewardObject.h"
#import "AppDelegate.h"
#import "SpacialOfferObject.h"
#import "FanObject.h"
#import "ProfileObject.h"
#import "QuestionObj.h"
#import "Pointobject.h"
#import "CategoryObject.h"
//#import "listobj.h"
//#import "Channelobject.h"
@implementation XMLParser
-(XMLParser *) initXMLParser
{	
	[super init];
	return self;
}

-(NSMutableArray *)GetStores:(NSData *)xmlData
{
    NSMutableArray *arr = [NSMutableArray array];
	CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
	//NSArray *nodes = NULL;
    NSArray *nodes1=NULL;
    nodes1=[doc nodesForXPath:@"/response/stores/store" error:nil];
    if(nodes1)
	{
        for(CXMLElement *node in nodes1)
		{
            
			int counter;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
             StoreObject *fav=[[StoreObject alloc]init ];
			for(counter = 0;counter<[node childCount];counter++)
			{
               
                //CXMLElement *element=(CXMLElement *)[node childAtIndex:counter];
              /*  NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
                  NSLog(@"element name %@ and value %@",elementname,elementvalue);
                if ([[[node childAtIndex:counter]name] isEqualToString:@"store"]) 
                {
                    //// NSLog(@"ComeInside");
                   // obj.arrOrderList=[[NSMutableArray alloc]init];
                    CXMLElement *store=(CXMLElement *)[node childAtIndex:counter];
                for (int childcounter=0; childcounter<[store childCount]; childcounter++) 
                {*/
                    
				NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
                   // NSLog(@"element name %@ and value %@",elementname,elementvalue);
				if (!elementvalue)
                {
					//elementname=@"";
				}
				if ([elementname isEqualToString:@"storeid"]) {
					fav.StrStoreid=elementvalue ;
                    //NSLog(@"title - %@",fav.StrTitle);
				}
                //squareimg
				//else if ([elementname isEqualToString:@"storeimage"]) 
                else if ([elementname isEqualToString:@"squareimg"])
                {
					fav.StrStoreimage=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"tinyimg"])
                {
					fav.StrTinyImage=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"storename"]) 
                {
					fav.StrStoreName=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                //storename
				else if ([elementname isEqualToString:@"latitude"])
                {
                    fav.StrLatitude=elementvalue;
				}
                else if ([elementname isEqualToString:@"longitude"])
                {
                    fav.StrLongitude=elementvalue;
				}
                else if ([elementname isEqualToString:@"distance"]) {
					fav.StrDistance=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
				else if ([elementname isEqualToString:@"scanrewards"])
                {
                    fav.StrScanrewards=elementvalue;
				}
                else if ([elementname isEqualToString:@"walkinrewards"])
                {
                    fav.StrWalkinrewards=elementvalue;
				}
                else if ([elementname isEqualToString:@"fav"])
                {
                    fav.StrFavorite=elementvalue;
				}
                else if ([elementname isEqualToString:@"direction"])
                {
                    fav.StrDirection=elementvalue;
				}
                
                else if ([elementname isEqualToString:@"streetaddress1"])
                {
                    fav.Strstreetaddress1=elementvalue;
				}
                else if ([elementname isEqualToString:@"streetaddress2"])
                {
                    fav.Strstreetaddress2=elementvalue;
				}
                else if ([elementname isEqualToString:@"landmark"])
                {
                    fav.Strlandmark=elementvalue;
				}
                else if ([elementname isEqualToString:@"postcode"])
                {
                    fav.Strpostcode=elementvalue;
				}
                else if ([elementname isEqualToString:@"storeemail"])
                {
                    fav.Strstoreemail=elementvalue;
				}
                else if ([elementname isEqualToString:@"suburb"])
                {
                    fav.Strsuburb=elementvalue;
				}
                else if ([elementname isEqualToString:@"officephone"])
                {
                    fav.Strofficephone=elementvalue;
				}
                else if ([elementname isEqualToString:@"officefax"])
                {
                    fav.Strofficefax=elementvalue;
				}
                else if ([elementname isEqualToString:@"officemobile"])
                {
                    fav.Strofficemobile=elementvalue;
				}
                else if ([elementname isEqualToString:@"storemanager"])
                {
                    fav.Strstoremanagere=elementvalue;
				}
                
                
                }
            //}
               
            [arr addObject:fav];
            [fav release];
            fav=nil; 
			//}
            		
        }
   
	}
      return arr;
}

-(UserObject *)GetUserdetail:(NSData *)xmlData
{
    //NSMutableArray *arr = [NSMutableArray array];
	CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
    UserObject *user=[[UserObject alloc]init];
	NSArray *nodes = NULL;
	nodes = [doc nodesForXPath:@"/response" error:nil];
	if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
            //NSString *str;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            
			for(counter = 0;counter<[node childCount];counter++)
			{
                
                
                
                NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue)
                {
					//elementname=@"";
				}
				if ([elementname isEqualToString:@"usertotalpoints"]) {
					user.StrUsertotalpoints=elementvalue ;
                    //NSLog(@"title - %@",fav.StrTitle);
				}
				else if ([elementname isEqualToString:@"usercurrentpoints"]) {
					user.StrUsercurrentpoints=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"userpicture"]) {
					user.StrUserImage=elementvalue;
                    NSLog(@"link - %@",user.StrUserImage);
				}
				else if ([elementname isEqualToString:@"usercurrentlevel"])
                {
                    user.StrUsercurrentlevel=elementvalue;
				}
                else if ([elementname isEqualToString:@"isfacebookuser"])
                {
                    
					user.StrIsFacebook=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"mobile"])
                {
                    
					user.StrMobileNo=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"homezipcode"])
                {
                    //  AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];  
				user.StrHome=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"workzipcode"])
                {
                    
					user.StrWork=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"email"])
                {
                    //  AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];  
					user.StrEmail=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"dealid"])
                {
                    user.StrDealId=elementvalue;
				}
                else if ([elementname isEqualToString:@"dealurl"])
                {
                    user.StrDealurl=elementvalue;
				}
                else if ([elementname isEqualToString:@"totalscanrewards"]) {
					user.StrTotalscanrewards=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
				else if ([elementname isEqualToString:@"totalwalkinrewards"])
                {
                    user.StrTotalwalkinrewards=elementvalue;
				}
                else if ([elementname isEqualToString:@"rewardid1"])
                {
                    user.StrRewardId=elementvalue;
				}

                else if ([elementname isEqualToString:@"rewardurl1"])
                {
                    user.StrRewardurl1=elementvalue;
				}

                else if ([elementname isEqualToString:@"RewadsPoints1"]) {
					user.StrRewadsPoints1=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
				else if ([elementname isEqualToString:@"rewardurl2"])
                {
                    user.StrRewardurl2=elementvalue;
				}
                else if ([elementname isEqualToString:@"RewadsPoints2"])
                {
                    user.StrRewadsPoints2=elementvalue;
				}
                else if ([elementname isEqualToString:@"userid"])
                {
                    user.StrUserId=elementvalue;
				}
                //username
                else if ([elementname isEqualToString:@"firstname"])
                {
                    user.StrUserName=elementvalue;
				}
                else if ([elementname isEqualToString:@"lastname"])
                {
                    user.StrUserLastName=elementvalue;
				}

                /*else if ([elementname isEqualToString:@"username"])
                {
                    user.StrUserName=elementvalue;
				}*/

                else if ([elementname isEqualToString:@"spofferid"]) {
					user.StrSpaicalOfferId=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}

              else if ([elementname isEqualToString:@"spoffername"]) {
					user.StrSpaicalOffer=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
				else if ([elementname isEqualToString:@"spofferimg"])
                {
                    user.StrSpaicalOfferImg=elementvalue;
				}
                else if ([elementname isEqualToString:@"spofferurl"])
                {
                    user.StrSpaicalOfferUrl=elementvalue;
				}

            }
			
           
		}
	}
    
	return user;
    
}

-(NSString*)GetParseLoginData:(NSData *)xmlData
{
    CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
    NSString *point=@"";
	NSArray *nodes = NULL;
	nodes = [doc nodesForXPath:@"/response" error:nil];
    AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];  
	if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
            //NSString *str;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            
			for(counter = 0;counter<[node childCount];counter++)
			{
                
                
                
                NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue)
                {
					//elementname=@"";
				}
				//if ([elementname isEqualToString:@"currentpoints"]) 
                if ([elementname isEqualToString:@"userid"])
                {
                    point=elementvalue;
					app.user.StrUserId=elementvalue ;
                    //NSLog(@"title - %@",fav.StrTitle);
				}
                else if ([elementname isEqualToString:@"isfacebookuser"])
                {
                    
					app.user.StrIsFacebook=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"firstname"])
                {
                    //  AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];  
					app.user.StrUserName=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"lastname"])
                {
                    
					app.user.StrUserLastName=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"picture"])
                {
                    //  AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];  
					app.user.StrUserImage=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"mobile"])
                {
                    
					app.user.StrMobileNo=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"homezipcode"])
                {
                    //  AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];  
					app.user.StrHome=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"workzipcode"])
                {
                    
					app.user.StrWork=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"email"])
                {
                    //  AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];  
					app.user.StrEmail=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}

				//userlavel
                
            }
			
            
		}
	}
    NSLog(@"mob %@  home %@  work %@  email %@",app.user.StrMobileNo,app.user.StrHome,app.user.StrWork,app.user.StrEmail);
	return point;
    
}
-(NSString *)GetRegisterId:(NSData *)xmlData
{
    CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
    NSString *point=@"";
	NSArray *nodes = NULL;
	//nodes = [doc nodesForXPath:@"/response" error:nil];
    nodes = [doc nodesForXPath:@"/response" error:nil];
	if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
            //NSString *str;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            
			for(counter = 0;counter<[node childCount];counter++)
			{
                
                
                
                NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue)
                {
					//elementname=@"";
				}
				/*if ([elementname isEqualToString:@"response"]) {
					point=elementvalue ;
                    //NSLog(@"title - %@",fav.StrTitle);
				}*/
				if ([elementname isEqualToString:@"userid"]) {
					point=elementvalue ;
                    //NSLog(@"title - %@",fav.StrTitle);
				}

                
            }
			
            
		}
	}
    
	return point;

}
-(NSString *)GetProfiledata:(NSData *)xmlData
{
    AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
    NSString *point=@"-1";
	NSArray *nodes = NULL;
	//nodes = [doc nodesForXPath:@"/response" error:nil];
    nodes = [doc nodesForXPath:@"/response" error:nil];
	if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
            //NSString *str;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            
			for(counter = 0;counter<[node childCount];counter++)
			{
                
                
                
                NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue)
                {
					//elementname=@"";
				}
				
				/*if ([elementname isEqualToString:@"response"]) {
					point=elementvalue ;
                    //NSLog(@"title - %@",fav.StrTitle);
				}*/
                if ([elementname isEqualToString:@"totalpoints"]) {
					app.user.StrUsertotalpoints=elementvalue ;
                    //NSLog(@"title - %@",fav.StrTitle);
				}
				else if ([elementname isEqualToString:@"currentpoints"]) {
					app.user.StrUsercurrentpoints=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"picture"]) {
					app.user.StrUserImage=elementvalue;
                    //NSLog(@"link - %@",user.StrUserImage);
				}
				else if ([elementname isEqualToString:@"userlavel"])
                {
                    app.user.StrUsercurrentlevel=elementvalue;
				}
                else if ([elementname isEqualToString:@"isfacebookuser"])
                {
                    
					app.user.StrIsFacebook=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"mobile"])
                {
                    
					app.user.StrMobileNo=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"homezipcode"])
                {
                    //  AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];
                    app.user.StrHome=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"workzipcode"])
                {
                    
					app.user.StrWork=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"email"])
                {
                    //  AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];
					app.user.StrEmail=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"totalscanrewards"]) {
					app.user.StrTotalscanrewards=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
				else if ([elementname isEqualToString:@"totalwalkinrewards"])
                {
                    app.user.StrTotalwalkinrewards=elementvalue;
				}
                else if ([elementname isEqualToString:@"userid"])
                {
                    app.user.StrUserId=elementvalue;
                    point=elementvalue;
				}
                //username
                else if ([elementname isEqualToString:@"firstname"])
                {
                    app.user.StrUserName=elementvalue;
				}
                else if ([elementname isEqualToString:@"lastname"])
                {
                    app.user.StrUserLastName=elementvalue;
				}
                
                /*else if ([elementname isEqualToString:@"username"])
                 {
                 user.StrUserName=elementvalue;
                 }*/
                
                              
                
            }
			
            
		}
	}
    
	return point;
}
-(NSString *)GetupdateProfile:(NSData *)xmlData
{
    CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
    NSString *point=@"";
	NSArray *nodes = NULL;
	//nodes = [doc nodesForXPath:@"/response" error:nil];
    nodes = [doc nodesForXPath:@"/" error:nil];
	if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
            //NSString *str;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            
			for(counter = 0;counter<[node childCount];counter++)
			{
                
                
                
                NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue)
                {
					//elementname=@"";
				}
				
				if ([elementname isEqualToString:@"response"]) {
					point=elementvalue ;
                    //NSLog(@"title - %@",fav.StrTitle);
				}
                
                
            }
			
            
		}
	}
    
	return point;
}
-(DealObject *)GetStordetail:(NSData *)xmlData
{
    //NSMutableArray *arr = [NSMutableArray array];
	CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
    DealObject *user=[[DealObject alloc]init];
	NSArray *nodes = NULL;
	//nodes = [doc nodesForXPath:@"/response/deal" error:nil];
    nodes = [doc nodesForXPath:@"/response" error:nil];
     NSLog(@"nodes count %d",[nodes count]);
	if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
            //NSString *str;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            
			for(counter = 0;counter<[node childCount];counter++)
			{
                NSLog(@"[node childCount] %d",[node childCount]);
                
                if ([[[node childAtIndex:counter]name] isEqualToString:@"deal"]) 
                {
                    CXMLElement *AddressNode=(CXMLElement *)[node childAtIndex:counter];
                    
                    if (AddressNode) 
                    {
                        int counter1;
						for( counter1 = 0;counter1<[AddressNode childCount];counter1++)
						{
                            NSString *elementname= [[AddressNode childAtIndex:counter1]name];
                            NSString *elementvalue=[[AddressNode childAtIndex:counter1]stringValue];
                            if (!elementvalue)
                            {
                                //elementname=@"";
                            }
                            if ([elementname isEqualToString:@"dealandfindsurl"]) {
                                user.StrDealandfindsurl=elementvalue ;
                                //NSLog(@"title - %@",fav.StrTitle);
                            }
                            else if ([elementname isEqualToString:@"dealandfindsurl"]) {
                                user.StrDealandfindrefurl=elementvalue;
                                //NSLog(@"link - %@",fav.StrLink);
                            }
                            else if ([elementname isEqualToString:@"dealid"]) {
                                user.StrDealid=elementvalue;
                                //NSLog(@"link - %@",fav.StrLink);
                            }


                           
                        }  
                    }

                }
                else if ([[[node childAtIndex:counter]name] isEqualToString:@"specialoffer"])
                {
                    CXMLElement *specialofferNode=(CXMLElement *)[node childAtIndex:counter];
                    
                    if (specialofferNode) 
                    {
                        int counter1;
						for( counter1 = 0;counter1<[specialofferNode childCount];counter1++)
						{
                            NSString *elementname= [[specialofferNode childAtIndex:counter1]name];
                            NSString *elementvalue=[[specialofferNode childAtIndex:counter1]stringValue];
                            if (!elementvalue)
                            {
                                //elementname=@"";
                            }
                            if ([elementname isEqualToString:@"specialOfferName"])
                            {
                                user.StrSpaicalOfferName=elementvalue;
                            }
                            else if ([elementname isEqualToString:@"specialofferurl"])
                            {
                                user.StrSpaicalOfferurl=elementvalue;
                            }  
                            else if ([elementname isEqualToString:@"specialOfferid"])
                            {
                                user.StrOfferid=elementvalue;
                            }  
                        }  
                    }
                    
                } 
                else if ([[[node childAtIndex:counter]name] isEqualToString:@"walloffans"]) 
                {
                    CXMLElement *walloffanNode=(CXMLElement *)[node childAtIndex:counter];
                    
                    if (walloffanNode) 
                    {
                        user.ArrFan=[[NSMutableArray alloc] init];
                        int counter1;
						for( counter1 = 0;counter1<[walloffanNode childCount];counter1++)
						{
                            
                             CXMLElement *fanNode=(CXMLElement *)[walloffanNode childAtIndex:counter1];
                            if (fanNode)
                            {
                                 FanObject *fan=[[FanObject alloc] init];
                                int counter2;
                                for( counter2 = 0;counter2<[fanNode childCount];counter2++)
                                {
                               
                                NSString *elementname= [[fanNode childAtIndex:counter2]name];
                                NSString *elementvalue=[[fanNode childAtIndex:counter2]stringValue];
                                if (!elementvalue)
                                {
                                    //elementname=@"";
                                }
                                if ([elementname isEqualToString:@"fanid"])
                                {
                                    fan.StrFanid=elementvalue;
                                }
                                else if ([elementname isEqualToString:@"fanimg"])
                                {
                                    fan.StrFanImage=elementvalue;
                                } 
                                    NSLog(@"fan id  %@  and image %@",fan.StrFanid,fan.StrFanImage);
                                  
                                }
                                [user.ArrFan addObject:fan];
                                [fan release];
                                fan=nil;
                            }
                                              
                        }  
                    }
                    
                }
            }
			
            
		}
	}
    NSLog(@"user dealref-%@  dealfind-%@   spa name-%@  refurl-%@  fan count %d",user.StrDealandfindrefurl,user.StrDealandfindsurl,user.StrSpaicalOfferName,user.StrSpaicalOfferurl,user.ArrFan.count);
	return user;
    
}

// 
/*-(DealObject *)GetStordetail:(NSData *)xmlData
{
    //NSMutableArray *arr = [NSMutableArray array];
	CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
    DealObject *user=[[DealObject alloc]init];
	NSArray *nodes = NULL;
	//nodes = [doc nodesForXPath:@"/response/deal" error:nil];
    nodes = [doc nodesForXPath:@"/response" error:nil];
	if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
            //NSString *str;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            
			for(counter = 0;counter<[node childCount];counter++)
			{
                
                  // CXMLElement *store=(CXMLElement *)[node childAtIndex:counter];
                
                
                NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue)
                {
					//elementname=@"";
				}
				if ([elementname isEqualToString:@"dealandfindsurl"]) {
					user.StrDealandfindsurl=elementvalue ;
                    //NSLog(@"title - %@",fav.StrTitle);
				}
				else if ([elementname isEqualToString:@"dealandfindrefurl"]) {
					user.StrDealandfindrefurl=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
				else if ([elementname isEqualToString:@"specialOfferName"])
                {
                    user.StrSpaicalOfferName=elementvalue;
				}
                else if ([elementname isEqualToString:@"specialofferrefurl"])
                {
                    user.StrSpaicalOfferurl=elementvalue;
				}
               
            }
			
            
		}
	}
    
	return user;
    
}*/


-(ProfileObject *)GetProfiledetail:(NSData *)xmlData
{
    //NSMutableArray *arr = [NSMutableArray array];
	CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
    ProfileObject *user=[[ProfileObject alloc]initWithDefault];
	NSArray *nodes = NULL;
	//nodes = [doc nodesForXPath:@"/response/deal" error:nil];
    nodes = [doc nodesForXPath:@"/response" error:nil];
	if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
            //NSString *str;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            
			for(counter = 0;counter<[node childCount];counter++)
			{
                
                 if ([[[node childAtIndex:counter]name] isEqualToString:@"stores"]) 
                 {
                    CXMLElement *walloffanNode=(CXMLElement *)[node childAtIndex:counter];
                    
                    if (walloffanNode) 
                    {
                        user.ArrStore=[[NSMutableArray alloc] init];
                        int counter1;
						for( counter1 = 0;counter1<[walloffanNode childCount];counter1++)
						{
                            
                            CXMLElement *fanNode=(CXMLElement *)[walloffanNode childAtIndex:counter1];
                            if (fanNode)
                            {
                                StoreObject *fan=[[StoreObject alloc] init];
                                int counter2;
                                for( counter2 = 0;counter2<[fanNode childCount];counter2++)
                                {
                                    
                                    NSString *elementname= [[fanNode childAtIndex:counter2]name];
                                    NSString *elementvalue=[[fanNode childAtIndex:counter2]stringValue];
                                    if (!elementvalue)
                                    {
                                        //elementname=@"";
                                    }
                                    if ([elementname isEqualToString:@"storeid"])
                                    {
                                        fan.StrStoreid=elementvalue;
                                    }
                                   // else if ([elementname isEqualToString:@"storeimage"])
                                       else if ([elementname isEqualToString:@"squareimg"])
                                    {
                                        fan.StrStoreimage=elementvalue;
                                    }   
                                }
                                [user.ArrStore addObject:fan];
                                [fan release];
                                fan=nil;
                            }
                            
                        }  
                    }
                     
                                   
                  
                }
                 else if ([[[node childAtIndex:counter]name] isEqualToString:@"userimage"]) 
                 {
                     NSString *elementname= [[node childAtIndex:counter]name];
                     NSString *elementvalue=[[node childAtIndex:counter]stringValue];
                     
                     if (!elementvalue)
                     {
                         //elementname=@"";
                     }
                     if ([elementname isEqualToString:@"userimage"]) {
                         user.StrProfileImage=elementvalue ;
                         NSLog(@"prfile - %@",user.StrProfileImage);
                     }
                     
                     
                     
                     
                     
                 }
                 else if ([[[node childAtIndex:counter]name] isEqualToString:@"rewardimg"]) 
                 {
                     NSString *elementname= [[node childAtIndex:counter]name];
                     NSString *elementvalue=[[node childAtIndex:counter]stringValue];
                     
                     if (!elementvalue)
                     {
                         //elementname=@"";
                     }
                     if ([elementname isEqualToString:@"rewardimg"]) {
                         user.StrRewardImage=elementvalue ;
                         NSLog(@"prfile - %@",user.StrProfileImage);
                     }
                     
                     
                     
                     
                     
                 }
                 else if ([[[node childAtIndex:counter]name] isEqualToString:@"dealimg"]) 
                 {
                     NSString *elementname= [[node childAtIndex:counter]name];
                     NSString *elementvalue=[[node childAtIndex:counter]stringValue];
                     
                     if (!elementvalue)
                     {
                         //elementname=@"";
                     }
                     if ([elementname isEqualToString:@"dealimg"]) {
                         user.StrDealImage=elementvalue ;
                         NSLog(@"deal111111 - %@",user.StrDealImage);
                     }
                     
                     
                     
                     
                     
                 }
                //redeemimg
                 else if ([[[node childAtIndex:counter]name] isEqualToString:@"redeemimg"])
                 {
                     NSString *elementname= [[node childAtIndex:counter]name];
                     NSString *elementvalue=[[node childAtIndex:counter]stringValue];
                     
                     if (!elementvalue)
                     {
                         //elementname=@"";
                     }
                     if ([elementname isEqualToString:@"redeemimg"]) {
                         user.StrRedeemImage=elementvalue ;
                         NSLog(@"deal - %@",user.StrProfileImage);
                     }
                     
                     
                     
                     
                     
                 }

            }
			
            
		}
	}
NSLog(@"profile stor count %d and %@",user.ArrStore.count,user.StrProfileImage);
  //  NSLog(@"user dealref-%@  dealfind-%@   spa name-%@  refurl-%@  fan count %d",user.StrDealandfindrefurl,user.StrDealandfindsurl,user.StrSpaicalOfferName,user.StrSpaicalOfferurl,user.ArrFan.count);
	return user;
    
}



-(QuestionObj *)GetQuestion:(NSData *)xmlData
{
    //NSMutableArray *arr = [NSMutableArray array];
	CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
    QuestionObj *qus=[[QuestionObj alloc]init];
	NSArray *nodes = NULL;
	nodes = [doc nodesForXPath:@"/info" error:nil];
	if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
            //NSString *str;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            
			for(counter = 0;counter<[node childCount];counter++)
			{
                
                
                
                NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue)
                {
					//elementname=@"";
				}
				if ([elementname isEqualToString:@"questionid"]) {
					qus.StrQuesId=elementvalue ;
                    //NSLog(@"title - %@",fav.StrTitle);
				}
				else if ([elementname isEqualToString:@"question"]) {
					qus.StrQues=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
				
                               
            }
			
            
		}
	}
    
	return qus;
    
}

-(NSString *)GetAnswer:(NSData *)xmlData
{
    CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
    NSString *point=@"";
	NSArray *nodes = NULL;
	nodes = [doc nodesForXPath:@"/info" error:nil];
    //AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];  
	if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
            //NSString *str;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            
			for(counter = 0;counter<[node childCount];counter++)
			{
                
                
                
                NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue)
                {
					//elementname=@"";
				}
				if ([elementname isEqualToString:@"answer"]) {
					point=elementvalue ;
                    //NSLog(@"title - %@",fav.StrTitle);
				}
                               
                
            }
			
            
		}
	}
    
	return point;
    
}

/*
-(NSString *)GetpointFromBarcode:(NSData *)xmlData
{
    CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
   NSString *point=@"";
	NSArray *nodes = NULL;
	nodes = [doc nodesForXPath:@"/response" error:nil];
    AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];  
	if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
            //NSString *str;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            
			for(counter = 0;counter<[node childCount];counter++)
			{
                
                
                
                NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue)
                {
					//elementname=@"";
				}
				//if ([elementname isEqualToString:@"currentpoints"]) 
                if ([elementname isEqualToString:@"currentpoints"])
                {
					point=elementvalue ;
                    //NSLog(@"title - %@",fav.StrTitle);
				}
                else if ([elementname isEqualToString:@"userlavel"])
                {
                    
					app.user.StrUsercurrentlevel=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"TotalPointsToDate"])
                {
                  //  AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];  
					app.user.StrUsertotalpoints=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
				//userlavel
                
            }
			
            
		}
	}
    
	return point;
    
}*/
//Getfavresult

-(NSString *)Getfavresult:(NSData *)xmlData
{
    CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
    NSString *point=@"";
	NSArray *nodes = NULL;
	nodes = [doc nodesForXPath:@"/response" error:nil];
    AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];  
	if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
            //NSString *str;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            
			for(counter = 0;counter<[node childCount];counter++)
			{
                
                
                
                NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
                point=elementvalue;
				if (!elementvalue)
                {
					//elementname=@"";
				}
				//if ([elementname isEqualToString:@"currentpoints"]) 
                if ([elementname isEqualToString:@"currentpoints"])
                {
					point=elementvalue ;
                    //NSLog(@"title - %@",fav.StrTitle);
				}
                else if ([elementname isEqualToString:@"userlavel"])
                {
                    
					app.user.StrUsercurrentlevel=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"TotalPointsToDate"])
                {
                    //  AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];  
					app.user.StrUsertotalpoints=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
               /* else if ([elementname isEqualToString:@"TotalPointsToDate"])
                {
                    //  AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];
					app.user.StrUsertotalpoints=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}*/
               
				//userlavel
                
            }
			
            
		}
	}
    
	return point;
    
}



-(NSString *)favoritesresult:(NSData *)xmlData
{
    CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
    NSString *point=@"";
	NSArray *nodes = NULL;
	nodes = [doc nodesForXPath:@"/response" error:nil];
    AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];
	if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
            //NSString *str;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            
			for(counter = 0;counter<[node childCount];counter++)
			{
                
                
                
                NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue)
                {
					//elementname=@"";
				}
				//if ([elementname isEqualToString:@"currentpoints"])
                if ([elementname isEqualToString:@"result"])
                {
					point=elementvalue ;
                    //NSLog(@"title - %@",fav.StrTitle);
				}
                                              
				//userlavel
                
            }
			
            
		}
	}
    
	return point;
}


-(NSString *)GetfavresultDeal:(NSData *)xmlData
{
    CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
    NSString *point=@"";
       NSString *pass=@"";
	NSArray *nodes = NULL;
	nodes = [doc nodesForXPath:@"/response" error:nil];
    //AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];
	if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
            //NSString *str;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            
			for(counter = 0;counter<[node childCount];counter++)
			{
                
                
                
                NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue)
                {
					//elementname=@"";
				}
				//if ([elementname isEqualToString:@"currentpoints"])
               
               else if ([elementname isEqualToString:@"passbookurl"])
                {
                    //  AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];
					pass=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"result"])
                {
                    //  AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];
					point=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                //result
				//userlavel
                
            }
			
            
		}
	}
    
	return pass;
    
}


-(Pointobject *)GetpointFromBarcode:(NSData *)xmlData
{
    CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
    NSString *point=@"";
    Pointobject *pointobj=[[Pointobject alloc] init];
	NSArray *nodes = NULL;
	nodes = [doc nodesForXPath:@"/response" error:nil];
    AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];  
	if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
            //NSString *str;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            
			for(counter = 0;counter<[node childCount];counter++)
			{
                
                
                
                NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue)
                {
					//elementname=@"";
				}
				//if ([elementname isEqualToString:@"currentpoints"]) 
                if ([elementname isEqualToString:@"currentpoints"])
                {
					point=elementvalue ;
                    pointobj.StrCurrentpoint=elementvalue;
                    //NSLog(@"title - %@",fav.StrTitle);
				}
                else if ([elementname isEqualToString:@"userlavel"])
                {
                    
					app.user.StrUsercurrentlevel=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"TotalPointsToDate"])
                {
                    //  AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];  
					app.user.StrUsertotalpoints=elementvalue;
                    pointobj.StrTotaltoDate=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                else if ([elementname isEqualToString:@"scanpoints"])
                {
                    //  AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];  
					//app.user.StrUsertotalpoints=elementvalue;
                    pointobj.StrScanpoint=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
				//userlavel
                
            }
			
            
		}
	}
    
	return pointobj;
    
}

-(NSString *)GetAlredyBarcode:(NSData *)xmlData
{
    CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
    NSString *point=@"";
	NSArray *nodes = NULL;
	nodes = [doc nodesForXPath:@"/response" error:nil];
	if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
            //NSString *str;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            
			for(counter = 0;counter<[node childCount];counter++)
			{
                
                
                
                NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue)
                {
					//elementname=@"";
				}
				if ([elementname isEqualToString:@"walkingrewardpt"]) {
					point=elementvalue ;
                    //NSLog(@"title - %@",fav.StrTitle);
				}
				
                
            }
			
            
		}
	}
    
	return point;
    
}


-(NSMutableArray *)GetProducts:(NSData *)xmlData
{
    NSMutableArray *arr = [NSMutableArray array];
	CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
	NSArray *nodes = NULL;
	nodes = [doc nodesForXPath:@"/response/products/product" error:nil];
    if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            Productobj *fav=[[Productobj alloc]initWithDefault ];
			for(counter = 0;counter<[node childCount];counter++)
			{
				NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue) {
					//elementname=@"";
				}
				if ([elementname isEqualToString:@"productid"]) {
					fav.StrProductid=elementvalue ;
				}
				else if ([elementname isEqualToString:@"title"]) {
					fav.StrProductTitle=elementvalue;
				}
				else if ([elementname isEqualToString:@"scanrewards"])
                {
                    fav.StrScanrewards=elementvalue;
				}
                else if ([elementname isEqualToString:@"square"])
                {
                    fav.StrProductimage=elementvalue;
				}
                else if ([elementname isEqualToString:@"normal"])
                {
                    fav.StrProductNormalimage=elementvalue;
				}
                else if ([elementname isEqualToString:@"big"])
                {
                    fav.StrProductBigimage=elementvalue;
				}
                else if ([elementname isEqualToString:@"fav"])
                {
                    fav.StrFavorite=elementvalue;
				}
                else if ([elementname isEqualToString:@"isScan"])
                {
                    fav.StrIsScan=elementvalue;
				}
                else if ([elementname isEqualToString:@"Info1"])
                {
                    fav.StrInfo1=elementvalue;
                }
                else if ([elementname isEqualToString:@"Info2"])
                {
                    fav.StrInfo2=elementvalue;
                }
                else if ([elementname isEqualToString:@"Info3"])
                {
                    fav.StrInfo3=elementvalue;
                }
                else if ([elementname isEqualToString:@"Info4"])
                {
                    fav.StrInfo4=elementvalue;
                }
                else if ([elementname isEqualToString:@"Info4"])
                {
                    fav.StrOfferRefUrl=elementvalue;
                }
                else if ([elementname isEqualToString:@"referenceurl"])
                {
                    fav.StrOfferRefUrl=elementvalue;
                }

               /* else if ([elementname isEqualToString:@"author"])
                {
                    fav.StrAuthor=elementvalue;
				}
                else if ([elementname isEqualToString:@"category"])
                {
                    fav.StrCategory=elementvalue;
				}
                else if ([elementname isEqualToString:@"pubDate"])
                {
                    fav.StrPubDate=elementvalue;
				}
                
               */ 
                
                               
			}
			[arr addObject:fav];
            [fav release];
            fav=nil;
		}
	}
	return arr;

    
}


-(NSMutableArray *)GetRewards:(NSData *)xmlData
{
    NSMutableArray *arr = [NSMutableArray array];
	CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
	NSArray *nodes = NULL;
	nodes = [doc nodesForXPath:@"/response/rewards/reward" error:nil];
    if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            RewardObject *fav=[[RewardObject alloc]initWithDefault ];
			for(counter = 0;counter<[node childCount];counter++)
			{
				NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue) {
					//elementname=@"";
				}
				if ([elementname isEqualToString:@"rewardid"]) {
					fav.StrRewardid=elementvalue ;
				}
				else if ([elementname isEqualToString:@"rewardname"]) {
					fav.StrRewardTitle=elementvalue;
				}
				else if ([elementname isEqualToString:@"rewardspoints"])
                {
                    fav.StrrewardsPoint=elementvalue;
				}
                else if ([elementname isEqualToString:@"storeimage"])
                {
                    fav.StrRewardimage=elementvalue;
				}
                else if ([elementname isEqualToString:@"storeimage"])
                {
                    fav.StrRewardimage=elementvalue;
				}
                else if ([elementname isEqualToString:@"square"])
                {
                    fav.StrRewardimage=elementvalue;
				}
                else if ([elementname isEqualToString:@"front"])
                {
                    fav.StrRewardNormalimage=elementvalue;
				}
                else if ([elementname isEqualToString:@"back"])
                {
                    fav.StrRewardBigimage=elementvalue;
				}

                else if ([elementname isEqualToString:@"info1"])
                {
                    fav.StrRewardInfo1=elementvalue;
				}
                else if ([elementname isEqualToString:@"info2"])
                {
                    fav.StrRewardInfo2=elementvalue;
				}
                else if ([elementname isEqualToString:@"info3"])
                {
                    fav.StrRewardInfo3=elementvalue;
				}

                else if ([elementname isEqualToString:@"info4"])
                {
                    fav.StrRewardInfo4=elementvalue;
				}

                
                
			}
			[arr addObject:fav];
            [fav release];
            fav=nil;
		}
	}
	return arr;
    
    
}



-(NSMutableArray *)GetOffers:(NSData *)xmlData
{
    NSMutableArray *arr = [NSMutableArray array];
	CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
	NSArray *nodes = NULL;
	nodes = [doc nodesForXPath:@"/response/spoffers/spoffer" error:nil];
    if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            Productobj *fav=[[Productobj alloc]initWithDefault ];
			for(counter = 0;counter<[node childCount];counter++)
			{
				NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue) {
					//elementname=@"";
				}
				if ([elementname isEqualToString:@"SpecialOfferID"]) {
					fav.StrProductid=elementvalue ;
				}
				else if ([elementname isEqualToString:@"OfferName"]) {
					fav.StrProductTitle=elementvalue;
				}
				else if ([elementname isEqualToString:@"StartDate"])
                {
                    fav.StrOfferStartDate=elementvalue;
				}
                else if ([elementname isEqualToString:@"EndDate"])
                {
                    fav.StrOfferEndDate=elementvalue;
				}
                else if ([elementname isEqualToString:@"square"])
                {
                    fav.StrProductimage=elementvalue;
				}
                else if ([elementname isEqualToString:@"front"])
                {
                    fav.StrProductNormalimage=elementvalue;
				}
                else if ([elementname isEqualToString:@"back"])
                {
                    fav.StrProductBigimage=elementvalue;
				}                
                else if ([elementname isEqualToString:@"referenceurl"])
                {
                    fav.StrOfferRefUrl=elementvalue;
                }
                 else if ([elementname isEqualToString:@"Info1"])
                 {
                 fav.StrInfo1=elementvalue;
                 }
                 else if ([elementname isEqualToString:@"Info2"])
                 {
                 fav.StrInfo2=elementvalue;
                 }
                 else if ([elementname isEqualToString:@"Info3"])
                 {
                 fav.StrInfo3=elementvalue;
                 }
                 else if ([elementname isEqualToString:@"Info4"])
                 {
                     fav.StrInfo4=elementvalue;
                 }
                 else if ([elementname isEqualToString:@"Terms"])
                 {
                     fav.StrOfferTerms=elementvalue;
                 }
                 else if ([elementname isEqualToString:@"retailchainname"])
                 {
                     fav.StrRetailChainName=elementvalue;
                 }
                  
                
                
			}
			[arr addObject:fav];
            [fav release];
            fav=nil;
		}
	}
	return arr;
    
    
}


-(NSMutableArray *)GetDeals:(NSData *)xmlData
{
    NSMutableArray *arr = [NSMutableArray array];
	CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
	NSArray *nodes = NULL;
	nodes = [doc nodesForXPath:@"/response/rewards/reward" error:nil];
    if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            Productobj *fav=[[Productobj alloc]initWithDefault ];
			for(counter = 0;counter<[node childCount];counter++)
			{
				NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue) {
					//elementname=@"";
				}
				if ([elementname isEqualToString:@"dealid"]) {
					fav.StrProductid=elementvalue ;
				}
				else if ([elementname isEqualToString:@"dealname"]) {
					fav.StrProductTitle=elementvalue;
				}
                else if ([elementname isEqualToString:@"fav"]) {
					fav.StrFavorite=elementvalue;
				}
				
                else if ([elementname isEqualToString:@"square"])
                {
                    fav.StrProductimage=elementvalue;
				}
                else if ([elementname isEqualToString:@"front"])
                {
                    fav.StrProductNormalimage=elementvalue;
				}
                else if ([elementname isEqualToString:@"back"])
                {
                    fav.StrProductBigimage=elementvalue;
				}                
                
                else if ([elementname isEqualToString:@"info1"])
                {
                    fav.StrInfo1=elementvalue;
                }
                else if ([elementname isEqualToString:@"info2"])
                {
                    fav.StrInfo2=elementvalue;
                }
                else if ([elementname isEqualToString:@"info2"])
                {
                    fav.StrInfo3=elementvalue;
                }
                else if ([elementname isEqualToString:@"info4"])
                {
                    fav.StrInfo4=elementvalue;
                }
                else if ([elementname isEqualToString:@"Terms"])
                {
                    fav.StrOfferTerms=elementvalue;
                }
                
                else if ([elementname isEqualToString:@"retailchainname"])
                {
                   fav.StrRetailChainName=elementvalue;
                }
                else if ([elementname isEqualToString:@"referenceurl"])
                {
                    fav.StrOfferRefUrl=elementvalue;
                }
                //referenceurl
                
			}
			[arr addObject:fav];
            [fav release];
            fav=nil;
		}
	}
	return arr;
    
    
}


-(NSMutableArray *)GetFans:(NSData *)xmlData
{
    NSMutableArray *arr = [NSMutableArray array];
	CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
	NSArray *nodes = NULL;
	nodes = [doc nodesForXPath:@"/response/fans/fan" error:nil];
    if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            FanObject *fav=[[FanObject alloc]init ];
			for(counter = 0;counter<[node childCount];counter++)
			{
				NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue) {
					//elementname=@"";
				}
				if ([elementname isEqualToString:@"userid"]) {
					fav.StrFanid=elementvalue ;
				}
				else if ([elementname isEqualToString:@"userimage"]) {
					fav.StrFanImage=elementvalue;
				}
				else if ([elementname isEqualToString:@"isfanjoined"]) {
					fav.StrIsjoin=elementvalue;
				}
                else if ([elementname isEqualToString:@"isfacebookUser"]) {
					fav.StrIsfacebook=elementvalue;
				}
    
                else if ([elementname isEqualToString:@"useraccesstoken"]) {
					fav.StrAccessToken=elementvalue;
				}
			}
			[arr addObject:fav];
            [fav release];
            fav=nil;
		}
	}
	return arr;
    
    
}
-(NSString *)JoinFans:(NSData *)xmlData
{
    NSString *str;
    //NSMutableArray *arr = [NSMutableArray array];
	CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
	NSArray *nodes = NULL;
	nodes = [doc nodesForXPath:@"/" error:nil];
    if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
           // FanObject *fav=[[FanObject alloc]init ];
			for(counter = 0;counter<[node childCount];counter++)
			{
				NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue) {
					//elementname=@"";
				}
				if ([elementname isEqualToString:@"response"]) 
                {
					str=elementvalue ;
				}
				      
                
			}
			
		}
	}
	return str;
    
    
}


-(NSString *)GetRedeemData:(NSData *)xmlData
{
    CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
    NSString *point=@"";
	NSArray *nodes = NULL;
	nodes = [doc nodesForXPath:@"/info" error:nil];
    AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];  
	if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
            //NSString *str;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            
			for(counter = 0;counter<[node childCount];counter++)
			{
                
                
                
                NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue)
                {
					//elementname=@"";
				}
				if ([elementname isEqualToString:@"currentpoints"]) {
					point=elementvalue ;
                    if ([point intValue]>0)
                    {
                        app.user.StrUsercurrentpoints=elementvalue ;
                    }
                    
                    //NSLog(@"title - %@",fav.StrTitle);
				}
                else if ([elementname isEqualToString:@"userlavel"])
                {
                    
					app.user.StrUsercurrentlevel=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}
                /*else if ([elementname isEqualToString:@"TotalPointsToDate"])
                {
                    //  AppDelegate *app=(AppDelegate*)[[UIApplication sharedApplication]delegate];  
					app.user.StrUsertotalpoints=elementvalue;
                    //NSLog(@"link - %@",fav.StrLink);
				}*/
				//userlavel
                
            }
			
            
		}
	}
    
	return point;
    
}


-(NSMutableArray *)GetCategory:(NSData *)xmlData
{
    NSMutableArray *arr = [NSMutableArray array];
	CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
	NSArray *nodes = NULL;
	nodes = [doc nodesForXPath:@"/response/categories/category" error:nil];
    if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            CategoryObject *fav=[[CategoryObject alloc]init ];
			for(counter = 0;counter<[node childCount];counter++)
			{
				NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue) {
					//elementname=@"";
				}
				if ([elementname isEqualToString:@"categoryid"]) {
					fav.StrCategoryId=elementvalue ;
				}
				else if ([elementname isEqualToString:@"categoryname"])
                {
					fav.StrCategoryName=elementvalue;
				}
				else if ([elementname isEqualToString:@"categoryimage"])
                {
                    fav.StrCategoryImage=elementvalue;
				}
                else if ([elementname isEqualToString:@"isselected"])
                {
                    if ([elementvalue isEqualToString:@"YES"])
                    {
                        fav.IsSelected=1;
                    }
                    else
                    {
                        fav.IsSelected=0;
                    }
				}
                                
                
			}
			[arr addObject:fav];
            [fav release];
            fav=nil;
		}
	}
	return arr;
    
    
}


/*
-(NSMutableArray *)GetEdit:(NSData *)xmlData:(int)IsEdit
{
    NSMutableArray *arr = [NSMutableArray array];
	CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
	//NSArray *nodes = NULL;
    NSArray *nodes1=NULL;
    nodes1=[doc nodesForXPath:@"/response/record" error:nil];
    if(nodes1)
	{
        for(CXMLElement *node in nodes1)
		{
            
			int counter;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            //listobj *fav=[[listobj alloc]init ];
            NSString *str;
            if (IsEdit==1)
                {
                    for(counter = 0;counter<[node childCount];counter++)
                    {
                        NSString *elementname= [[node childAtIndex:counter]name];
                        NSString *elementvalue=[[node childAtIndex:counter]stringValue];
                        if (!elementvalue) {
                            //elementname=@"";
                        }
                        if ([elementname isEqualToString:@"ID"]) {
                            str=elementvalue ;
                            //NSLog(@"title - %@",fav.StrTitle);
                        }
                    }

            }
            else
            {
                
          			for(counter = 0;counter<[node childCount];counter++)
			{
				NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue) {
					//elementname=@"";
				}
				if ([elementname isEqualToString:@"ID"])
                {
					str=elementvalue ;
                    //NSLog(@"title - %@",fav.StrTitle);
				}
            }
            }
[arr addObject:str];
        }
        
    }
        return arr;
}

    */

/*
-(NSMutableArray *)GetHottopiclist:(NSData *)xmlData
{
    NSMutableArray *arr = [NSMutableArray array];
	CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
	NSArray *nodes = NULL;
    NSArray *nodes1=NULL;
    nodes1=[doc nodesForXPath:@"/rss/channel/item" error:nil];
    if(nodes1)
	{
        for(CXMLElement *node in nodes1)
		{
            
			int counter;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            Channelobject *fav=[[Channelobject alloc]init ];
			for(counter = 0;counter<[node childCount];counter++)
			{
				NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue) {
					elementname=@"";
				}
				if ([elementname isEqualToString:@"title"]) {
					fav.StrTitle=elementvalue ;
                    NSLog(@"title - %@",fav.StrTitle);
				}
				else if ([elementname isEqualToString:@"link"]) {
					fav.StrLink=elementvalue;
                    NSLog(@"link - %@",fav.StrLink);
				}
				else if ([elementname isEqualToString:@"lastBuildDate"])
                {
                    fav.StrGuid=elementvalue;
				}
                else if ([elementname isEqualToString:@"description"])
                {
                    fav.StrDescrption=elementvalue;
				}
                else if ([elementname isEqualToString:@"generator"])
                {
                    fav.StrAuthor=elementvalue;
				}
                else if ([elementname isEqualToString:@"language"])
                {
                    fav.StrCategory=elementvalue;
				}
                
			}
			//[arr addObject:fav];
           // [fav release];
            //fav=nil;
		}
	}

	nodes = [doc nodesForXPath:@"/rss/channel/item" error:nil];
	if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            Channelobject *fav=[[Channelobject alloc]init ];
			for(counter = 0;counter<[node childCount];counter++)
			{
				NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue) {
					elementname=@"";
				}
				if ([elementname isEqualToString:@"title"]) {
					fav.StrTitle=elementvalue ;
				}
				else if ([elementname isEqualToString:@"link"]) {
					fav.StrLink=elementvalue;
				}
				else if ([elementname isEqualToString:@"guid"])
                {
                    fav.StrGuid=elementvalue;
				}
                else if ([elementname isEqualToString:@"description"])
                {
                    fav.StrDescrption=elementvalue;
				}
                else if ([elementname isEqualToString:@"author"])
                {
                    fav.StrAuthor=elementvalue;
				}
                else if ([elementname isEqualToString:@"category"])
                {
                    fav.StrCategory=elementvalue;
				}
                else if ([elementname isEqualToString:@"pubDate"])
                {
                    fav.StrPubDate=elementvalue;
				}
                
                
                
                else if ([elementname isEqualToString:@"eventdate"])
                {
                    fav.StrEventdate=elementvalue;
				}
                else if ([elementname isEqualToString:@"eventtime"])
                {
                    fav.StrTime=elementvalue;
				}
                else if ([elementname isEqualToString:@"short_description"])
                {
                    fav.StrShortdesc=elementvalue;
				}
                
                
			}
			[arr addObject:fav];
            [fav release];
            fav=nil;
		}
	}
    NSLog(@"arr count -%d",[arr count]);
	return arr;
    

}



-(NSMutableArray *)NewGetHottopiclist:(NSData *)xmlData
{
    NSMutableArray *arr = [NSMutableArray array];
	CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
	NSArray *nodes = NULL;
    NSArray *nodes1=NULL;
    nodes1=[doc nodesForXPath:@"/items" error:nil];
    if(nodes1)
	{
        for(CXMLElement *node in nodes1)
		{
            
			int counter;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            Channelobject *fav=[[Channelobject alloc]init ];
			for(counter = 0;counter<[node childCount];counter++)
			{
				NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue) {
					elementname=@"";
				}
                
				if ([elementname isEqualToString:@"title"]) {
					fav.StrTitle=elementvalue ;
                    NSLog(@"title - %@",fav.StrTitle);
				}
				else if ([elementname isEqualToString:@"link"]) {
					fav.StrLink=elementvalue;
                    NSLog(@"link - %@",fav.StrLink);
				}
				else if ([elementname isEqualToString:@"lastBuildDate"])
                {
                    fav.StrGuid=elementvalue;
				}
                else if ([elementname isEqualToString:@"description"])
                {
                    fav.StrDescrption=elementvalue;
				}
                else if ([elementname isEqualToString:@"generator"])
                {
                    fav.StrAuthor=elementvalue;
				}
                else if ([elementname isEqualToString:@"language"])
                {
                    fav.StrCategory=elementvalue;
				}
                
			}
			//[arr addObject:fav];
            // [fav release];
            //fav=nil;
		}
	}
    
	nodes = [doc nodesForXPath:@"/rss/channel/item" error:nil];
	if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            Channelobject *fav=[[Channelobject alloc]init ];
			for(counter = 0;counter<[node childCount];counter++)
			{
				NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue) {
					elementname=@"";
				}
				if ([elementname isEqualToString:@"title"]) {
					fav.StrTitle=elementvalue ;
				}
				else if ([elementname isEqualToString:@"link"]) {
					fav.StrLink=elementvalue;
				}
				else if ([elementname isEqualToString:@"guid"])
                {
                    fav.StrGuid=elementvalue;
				}
                else if ([elementname isEqualToString:@"description"])
                {
                    fav.StrDescrption=elementvalue;
				}
                else if ([elementname isEqualToString:@"author"])
                {
                    fav.StrAuthor=elementvalue;
				}
                else if ([elementname isEqualToString:@"category"])
                {
                    fav.StrCategory=elementvalue;
				}
                else if ([elementname isEqualToString:@"pubDate"])
                {
                    fav.StrPubDate=elementvalue;
				}
			}
			[arr addObject:fav];
            [fav release];
            fav=nil;
		}
	}
    NSLog(@"arr count -%d",[arr count]);
	return arr;
    
    
}

*/
/*-(NSMutableArray *)Getproductlist:(NSData *)xmlData
{
    NSMutableArray *arr = [NSMutableArray array];
	CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
	NSArray *nodes = NULL;
	nodes = [doc nodesForXPath:@"/response/record" error:nil];
	if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
            NSString *str;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            Productobject *fav=[[Productobject alloc]init ];
			for(counter = 0;counter<[node childCount];counter++)
			{
                
                
                
				NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
                str=elementvalue;
							}
			[arr addObject:str];
            [fav release];
            fav=nil;
		}
	}
    
	return arr;

}

-(NSMutableArray *)Getsubproductlist:(NSData *)xmlData
{
    NSMutableArray *arr = [NSMutableArray array];
	CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
	NSArray *nodes = NULL;
	nodes = [doc nodesForXPath:@"/response/record" error:nil];
	if(nodes)
	{
        for(CXMLElement *node in nodes)
		{
            
			int counter;
			//NSLog(@"node count %d",[node childCount]);
            //CategoryOC *cat=[[CategoryOC alloc]init];
            Productobject *fav=[[Productobject alloc]init ];
			for(counter = 0;counter<[node childCount];counter++)
			{
				NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue) {
					elementname=@"";
				}
				if ([elementname isEqualToString:@"product"]) {
					fav.strproductname=elementvalue ;
				}
				else if ([elementname isEqualToString:@"image"]) {
					fav.strurl=elementvalue;
				}
				else if ([elementname isEqualToString:@"islast"])
                {
                fav.strproducttag=elementvalue;
				}
                else if ([elementname isEqualToString:@"description"])
                {
                    fav.strproductdescrption=elementvalue;
				}
                else if ([elementname isEqualToString:@"price"])
                {
                    fav.strproductprice=elementvalue;
				}
                else if ([elementname isEqualToString:@"url"])
                {
                    fav.strweburl=elementvalue;
				}
			}
			[arr addObject:fav];
            [fav release];
            fav=nil;
		}
	}
    
	return arr;
    
}


-(NSMutableArray *)ParseCountryList:(NSData *)xmlData
{
    NSMutableArray *arr = [NSMutableArray array];
	CXMLDocument *doc = [[[CXMLDocument alloc] initWithData:xmlData options:0 error:nil]autorelease];
	NSArray *nodes = NULL;
	nodes = [doc nodesForXPath:@"/countries/country" error:nil];
	if(nodes)
	{
		for(CXMLElement *node in nodes)
		{
            
			int counter;
			Productobject *obj=[[Productobject alloc]init ];
			for(counter = 0;counter<[node childCount];counter++)
			{
				NSString *elementname= [[node childAtIndex:counter]name];
				NSString *elementvalue=[[node childAtIndex:counter]stringValue];
				if (!elementvalue)
				{
					elementname=@"";
				}
				if ([elementname isEqualToString:@"id"]) {
					//obj.globalID=[elementvalue intValue];
                    obj.strpreproduct=elementvalue;
				}
				else if ([elementname isEqualToString:@"country-name"]) {
					obj.strproductname=elementvalue;
				}
				else if ([elementname isEqualToString:@"country-code"]) {
					obj.strproductprice=elementvalue;
				}
				else if ([elementname isEqualToString:@"created-at"]) {
					obj.strurl=elementvalue;
				}
				else if ([elementname isEqualToString:@"updated-at"]) {
					obj.strweburl=elementvalue;
				}
				
				
			}
            
			[arr addObject:obj];
			[obj release];
            obj=nil;
		}
	}
	
	return arr;
}


*/
- (void) dealloc
{
	[super dealloc];
}

@end
