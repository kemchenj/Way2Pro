//
//  STAddContact.h
//  Contact
//
//  Created by kemchenj on 5/10/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <UIKit/UIKit.h>



@class STContactItem;
@class STAddContact;



@protocol STAddContactDelegate <NSObject>

- (void)contactViewController:(STAddContact *)addContact contactItem:(STContactItem *)contactItem;

@end



@interface STAddContact : UIViewController

@property (nonatomic, weak) id <STAddContactDelegate> delegate;

@end
