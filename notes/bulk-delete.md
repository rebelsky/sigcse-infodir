SamR's SIGCSE-announce Hacks
============================

This directory contains a variety of hacks that Sam put together as we
started to deal with the 500+ errors per message to SIGCSE-announce.

Setup
-----

Many of the things we do rely on the existance of a variety of files
that we need to download from various places.  Here are the ones I
remember:

1. Download the list of active members from campus.acm.org and save
   as `active-members.csv`

2. Download the list of former members from campus.acm.org and save
   as `former-members.csv`

3. Download the list of all members (active and former) from campus.acm.org 
   and save as `all-members.csv`

4. Save the list of sigcse-announce members to `sigcse-announce.txt`.
   You can get that list by going to 
   <http://listserv.acm.org/SCRIPTS/WA-ACMLPX.CGI?ACTMGR1=SIGCSE-ANNOUNCE>
   and clicking on "Review List Members: In Browser" (or via email)

5. Save the list of sigcse-members members to `sigcse-members.txt`.

6. Download/save a set of email messages containing error reports in a 
   text file.  These will be used to determine what addresses get processed
   in following steps.

7. Update MBOX in the Makefile to point to that file.

Processing
----------

* Run `make`.  It will create four files from the things you've
  downloaded: `active-members.email`, `all-members.email`, 
  `former-members.email`, and `bounces.email`.  Those get used by some 
  of the following steps.

* Run `./process-bounces`.  It will run through `bounces.email`
  and create three files
    * `a.follow.txt` - A list of email addresses that are generating
      an error report and that correspond to current/active members.
    * `b.remove.txt` - A list of email addresses that are generating
      an error report and are former members.  You should be able to
      delete all of those addresses.
    * `c.byhand.txt` - A list of email addresses that are generating
      an error report but that appear in neither the current/active nor
      former lists.  These are usually people who have changed their
      email address in some places, but not others.

* For anyone in `c.byhand.txt`, you probably need to do some followup
  work by hand (or write another program that I'm too lazy to write).
  You can use `looup` to look up some additional information that may
  help with your processing.

Bulk Removal
------------

* Create a file of email addresses to remove (e.g., `b.remove.txt`, which
  was created above).
* Go to "Subscriber Management" in the listserv page.
* Click on "Bulk Operations".
* Click on "Remove the imported addresses from SIGCSE-ANNOUNCE; do not add any subscribers."
* Click on "Choose File" and choose your file.
* Click on "Import" and cross your fingers.

Note that this operation seems to deal fine with email addresses that are
not in the list, so it's okay if you try to re-remove someone.
