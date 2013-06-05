//
//  ClickableMapAnnotationView.h
//  DangerousWatersTV
//
//  Testingxyz on 6/15/12.
//  Copyright (c) 2012 Testingxyz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ClickableMapAnnotationView : MKAnnotationView {
    
    SEL pinClicked;
    id delegate;
}

@property(nonatomic, assign) SEL pinClicked;
@property(nonatomic, assign) id delegate;

@end

