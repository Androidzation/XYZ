//
//  Myalert.h
//  Hashly
//
//  Created by puneet on 14/03/13.
//  Copyright (c) 2013 M. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Myalert : UIAlertView
{
	UIActivityIndicatorView *av;
}
-(void)showAlert;
-(void)hideAlert;
@end
