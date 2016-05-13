//
//  STAddContact.h
//  Contact
//
//  Created by kemchenj on 5/10/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <UIKit/UIKit.h>



@class STContactItem;



@protocol STAddContactDelegate <NSObject>

- (void)addContactItem:(STContactItem *)contactItem;

@end



@interface STAddContact : UIViewController

@property (nonatomic, weak) id <STAddContactDelegate> delegate;

@end
