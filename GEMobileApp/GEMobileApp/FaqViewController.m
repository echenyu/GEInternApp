//
//  FaqViewController.m
//  GEMobileApp
//
//  Created by Sumeet Ranu on 6/30/15.
//  Copyright (c) 2015 EricYu. All rights reserved.
//

#import "FaqViewController.h"

@interface FaqViewController ()
@property (weak, nonatomic) IBOutlet UITextView *faqTextView;

@end

@implementation FaqViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // for scroll view
    [self setup];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setup {
    [self.faqTextView setScrollEnabled:YES];
    [self.faqTextView setText:@"FREQUENTLY ASKED QUESTIONS \n\n1. If my drive is less than 400 miles one way, can I still get reimbursed for mileage? \n\n Yes, you need to note the miles on the T&L form and include the MapQuest map. \n\n2. Can I fly to my work location, buy a car, then drive home and get mileage reimbursement? \n\nYou must get approval from Kim Demko PRIOR to this situation. You must also then provide proof of registration and sale/purchase receipt for the automobile that is in your name.  Mileage would be reimbursed AFTER your return trip home once you provide all fuel receipts. \n\n3. Can I take the Auto Train and still claim mileage the whole distance and/or the auto train reimbursement? \n\nAuto Trains are not reimbursed at any time. We do not reimburse for shipment of automobiles.\n\n4. Can I purchase a one way airline ticket to my worksite and then purchase another one way ticket later in my rotation since I don't have an end date? \n\nAll end date choices are on the Co-op/Intern Site, please choose one prior to making your round trip airfare purchase. \n\n5. Can I get $35.00 a day for meals even if I only purchased $20.00 in meals? \n\nNo, it is not a per diem, it is the max we allow for daily meals. \n\n6. Can I provide a credit card billing statement for fuel, food or hotel receipts? \n\nNo, it must be a copy of the itemized receipt(s) that show the item, date and city of purchase. \n\n7. Can I get reimbursed in advance for my baggage fees, hotels or tolls for my return trip? \n\nNo, we must have paid receipts for those items. \n\n8. If my friend or family member drives with me to my worksite, can I get reimbursed for their meal/hotel costs?  \n\nNo, GE only reimburses items that the employee incurs. \n\n9. Can I submit a T&L form for reimbursement if it is more than 2 weeks past my end date? \n\nNo, due to accounting practices, we are not able to process 2 weeks past your end date.\n\n10. If for any reason I have to leave my rotation sooner than the expected end date, do I still get to keep the full T&L reimbursement? \n\nNo, it will be pro-rated for the actual weeks that you were working.  Payroll would send you an overpayment letter for the recoupment of funds.\n\n11. If I am unsure IF an item can be reimbursed, what should I do? \n\nPRIOR to making any travel reservations or actually traveling, you must email the T&L mailbox at Aviation.CoopTLforms@ge.com to get approval. Please remember to keep a copy of the Guidelines, FAQ’s and the T&L form for future use once you return home/school. Anything not included in the above guidelines and/or FAQ’s, will not be reimbursed without PRIOR APPROVAL from the Always remember, if you willingly provide false information, it is in direct violation of the GE Integrity Policy and you are placing your internship and/or future positions with GE Aviation in jeopardy. "
     
/*
     
ITLP
 Housing:

              How many locations are there in the area and how many interns will be assigned to each
     
     o    GE has several locations around the Cincinnati area. Where you sit will be determined by the team you end up on. Please note, all of these locations are fairly close to each other! There will be lots of opportunities to get together with other interns as part of the ITLP
     
     sponsored events. In addition, we will do our best to pair them with a buddy that is close to
     
              How does GE help you find housing?
     
     o    http://supportcentral.ge.com/products/sup_products.asp?prod_id=258136 -- This is a
     
     link to the GE Aviation EID Homepage. They will provide some recommended housing
     
              When do housing arrangements have to be made by? Specifically for GE Aviation in Cincinnati.
     
     o    This timing is really up to you! Feel free to start networking with your peers if you want to
     
     be roommates. Be sure to check back on the link I provided above for housing
     
     o    At this point in time we do not have official start dates. This particular task is handled and
     
     communicated through GE Aviation’s EID Office – not the
     
              How can we expect to be notified? Who do we contact with any issues regarding this date?
     
     o    Everyone will receive information from the EID Office in the coming months laying out
     
     everything you need to know for a successful start and first day with GE. Any issues should
     
     be handled through EID directly. The EID team here at GE is extremely good at what they do!
     
              Will we be working with any other Interns within a project? If so, about how many?
     
     o    You may have other interns on your team or within your organization however, you will
     
     have your own goals and deliverables you will be expected to deliver. There may be some
     
     opportunities to work with other interns on group projects both inside and outside of the
     
              Expectations for types of projects interns
     
     o    You won't be retrieving coffee all summer :) All projects that interns work on are
     
     meaningful and impactful to the business. Most projects will provide you a flavor of both
     
     project management as well as technical skills. Some examples include: requirements
     
     gathering, new technology introductions, process automation, portal design and creation, just
     
     o    Melissa will look at each resume and role and try to pair you to a role based on your
     
     skillsets. GE is known for stretching their employees into roles they may not be 100%
     
     comfortable in, so don't be surprised if you are placed in something you have never heard of!
     
     o    Each of you will be placed into one of our many CIO organizations. Within an organization
     
     there are many teams and you will fall within one of those.
     
              What kind of projects do ITLP participants work on?
     
     o    Aside from your assignment work, you will also participate in ITLP intern committees. This
     
     is a great way to network amongst each other and learn more about GE!
     
     o    GE is a professional setting and we follow a business casual dress code – dress shirts, slacks, and
     
     work polos are appropriate for men and slacks, blouses, etc. are appropriate for women.  There’s no need
     
     for men to wear ties or women to wear dresses. We promise!
     
              What can we expect from a day-to-day standpoint?
     
     o    As far as a ‘typical’ day goes a lot will depend on the specific project you will be working on and how
     
     your Assignment Leader advises you to approach the work. (see Assignments for more specific details)
     
     o    Expectations are for everyone to work onsite during normal business hours (8am – 5pm) and to
     
     conduct yourself in a professional manner. Some teams may work slightly different hours than others.
     
     This would be a great topic to discuss with Assignment Leaders on day 1 
     
              What steps do I take if I have further questions?
     
     o    Any questions related to business etiquette can be discussed upfront with your Assignment Leader or
     
     your ITLP Buddy – these individuals are here to help and have been ‘in your shoes’ before.
     
              What type of mentoring can I expect during my summer with GE?
     
     o    Everyone involved with the ITLP Program wants to make sure you get the absolute most 
     
     out of your time here – mentoring is a huge part of that. Every intern will have an ITLP Buddy 
     
     assigned to them. This Buddy is a current on-program ITLP and acts as someone who can 
     
     help guide you through a successful summer and offer valuable advice or coaching along the 
     
              Will mentoring stop at my ITLP Buddy?
     
     o    Mentoring should not stop at your assigned Buddy, however. Everyone you work with 
     
     throughout the summer including: Melissa Schalmo, your Assignment Leader, and more will 
     
     be more than willing to offer advice and coaching – you just have to be willing to ask"*/];
    self.faqTextView.editable = NO;
    

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
