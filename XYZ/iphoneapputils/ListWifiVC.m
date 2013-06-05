//
//  ListWifiVC.m
//  Hashly
//
//  Created by puneet on 29/01/13.
//  Copyright (c) 2013 M. All rights reserved.
//

#import "ListWifiVC.h"
#import "Scanobject.h"
#import "Listcell.h"
#import "WebviewVC.h"
#import "AppConstants.h"
#import "MyAnnotation.h"
#import "ClickableMapAnnotationView.h"
@interface ListWifiVC ()

@end

@implementation ListWifiVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    mymap.hidden=YES;
    app=(AppDelegate*)[[UIApplication sharedApplication]delegate];
  
    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    if (arrListData.count==0)
    {
         [self GetHashtag];
    }
    
}

-(IBAction)GetHashtag
{
    
    utills=[[NetworkUtills alloc]initWithSelector:@selector(ParseResponseOfServerResult:) WithCallBackObject:self];
    
    utills.tag=1;
    NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
    
     [dict setValue:[NSString stringWithFormat:@"%f",app.Currentlocation.coordinate.latitude] forKey:@"lat"];
     [dict setValue:[NSString stringWithFormat:@"%f",app.Currentlocation.coordinate.longitude] forKey:@"long"];
     [dict setValue:@"1" forKey:@"page"];
   // NSString *str=[NSString stringWithFormat:@"[\"ITI\",\"BSNL_AP\"]"];
    //public static String API_AUTHENTICATION_PARAM_USERNAME = "username";
    //public static String API_AUTHENTICATION_PARAM_PASSWORD = "password";
   // NSLog(@"");
   // [dict setValue:str forKey:@"hashtags"];
   // [dict setValue:@"1" forKey:@"page"];
    NSString *strurl=MapData;
    
    [utills GetResponseByASIFormDataRequest:strurl WithDictionary:dict];
    [dict release];
    // [utills GetResponseByASIFormDataRequest:strURL WithDictionary:dict];
    
}




-(void)ParseResponseOfServerResult:(id)sender
{
    NetworkUtills *utill=(NetworkUtills *)sender;
    ////NSLog(@"Utills tag - %d  and response - %@",utills.tag,utills.strResponse);
    switch (utill.tag)
    {
        case 1:
            
            [self ParseHashtagdata:utill.strResponse];
            break;
        case 2:
            
            [self ParseSetUseHistrydata:utill.strResponse];
            break;
        case 3:
            
            [self ParseSafe:utill.strResponse];
            break;
        default:
            break;
    }
    [utill release];
    utill=nil;
    
    
}
-(void)ParseSafe:(NSString *)strResponse
{
    Scanobject *scan=[arrListData objectAtIndex:selected];
   // NSLog(@"safe response %@ ",strResponse);
    if ([strResponse isEqualToString:@"204"])
        
        
    {
        
        [self AfterSafeBrowsing:scan];
      
    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"page is not safe" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Want open",@"Don't open", nil];
        alert.tag=1;
        [alert show];
        [alert release];
    }
}


-(void)ParseSetUseHistrydata:(NSString *)strResponse
{
   // NSLog(@"splash response %@ ",strResponse);
}
//parse data get from api
-(void)ParseHashtagdata:(NSString *)strResponse
{
    //NSLog(@"splash response %@ ",strResponse);
    // NSString *str=[strResponse JSONValue];
    //NSDictionary *dic=[strResponse JSONValue];
    arrListData=[[NSMutableArray alloc] init];
    
    NSArray *arr=[strResponse JSONValue];
    for (int i=0;i<arr.count; i++)
    {
        Scanobject *scan=[[Scanobject alloc] init];
        NSDictionary *dict=[arr objectAtIndex:i];
        scan.type=[dict valueForKey:@"historyType"];
        scan.usedTime=[dict valueForKey:@"usedTime"];
        scan.shortUrl=[dict valueForKey:@"shortUrl"];
        scan.landingUrl=[dict valueForKey:@"landingUrl"];
        scan.tag=[dict valueForKey:@"tag"];
        scan.hashTag=[dict valueForKey:@"hashtags"];
        scan.useCount=[[dict valueForKey:@"useCount"] intValue];
        scan.likeCount=[[dict valueForKey:@"likeCount"] intValue];
        scan.dislikeCount=[[dict valueForKey:@"dislikeCount"] intValue];
        scan.urlId=[[dict valueForKey:@"urlId"] intValue];
       
        scan.StrLatitute=[dict valueForKey:@"latitude"];
        scan.StrLongitute=[dict valueForKey:@"longitude"];
        [arrListData addObject:scan];
      //  NSLog(@"%@    %@     %@    %@",scan.hashTag,scan.type,scan.tag,scan.landingUrl);
        [scan release];
        scan=nil;
        
    }
    
   // NSLog(@"count %d",arrListData.count);
    [tblview reloadData];
    [self SetMap];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"hot topic count -%d",[arrHottopic count]);
    // NSLog(@"main detail -%d",[arrmain count]);
    return [arrListData count];
    
    //return [templatelist count];
    
    
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        static NSString *CellIdentifier = @"Listcell";
        Listcell *cell = (Listcell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier]	;
        if (cell == nil)
        {
            NSArray *toplevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Listcell" owner:nil options:nil];
            for(id currentObject in toplevelObjects)
            {
                if([currentObject isKindOfClass:[UITableViewCell class]])
                {
                    cell = (Listcell *)currentObject;
                    break;
                }
            }
        }
        if ([arrListData count]>0)
        {
            Scanobject *sea=[arrListData objectAtIndex:indexPath.row];
          
            //NSLog(@"Distance i meters: %f", [location1 distanceFromLocation:location2]);
            
            cell.lblTitle.text=sea.hashTag;
            cell.lblAdress.text=sea.tag;
            cell.lblUsedtime.hidden=YES;
            cell.lblLandngurl.hidden=YES;
            cell.lblShoturl.hidden=YES;
                        
             cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
                                   
        }
        return cell;
}


- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[self  AfterLoadCall ];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Scanobject *scan=[arrListData objectAtIndex:indexPath.row];
    
    
    NSUserDefaults *pref1=[NSUserDefaults standardUserDefaults];
    NSString *string =[pref1 valueForKey:@"safebrowsing"];
    if ([string isEqualToString:@"1"])
    {
        utills=[[NetworkUtills alloc]initWithSelector:@selector(ParseResponseOfServerResult:) WithCallBackObject:self];
        
        utills.tag=3;
        //NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
        
        NSString *strurl1=[NSString stringWithFormat:@"https://sb-ssl.google.com/safebrowsing/api/lookup?client=api&apikey=ABQIAAAAUqjPJ0aUwE9DdQzK20se4RTj3oFsoV-Joz32nbbapnVVZxxtSg&appver=1.0&pver=3.0&url=%@",scan.landingUrl];
        
        [utills GetResponseByASIHttpRequest:strurl1];
        
    }
    else
    {
        [self AfterSafeBrowsing:scan];
    }
   


}


-(void)AfterSafeBrowsing:(Scanobject*)scanobj
{
    
    NSUserDefaults *pref=[NSUserDefaults standardUserDefaults];
    NSString *string =[pref valueForKey:@"buildinbrowser"];
    if ([string isEqualToString:@"1"])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:scanobj.landingUrl]];
        
    }
    else
    {
        WebviewVC *web=[[WebviewVC alloc] initWithNibName:@"WebviewVC" bundle:nil];
        web.StrWeburl=scanobj.landingUrl;
        [self.navigationController pushViewController:web animated:YES];
        [web release];
    }

   
    
    
    
    //[dict release];
    
    
    
    
    
    utills=[[NetworkUtills alloc]initWithSelector:@selector(ParseResponseOfServerResult:) WithCallBackObject:self];
    
    utills.tag=2;
 
    NSString *Struserid=[pref valueForKey:@"userid"];
    //[pref setValue:user.userId forKey:@"userid"];
    //[pref synchronize];
    
    NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
    //NSString *str=[NSString stringWithFormat:@"[\"ITI\",\"BSNL_AP\"]"];
    //public static String API_AUTHENTICATION_PARAM_USERNAME = "username";
    //public static String API_AUTHENTICATION_PARAM_PASSWORD = "password";
  //  NSLog(@"");
    if (Struserid)
    {
        [dict setValue:Struserid forKey:@"userId"];
    }
    else
    {
        [dict setValue:@"-1" forKey:@"userId"];
    }
    //[NSString stringWithFormat:@"%f",app.Currentlocation.coordinate.latitude]
    
    [dict setValue:[NSString stringWithFormat:@"%f",app.Currentlocation.coordinate.latitude] forKey:@"latitude"];
    [dict setValue:[NSString stringWithFormat:@"%f",app.Currentlocation.coordinate.latitude] forKey:@"longitude"];
    [dict setValue:scanobj.shortUrl forKey:@"shortUrl"];
    [dict setValue:[NSTimeZone systemTimeZone] forKey:@"timeZone"];
    [dict setValue:scanobj.type forKey:@"type"];
    [dict setValue:[NSString stringWithFormat:@"%d",scanobj.urlId] forKey:@"urlId"];
    NSString * language = [[NSLocale preferredLanguages] objectAtIndex:0];
    [dict setValue:language forKey:@"lang"];
    [dict setValue:scanobj.landingUrl forKey:@"landingPage"];
    [dict setValue:scanobj.hashTag forKey:@"hashtag"];
    [dict setValue:scanobj.tag forKey:@"tag"];
    
    NSString *strurl=setusehistory;
    
    [utills GetResponseByASIFormDataRequest:strurl WithDictionary:dict];
    [dict release];
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
     Scanobject *scan=[arrListData objectAtIndex:selected];
    if (actionSheet.tag==1)
    {
        switch (buttonIndex)
        {
            case 0:
                [self AfterSafeBrowsing:scan];
                break;
                
            default:
                break;
        }
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 70;
    
   	
}

-(IBAction)MapClick
{
    if ([btnMap.currentTitle isEqualToString:@"Map"])
    {
        tblview.hidden=YES;
        mymap.hidden=NO;
        [btnMap setTitle:@"List" forState:UIControlStateNormal];
    }
    else{
        tblview.hidden=NO;
        mymap.hidden=YES;
        [btnMap setTitle:@"Map" forState:UIControlStateNormal];
    }
    
}
- (void)SetMap
{
    [super viewDidLoad];
    MKCoordinateSpan span;
    span.latitudeDelta=0.2;
    span.longitudeDelta=0.2;
    annotationArrray=[[NSMutableArray alloc] init];
    CLLocationCoordinate2D location;
    for (int i=0; i<[arrListData count]; i++)
    {
        NSString *strTitle=@"";
        NSString *strSubtilte=@"";
        
        
        Scanobject  *sea=[arrListData objectAtIndex:i];
        location.latitude=[sea.StrLatitute doubleValue];
        location.longitude=[sea.StrLongitute doubleValue];
        strTitle=sea.hashTag;
        strSubtilte=sea.tag;
        
        
        
        
        //NSLog(@"lat %f  long %f",location.latitude,location.longitude);
        //Add the annotation to our map view
        MyAnnotation *newAnnotation = [[MyAnnotation alloc] init];
        newAnnotation.title=strTitle;;
        newAnnotation.subtitle=strSubtilte;
        newAnnotation.AnnotationID=i;
        // MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location, 1500, 1500);
        newAnnotation.coordinate = location;
        [annotationArrray addObject:newAnnotation];
        
        //[mymap setRegion:region animated:YES];
        //[mymap selectAnnotation:newAnnotation animated:YES];
        [mymap addAnnotation:newAnnotation];
        
        
    }
    
    MKCoordinateRegion region = [self regionToFitAnnotations:annotationArrray];
    [mymap setRegion:region animated:YES];
    //[mymap rel]
    // }
    //[self.view addSubview:mapDisplayView];
    // Do any additional setup after loading the view from its nib.
}

- (MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:(id<MKAnnotation>)annotation
{
    // NSLog(@"View For Annotation Called");
    // MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"currentloc"];
    //UIImage *pinIconImg =[[UIImage imageNamed:@"bluepin.png"] retain];
    
    ClickableMapAnnotationView *annView;
    if([annotation isKindOfClass:[MyAnnotation class]])
    {
        MyAnnotation *ann = (MyAnnotation *)annotation;
        
        
        annView=[[ClickableMapAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"message"];
        annView.delegate = self;
        // annView.pinClicked = @selector(annotationViewClicked:);
        UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [button addTarget:self action:@selector(detailDiscolosureIndicatorSelected:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = ann.AnnotationID;
        //annView.pinColor = MKPinAnnotationColorGreen;
        annView.rightCalloutAccessoryView = button;
        [annView setSelected:NO];
        [annView setEnabled:YES];
        [annView setCanShowCallout:YES];
        CGSize sizeText = [annotation.title sizeWithFont:[UIFont fontWithName:@"HelveticaNeue" size:12] constrainedToSize:CGSizeMake(150, CGRectGetHeight(annView.frame)) lineBreakMode:UILineBreakModeTailTruncation];
        //UILabel *lblTitolo = [[UILabel alloc] initWithFrame:CGRectMake(2,2,150,sizeText.height)];
        //lblTitolo.text = @"puneet";
        //lblTitolo.lineBreakMode = UILineBreakModeTailTruncation;
        //lblTitolo.numberOfLines = 10;
        // annView.leftCalloutAccessoryView = lblTitolo;
        //[lblTitolo release];
        annView.image = [UIImage imageNamed:@"ic_launcher.png"];
        /* MyAnnotation *ann = (MyAnnotation *)annotation;
         UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
         [button addTarget:self action:@selector(detailDiscolosureIndicatorSelected:) forControlEvents:UIControlEventTouchUpInside];
         NSInteger btag;
         // btag = [ann.IndexNumber integerValue];
         btag=ann.AnnotationID;
         button.tag = btag;
         // ann.rightCalloutAccessoryView = button;
         // ann.pinColor=MKPinAnnotationColorGreen;
         annView.rightCalloutAccessoryView = button;
         UIImageView *img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_launcher.png"]];
         img.frame=CGRectMake(100, 100, 40, 40);
         //annView=(MKPinAnnotationView*)img;
         annView.pinColor=MKPinAnnotationColorRed;*/
        
        
        
    }
    
    [annView setSelected:NO];
    [annView setEnabled:YES];
    [annView setCanShowCallout:YES];
    return annView;
    
}


-(IBAction)detailDiscolosureIndicatorSelected:(id)sender
{
    UIButton *button = (UIButton *)sender;
    Scanobject *scan=[arrListData objectAtIndex:button.tag];
    
    
    
    NSUserDefaults *pref1=[NSUserDefaults standardUserDefaults];
    NSString *string =[pref1 valueForKey:@"safebrowsing"];
    if ([string isEqualToString:@"1"])
    {
        utills=[[NetworkUtills alloc]initWithSelector:@selector(ParseResponseOfServerResult:) WithCallBackObject:self];
        
        utills.tag=3;
        //NSMutableDictionary *dict=[[NSMutableDictionary alloc] init];
        
        NSString *strurl1=[NSString stringWithFormat:@"https://sb-ssl.google.com/safebrowsing/api/lookup?client=api&apikey=ABQIAAAAUqjPJ0aUwE9DdQzK20se4RTj3oFsoV-Joz32nbbapnVVZxxtSg&appver=1.0&pver=3.0&url=%@",scan.landingUrl];
        
        [utills GetResponseByASIHttpRequest:strurl1];
        
    }
    else
    {
        [self AfterSafeBrowsing:scan];
    }
    
    
   	
	
}
-(MKCoordinateRegion)regionToFitAnnotations:(NSMutableArray *)annotations
{
	// NSLog(@"RLat :%f, RLong : %f",self.myLocation.coordinate.latitude,self.myLocation.coordinate.longitude);
	//MyAnnotation
    // set min and max for two points
	double nwlatitude = -90;
	double nwlongitude = 180;
	double selatitude = 90;
	double selongitude = -180;
    CLLocationCoordinate2D northWest;
    CLLocationCoordinate2D southEast;
	northWest.latitude = nwlatitude;
	northWest.longitude = nwlongitude;
	southEast.latitude = selatitude;
	southEast.longitude = selongitude;
	MKCoordinateRegion region;
	if(annotations.count > 1)
	{
		for(id annotation in annotations)
		{
			MyAnnotation *ann = (MyAnnotation *)annotation;
			northWest.longitude = fmin(northWest.longitude, ann.coordinate.longitude);
			northWest.latitude = fmax(northWest.latitude, ann.coordinate.latitude);
			
			southEast.longitude = fmax(southEast.longitude, ann.coordinate.longitude);
			southEast.latitude = fmin(southEast.latitude, ann.coordinate.latitude);
		}
		region.center.latitude = (northWest.latitude + southEast.latitude) / 2.0;
		region.center.longitude = (southEast.longitude + northWest.longitude) / 2.0;
		// add padding in each direction
        //		region.span.latitudeDelta = fabs(northWest.latitude - southEast.latitude) * 1.1;
        //		region.span.longitudeDelta = fabs(southEast.longitude - northWest.longitude) * 1.1;
        region.span.latitudeDelta = fabs(northWest.latitude - southEast.latitude) * 1.3;
		region.span.longitudeDelta = fabs(southEast.longitude - northWest.longitude) * 1.3;
	}
	else if(annotations.count == 1)
	{
		id annotation = [annotations objectAtIndex:0];
		if(annotation)
		{
			MyAnnotation *ann = (MyAnnotation *)annotation;
			region.center.latitude = ann.coordinate.latitude;
			region.center.longitude = ann.coordinate.longitude;
			// add padding in each direction
            //NSLog(@"lat delta %.5f long delta %.5f", mapView.region.span.latitudeDelta, mapView.region.span.longitudeDelta);
			region.span.latitudeDelta = mymap.region.span.latitudeDelta;
			region.span.longitudeDelta = mymap.region.span.longitudeDelta;
		}
	}
	else
	{
        region.center=mymap.centerCoordinate;
		region.span.latitudeDelta = .08;
		region.span.longitudeDelta = .08;
	}
	// NSLog(@"region lat : %f, lon : %f",region.center.latitude,region.center.longitude);
    return region;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
