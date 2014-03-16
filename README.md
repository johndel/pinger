Pinger
======

#### Description
A simple site checker to see if your site is down. It checks periodically every minute.

#### How to use it
Open pinger.rb, change on line 4 the **@yoursite** variable with your site you want to monitor and run the script with **ruby pinger.rb**. You can add it as a background job by
running **ruby pinger.rb &** or you can also create a bash script to daemonize it. For changing the time it will run the check, change line 27 where is the sleep.

#### What is does
It is pretty simple, it checks if your site returns 200 http request. If it won't, it means that either you don't have internet or your site is down. 
So it runs the write_log method and checks if you have access to google, if you have a valid 301 request then your site is down, if you don't then it means you don't have internet.
Finally it writes on disconnect.log the time of the incident and what happened.

#### Future
I may create a method for sending an email when your site is down. 


