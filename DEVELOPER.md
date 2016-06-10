SamR's SIGCSE-announce Hacks
============================

This repository contains a variety of hacks that Samuel A. Rebelsky
put together in his role as SIGCSE information co-director.  It
includes both code from the "500 bounces per message" era (when he
started in early 2015), the "get rid of old members" eara (when he
got fed up in mid 2016), and beyond.

Important Files
---------------

Membership data from ACM.   Download `.csv` files from
<http://campus.acm.org/public/memstatussig/SearchForm.cfm>.  Use
the Makefile to generate the `.tsv` and `.email` files.

* `data/active-members.{csv,tsv,email}` - 
  The list of active members in various forms.  
* `data/all-members.{csv,tsv,email}` -
  All members (well, past and present, we can't predict future).
* `data/former-members.{csv,tsv,email}` -
  Former members.

Email membership lists from the LISTSERV software.

* `data/sigcse-announce.txt` - subscribers to SIGCSE-announce.
   Get that list by going to 
  <http://listserv.acm.org/SCRIPTS/WA-ACMLPX.CGI?ACTMGR1=SIGCSE-ANNOUNCE>
* `data/sigcse-members.txt` - subscribers to SIGCSE-members.
   Get that list by going to 
  <http://listserv.acm.org/SCRIPTS/WA-ACMLPX.CGI?ACTMGR1=SIGCSE-MEMBERS>

Bounce messages from the listserv (optional)

* `data/bounces.mbox` - Bounce messages in mbox format.
