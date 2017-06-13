//
//  EtudiantsViewController
//  CoreDataExemple
//
//  Created by macbook on 11/06/2017.
//  Copyright © 2017 khiva. All rights reserved.
//

#import "EtudiantsViewController.h"

@interface EtudiantsViewController ()

@end

@implementation EtudiantsViewController
@synthesize studentsTableView, etudiantsArray, context;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    studentsTableView.delegate=self;
    
    studentsTableView.dataSource=self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated{
    
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Etudiant"];
    etudiantsArray = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    [self.studentsTableView reloadData];

}

- (NSManagedObjectContext *)managedObjectContext
{
    /*NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;*/
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if ( appDelegate.persistentContainer.viewContext ) {
        
        context=appDelegate.persistentContainer.viewContext;
        
    }
    
    return context;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.etudiantsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSManagedObject *etudiant = [self.etudiantsArray objectAtIndex:indexPath.row];
    [cell.textLabel setText:[NSString stringWithFormat:@"%@ %@", [etudiant valueForKey:@"nom"], [etudiant valueForKey:@"prenom"]]];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@",[etudiant valueForKey:@"age"]]];
    //[NSString stringWithFormat:@"%@",[etudiant valueForKey:@"age"]];
    
    return cell;
}


@end
