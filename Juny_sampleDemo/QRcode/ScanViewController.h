//
//  ScanViewController.h
//  Juny_ERAndMatixCode
//
//  Created by 宋俊红 on 17/3/31.
//  Copyright © 2017年 Juny_song. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@class ScanViewController;
@protocol ScanViewControllerDelegate <NSObject>

- (void)scanViewController:(ScanViewController *)scanVC result:(NSString *)result;

@end
@interface ScanViewController : UIViewController

@property (nonatomic, weak) id <ScanViewControllerDelegate> delegate;//代理
@end
