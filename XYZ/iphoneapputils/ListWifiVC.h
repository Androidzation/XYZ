//
//  ListWifiVC.h
//  Hashly
//
//  Created by puneet on 29/01/13.
//  Copyright (c) 2013 M. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppConstants.h"
#import "AppDelegate.h"
@interface ListWifiVC : UIViewController<UITableViewDataSource,UITableViewDelegate,MKMapViewDelegate>
{
    NetworkUtills *utills;
    NSMutableArray *arrListData;
    IBOutlet UITableView *tblview;
    AppDelegate *app;
    int selected;
    NSMutableArray *annotationArrray;
    IBOutlet MKMapView *mymap;
    int type;
    IBOutlet UIButton *btnMap;
}
@end
