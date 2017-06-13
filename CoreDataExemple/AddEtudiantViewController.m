//
//  AddEtudiantViewController.m
//  CoreDataExemple
//
//  Created by macbook on 11/06/2017.
//  Copyright © 2017 khiva. All rights reserved.
//

#import "AddEtudiantViewController.h"

@interface AddEtudiantViewController ()

@end

@implementation AddEtudiantViewController
@synthesize nomTextField,prenomTextField,ageTextField, context;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ageTextField.keyboardType=UIKeyboardTypeNumberPad;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Core Data Methods

- (NSManagedObjectContext *)managedObjectContext {
    
    context = nil;
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if ( appDelegate.persistentContainer.viewContext ) {
        
    context=appDelegate.persistentContainer.viewContext;
        
    }
    
    return context;
}

- (void)saveName:(NSString*)nom prenom:(NSString*)prenom age:(NSString*)age{
    
    // Create a new managed object
    context = [self managedObjectContext];
    
    // Save the object to persistent store
    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Etudiant" inManagedObjectContext:context];
   // NSInteger *ageInteger=[age integerValue];
    [newDevice setValue:nom forKey:@"nom"];
    [newDevice setValue:prenom forKey:@"prenom"];
   // [newDevice setValue:ageInteger forKey:@"age"];
    
    NSInteger valueOne = [age integerValue];
    [newDevice setValue:@(valueOne) forKey:@"age"];
    
    // Afficher erreur en cas de probleme
    NSError *error = nil;
    
    if (![context save:&error]) {
        
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
        [self alertStatus:@"Erreur!" erreurMsg:@"Impossible de sauvgarder"];
    }
    
    // Dismiss viewController when the action finished
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - view Actions

- (IBAction)saveAction:(id)sender {
    
    [self saveName:nomTextField.text prenom:prenomTextField.text age:ageTextField.text];
    
    
}

- (IBAction)cancelAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Alert Method


-(void)alertStatus:(NSString*)alertTitle erreurMsg:(NSString*)msg {
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:alertTitle
                                          message:msg
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       
                                   }];
    
    [alertController addAction:cancelAction];
    
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
