perl-Tombola
============

A raffle application where entrants enter using SMS.

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


