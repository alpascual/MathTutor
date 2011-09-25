//
//  ScoreTableList.m
//  MathTutor
//
//  Created by Albert Pascual on 9/22/11.
//  Copyright 2011 Al. All rights reserved.
//

#import "ScoreTableList.h"

@implementation ScoreTableList

@synthesize Userlist, buttonClose;
@synthesize tableView;

/*- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}*/

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    if (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad)
    {
        UIBarButtonItem *button = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(closePressed:)] autorelease];
        
        self.navigationItem.title = @"Some title";
        self.navigationItem.leftBarButtonItem = button;
    }

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSString *myRequestString = [[NSString alloc] initWithString:@"http://score.alsandbox.us/Home/List?app=math"];
    
    NSURL *urlToOpen = [[NSURL alloc] initWithString:myRequestString];
    
    NSURLRequest *aReq = [NSURLRequest requestWithURL:urlToOpen];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:aReq returningResponse:nil error:nil];
    NSString *get = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    
    NSLog(@"request replied %@", get );
    
    //Parse get to a list of mutable array
    NSRange firstRange = [get rangeOfString:@","];
    
    self.Userlist = [[[NSMutableArray alloc] init] autorelease];
    
    if ( firstRange.length > 0 )
    {
        NSArray *chunks = [get componentsSeparatedByString: @","];
        
        for (NSString *t in chunks) 
        {
            [self.Userlist addObject:t];
        }
    }
    
    [get release];
    [myRequestString release];
    
    self.tableView.delegate = self;
    
    //[self.tableView reloadData];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"Returning num sections");
    
    /*if ( self.Userlist == nil )
    {
        return 0;
    }*/
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ( self.Userlist == nil )
    {
        return 0;
    }
    
    return [self.Userlist count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSUInteger row = [indexPath row]; 
    
    NSString *anObject = [self.Userlist objectAtIndex:row];
    NSLog(@"object in %d is %@", row, anObject);
    
    /*NSRange startRange = [anObject rangeOfString:@"|"];
    if ( startRange.length > 0 )
    {
        NSArray *fields = [anObject componentsSeparatedByString: @"|"];        
        cell.textLabel.text = [fields objectAtIndex:1];
        cell.detailTextLabel.text = [fields objectAtIndex:0];
    }*/
    
    
    cell.textLabel.text = anObject;
    
    NSLog(@"Returning cell");
        
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

- (IBAction)closePressed:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

@end
