perl-Tombola
============

A raffle application where entrants enter using SMS.

Installation
------------

    git clone https://github.com/mrallen1/perl-Tombala
    cpanm --installdeps . 

Twilio credentials
------------------

You will need to signup for a developer account with Twilio.  If you want to accept
text messages from non-verified phone numbers, you will have to get a paid account.

Configuration
-------------

The `tombola` script expects a configuration file in your home directory named `.tombola`.

The format of this file is as follows:
```
[twilio]
sid = AC1234567890
auth = tokenabcdef
sms_from = +15557654321
[entry]
name = event
```

Usage
-----

The "usual" (perhaps even the "right") way to write an application like this
would be to set up a web application that responds to POST callbacks from the
Twilio service.

The way this script works is a little bit different.  It queries the Twilio
SMS endpoint and requests all of the messages received on (or after) today
and then it deduplicates them by inserting newly seen phone numbers
into a perl hash. (The value of the phone number key is the full data 
structure from Twilio.)

The perl hash is then serialized to disk using [Storable](https://metacpan.org/dist/Storable).

To choose a winning number, the script updates its database, and then excludes
previous winners, shuffles the list of remaining entries and picks the first one.
That winning phone number gets an SMS reply and the winner's number is printed
to STDOUT.

And the database is updated with the information that the winner's phone number
was selected so it can't be selected again. 

If there are no entries or no remaining non-winners, the application dies.

License
-------
Copyright (C) 2013 Mark Allen

This is free software; you can redistribute it and/or modify it under the same
terms as the Perl 5 programming language system itself.
