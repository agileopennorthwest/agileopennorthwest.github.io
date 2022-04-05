---
layout: default
page-class: organization-page
image: /img/circle.jpg
virtual-conference: true
theme: Agile is Art
date: March 28-30, 2022
date-modifier: (4 hours each day)
year: 2022
venue: AONW 2022 was 100% virtual!
citystate: 
anniversary: 16th
cost: 60
attendees: 250
reg-url: https://buytickets.at/agileopennorthwest/610747
reg-service: TicketTailor # one of: Eventbrite TicketTailor
conf-status: finished # one of: coming_soon, reg_starting_on, reg_open, waitlist, finished

last-notes-url: https://drive.google.com/drive/folders/1TzpST9NK_bWaYOG3h3N5R6TcZ76Tcr5q?usp=sharing
prev-year: 2022
prev-city: Seattle

next-year: 2023

---

<h1 id="about_us">Agile Open Northwest <small></small></h1>

<div class="banner homepage-banner">
  <img src="/img/circle.jpg" class="background"/>
  <div class="darken"></div>
  <div class="words">
  {% if page.conf-status == 'finished' %}
    <div class="attention big-message">We Hope You Enjoyed</div>
  {% else %}
    <div class="attention big-message">Please Join Us For</div>
  {% endif %}
    <div class="event-title">Agile Open Northwest {{ site.years[0] }}</div>
    <div class="spacer"> </div>
    <div class="date">{{page.date}}</div>
    <div>{{page.venue}}</div>
    <div>{{page.citystate}}</div>
    <div class="spacer"> </div>

{% case page.conf-status %}
{% when 'coming_soon' %}
<a href="" class="btn btn-primary">Registration Opens Soon - Please Check Back!</a>
{% when 'reg_starting_on' %}
<a href="" target="_blank" class="btn btn-primary">Stay Tuned - Registration Opens Today at 11:16 am!</a>
{% when 'reg_open' %}
<a href="{{ page.reg-url }}" target="_blank" class="btn btn-primary">Register now!</a>
{% when 'waitlist' %}
<a href="{{ page.reg-url }}" target="_blank" class="btn btn-primary">Registration full - click here to join the Waitlist</a>
{% when 'finished' %}
<a href="" class="btn btn-primary">All Finished!</a>
{% endcase %}

   {% if site.show-upcoming-year %}
     <a href="/{{ site.years[0] }}">View Event Details</a>
   {% endif %}
  </div>
  <div class="attribution">&copy; 2015 STEVEN SMITH</div>
</div>

<!--<div class="banner homepage-banner">-->
  <!--<img src="/img/circle.jpg" class="background"/>-->
  <!--<div class="darken"></div>-->
  <!--<div class="words">-->
    <!--<div class="attention big-message">MOST RECENT EVENT</div>-->
    <!--<div class="event-title">Open Agile Management</div>-->
    <!--<div class="spacer"> </div>-->
    <!--<div class="date">Friday September 16th, 2016</div>-->
    <!--<div>AXIS Pioneer Square</div>-->
    <!--<div>308 1st Ave South, Seattle WA 98104</div>-->
    <!--<div class="spacer"> </div>-->
    <!--<p align="center"><a href="{{ site.next-other-event-url }}" class="btn btn-primary">Event Page</a></p>-->
  <!--</div>-->
  <!--<div class="attribution">&copy; 2015 STEVEN SMITH</div>-->
<!--</div>-->

{% if page.conf-status != 'finished' %}
<p>Agile Open Northwest is proud to present our {{page.anniversary}} Annual AONW conference 
on {{page.date}} {{page.date-modifier}}<!--at the {{page.venue}} in {{page.citystate}}-->. 
The theme this year is "{{page.theme}}." We are dedicated to a low-cost conference, and are pleased to hold the rate to only 
${{page.cost}} (plus {{page.reg-service}} fees) for the 3-day event. 
</p>
<p>
This will be a virtual Open Space event, held over the course of 3 days, lasting 4 hours each day. Over the last year there has 
been a great blossoming of tools and techniques 
for online events. We are excited to bring together the best of the best to make this an inclusive, engaging, and valuable event 
for all our old friends, and for those new to AONW.
</p>
{% endif %}

{% if page.conf-status == 'finished' %}
<p>Thank you to all who attended AONW {{ page.prev-year }}
{% if page.virtual-conference %}, completely virtual and online{% else %}in {{ page.prev-city }}{% endif %}. 
You can still view the <a href="{{ page.last-notes-url }}" target="_blank">session notes</a> or other details 
about the <a href="/{{ page.prev-year }}">{{ page.prev-year }} conference</a>. More information about AONW {{page.next-year}}
will be posted here when it is available.
</p>  
{% endif %}

<p>
{% if page.conf-status == 'reg_open' %}
Registration is now open using the button above! Don't forget to check out all the details about <a href="/{{ page.year }}">AONW {{ page.year }}</a>.
{% endif %}

<!--

Registration will open on this page on 11/16 at 11:16 am.
More information will be available soon. Please check back regularly.

The event is currently sold out, but you can still <a href="{{ page.reg-url }}" target="_blank">join the waitlist</a>. Check out all the details about the {{ page.year }} conference <a href="/{{ page.year }}">here</a>.
-->

</p>

<p>You can also follow us on <a href="http://twitter.com/aonw">Twitter</a> or join our
<a href="mailto:info@AgileOpenNorthwest.org?subject=Please%20add%20me%20to%20the%20AONW%20interest%20list&amp;body=Please%20add%20my%20email%20address%20to%20the%20AONW%20interest%20list!">email interest list</a>
 to stay up to date with all the latest info. 
</p>

<!--<div>
  <p>Our next annual conference will be AONW {{page.year}} in {{page.citystate}}, to be held in February {{page.year}}. Keep
  an eye on this page for further details, or follow us on
  <a href="http://twitter.com/aonw">Twitter</a> or join our
  <a href="mailto:info@AgileOpenNorthwest.org?subject=Please%20add%20me%20to%20the%20AONW%20interest%20list&amp;body=Please%20add%20my%20email%20address%20to%20the%20AONW%20interest%20list!">email interest list</a>
  to stay up to date with all the latest info.
  </p>
</div>-->
{: class="lead"}

---
AONW is an annual conference about agile practices and techniques. Using [Open Space](#about_open_space), the participants themselves
make the conference they want to attend. Come prepared to share your latest ideas, challenges, hopes, experiences and experiments! Inclusive but intimate,
Agile Open Northwest is limited to less than {{ page.attendees }} participants.

<div class="faces-5">
  <img src="/img/faces/a.jpg" alt="" class="face" />
  <img src="/img/faces/b.jpg" alt="" class="face" />
  <img src="/img/faces/c.jpg" alt="" class="face" />
  <img src="/img/faces/d.jpg" alt="" class="face" />
  <img src="/img/faces/e.jpg" alt="" class="face" />
</div>

----
In addition to hosting our annual February conference about agile practices and techniques, Agile Open Northwest sponsors and hosts other events that
focus on agile topics, use Open Space, and occur in the Northwest United States. As soon as the next one is scheduled we will announce it here,
and on <a href="http://twitter.com/aonw">Twitter</a>.
<!--One of these recently finished! {{ site.last-other-event-fullname }} was 
a one-day event held on Friday, September 16th, 2016 at the AXIS Pioneer Square in Seattle. You can find more details about the event, including the 
session notes, [here]({{ site.last-other-event-url }}). 
-->

<hr class="section"/>
<h2 id="about_open_space">About Open Space</h2>

{% include about-open-space.md %}


<hr class="section"/>
<h2 id="faq">FAQ</h2>

{% include faq.md %}


<hr class="section"/>
<h2 id="contact_us">Contact Us</h2>

Sponsor us!
[sponsor@agileopennorthwest.org](mailto:sponsor@agileopennorthwest.org)

Wonder about us?
[info@agileopennorthwest.org](mailto:info@agileopennorthwest.org)

Join our
[email interest list](mailto:info@AgileOpenNorthwest.org?subject=Please%20add%20me%20to%20the%20AONW%20interest%20list&amp;body=Please%20add%20my%20email%20address%20to%20the%20AONW%20interest%20list%20so%20I%20can%20be%20the%20first%20to%20hear%20the%20details!)!

Help us!
[volunteer@agileopennorthwest.org](mailto:volunteer@agileopennorthwest.org)

Talk to the {{page.year}} Conference Committee!
[aonw@agileopennorthwest.org](mailto:aonw@agileopennorthwest.org)

Improve this!
[webmaster@agileopennorthwest.org](mailto:webmaster@agileopennorthwest.org)
