//
//  STEditContact.h
//  contact-2
//
//  Created by kemchenj on 5/11/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <UIKit/UIKit.h>



@class STContactItem;
@class STEditContact;



@protocol STEditContactDelegate<NSObject>

-(void)editContactItem:(STContactItem *)contactItem;

@end



@interface STEditContact : UIViewController

@property (nonatomic, weak) STContactItem *contactItem;
@property (nonatomic, weak) id<STEditContactDelegate> delegate;

@end
