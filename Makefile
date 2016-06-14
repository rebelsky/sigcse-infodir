# SIGCSE.infodir/lists/Makefile
#   Various things I play with as part of the SIGCSE infodir 
#   activities.

# +--------+---------------------------------------------------------
# | Macros |
# +--------+

# How we extract email from a tsv file created from campus.acm.org
CAMPUS_EMAIL = cut -f9 $^ | sed 1d | tr [:upper:] [:lower:] | sort -u > $@

# Where to look for all the bounced mail
MBOX = data/bounces.mbox

# All of the fun lists of email addresses to make
EMAIL_FILES = \
	data/active-members.email \
	data/all-members.email \
	data/former-members.email \
	data/bounces.email 

# All of the fun list of expired accounts
EXPIRED_FILES = \
	tmp/sigcse-members.txt \
	tmp/sigcse-members-unknown.txt \
	tmp/sigcse-members-expired.txt \
	tmp/sigcse-announce.txt \
	tmp/sigcse-announce-unknown.txt \
	tmp/sigcse-announce-expired.txt

# +-------+----------------------------------------------------------
# | Rules |
# +-------+

%.tsv: %.csv
	csv2tsv < $^ > $@

# +---------+--------------------------------------------------------
# | Targets |
# +---------+

# Default target
default: $(EMAIL_FILES) data/*.tsv

# Things for exploring expired accounts
expired-accounts: $(EXPIRED_FILES)

data/active-members.email: data/active-members.tsv
	$(CAMPUS_EMAIL)
data/all-members.email: data/all-members.tsv
	$(CAMPUS_EMAIL)
data/former-members.email: data/former-members.tsv
	$(CAMPUS_EMAIL)

data/bounces.email: $(MBOX)
	grep "Final-Recipient" $(MBOX) \
		| sed -e 's/^.*; *//' -e 's/[<>]//g' \
		| tr [:upper:] [:lower:] \
                | grep '@' \
		| sort -u \
		> $@

tmp/sigcse-members.txt: expired data/sigcse-members.txt
	./expired < data/sigcse-members.txt > $@
tmp/sigcse-announce.txt: expired data/sigcse-announce.txt
	./expired < data/sigcse-announce.txt > $@
tmp/sigcse-members-unknown.txt: tmp/sigcse-members.txt
	grep UNKNOWN $^ > $@
tmp/sigcse-members-expired.txt: tmp/sigcse-members.txt
	grep -v UNKNOWN $^ > $@
tmp/sigcse-announce-unknown.txt: tmp/sigcse-announce.txt
	grep UNKNOWN $^ > $@
tmp/sigcse-announce-expired.txt: tmp/sigcse-announce.txt
	grep -v UNKNOWN $^ > $@
