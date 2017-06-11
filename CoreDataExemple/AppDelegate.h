//
//  AppDelegate.h
//  CoreDataExemple
//
//  Created by macbook on 11/06/2017.
//  Copyright © 2017 khiva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

