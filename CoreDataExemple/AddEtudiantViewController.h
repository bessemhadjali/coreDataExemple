//
//  AddEtudiantViewController.h
//  CoreDataExemple
//
//  Created by macbook on 11/06/2017.
//  Copyright © 2017 khiva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface AddEtudiantViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nomTextField;

@property (weak, nonatomic) IBOutlet UITextField *prenomTextField;

@property (weak, nonatomic) IBOutlet UITextField *ageTextField;

@property (strong, nonatomic) NSManagedObjectContext *context;


- (IBAction)saveAction:(id)sender;

- (IBAction)cancelAction:(id)sender;

@end
