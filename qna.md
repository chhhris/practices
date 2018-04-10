
### No. 1

Hi Donald,

Congrats on getting your site up and running - and with one thousand charges in your first week... that sounds incredible!

I'm sorry for the trouble you've had accessing your data via the API -- I can definitely help show you how to get the info you're looking for.

You mentioned accessing the API this way [...]. As you discovered, the API responds with pagination. The way you get all the results is like this [...]. For your reference, this is where it's detailed in Stripe's documentation <...>.

```
code snippets
```

If this is not clear or you have any further questions / issues, please don't hesitate to reach out!

Best regards,
Chris



### No. 2

Hi James,

This sounds like a very frustrating experience on the day before you're planning to go live -- we will do everything we can to to ensure your integration is up and running before the big day.

From looking at the detailed code sample you provided (thanks for that) I believe the issue is how the POST request is formatted. Fortunately the solution shouldn't require any major revisions -- just a couple small tweaks.

The current POST request gets formed like this [...] which as you reported is returning `invalid_request_error`. I believe if you modify the POST request to this [...] you should be good to go.

For your reference, the relevant section of the documentation can be found here [...].

If you experience any other issues, please let us know and either I or a colleague will get back to you ASAP.

Kind regards,
Chris

### No. 3

Hi Jessica,

Thanks for reaching out! It's great to hear everything went well before the launch. I'm happy to help answer your questions about subscriptions and webhooks, and how to get more info about failed payments.

Webhooks are used like this [...] and require code to integrate them into your application. TKTKTKTK borrow from example answer about backend development is this. Some more resources available here. You might want to consider hiring a devleoper integrate the webhooks into your application. We have a few handy resources to help you find developers who have experience integrating Stripe, [here, here and here].

We would love to help you to get the most out of Stripe and grow your business. If we can provide any further assistance, please don't hesitate to ask.

Best wishes,
Chris


### No. 4

Hi Francesca,

Thanks for reaching out, I'm happy to help you troubleshoot (1) the amount being charged, and (2) error handling on your front end.

(1) The charge amount issue is a relatively quick (and common) fix: The Stripe backend specifies charge amounts to be denominated in cents.

For example, in the the Gist you provided on line 24 of `frontend.js` the amount `data: { ... , amount: 100 }` actually translates to 100 cents (displayed to you as $1). And that's the amount you are then pass to the `stripe.Charge.create(...)` method on line 15 of `backend.py`.

In order to charge $100 just multiply the dollar amount (100) x the number of cents in a dollar (100). The fix on line 24 of `frontend.js` would look like `data: { ... , amount: 10000 }`.

For your reference, the relevant documentation is detailed < here >.

(2) As for the error handling on your front end, when I play around with it, I think I am able to recreate the issue: it appears that instead of displaying text from the error, it instead prints `[object Object]`. Is this what you are referring to?

The issue is that the JSON response object is being printed to the page, rather then the text included inside the object. You can fix this issue by modifying how you access the text. For example, instead of [...] you would print it like this: [...].

The reason why [...] fixes it is because the response object has the following attributes:

```
  {

  }
```

Further information on JSON response objects can be found < here >. Here is the link to the Stripe documentation with further details about the error response in particular < here >.

If you any of the above is unclear or you we can be of further assistance, please let us know.

Best regards,
Chris











