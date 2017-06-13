//
//  EtudiantsViewController.h
//  CoreDataExemple
//
//  Created by macbook on 11/06/2017.
//  Copyright © 2017 khiva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface EtudiantsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *studentsTableView;

@property(strong, nonatomic) NSMutableArray *etudiantsArray;

@property (strong, nonatomic) NSManagedObjectContext *context;


@end

