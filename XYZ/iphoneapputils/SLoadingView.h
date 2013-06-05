//
//  SLoadingView.h
//  Alhayat
//
//  Created by puneet on 8/21/12.
//  Copyright (c) 2012 Testingxyz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLoadingView : UIView
{
    NSString *title;
    //int tag;
    UILabel *lblTitle;
}
@property(nonatomic,retain) NSString *title;
//@property int tag;
-(void)show;
-(void)hide;

@end
