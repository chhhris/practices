
## No. 1

Hi Donald,

Congrats on getting your site up and running - and with one thousand charges in your first week... that sounds incredible!

I'm sorry for the trouble you've had accessing your data via the API. The good news is it's definitely possible to get the info you're looking for.

From code sample you provided, it looks like you are requesting a list of charges without passing in the optional `limit` parameter. Limit [1] specifices the number of objects to be returned. It can range between 1 and 100, and the default is 10. A request of all 1,000 charges would look like:

```
Stripe::Charge.list(limit: 1000)
```

If this is not clear or you have any further questions / issues, please don't hesitate to reach out!

Best regards,
Chris

[ 1 ] https://stripe.com/docs/api/ruby#list_charges-limit



## No. 2

Hi James,

This sounds like a very frustrating experience on the day before you're planning to go live -- we will do everything we can to to ensure your integration is up and running before the big day.

From looking at the detailed code sample you provided (thanks for that) I believe the issue is how the POST request is formatted. Fortunately the solution shouldn't require any major revisions -- just a couple small tweaks.

The current POST request gets formed like this [...] which as you reported is returning `invalid_request_error`. I believe if you modify the POST request to this [...] you should be good to go.

For your reference, the relevant section of the documentation can be found here [...].

If you experience any other issues, please let us know and either I or a colleague will get back to you ASAP.

Kind regards,
Chris


## No. 3

Hi Jessica,

Thanks for reaching out! It's great to hear everything went well before the launch. I'm happy to help answer your questions about subscriptions and webhooks, and how to get more info about failed payments.

Webhooks are used like this [...] and require code to integrate them into your application.

If this looks intimidating, you may want to consider hiring a developer to help you. There are many freelance providers available that can help you find the right person for your needs, so I included a few below (in no particular order):

- http://www.guru.com/d/jobs/q/stripe/ (Guru)
- http://www.toptal.com/ (TopTal)
- https://www.upwork.com/o/jobs/browse/skill/stripe/ (UpWork)
- http://www.peopleperhour.com/freelance/stripe (PeoplePerHour)
- https://coworks.com/ (CoWorks)

Stripe also provides many links to some great Integrations [1] if you're thinking you want to venture in alone, but aren't really a Software Developer.


You might want to consider hiring a devleoper integrate the webhooks into your application. We have a few handy resources to help you find developers who have experience integrating Stripe, [here, here and here].

We are eager to help you to get the most out of Stripe and grow your business. If we can provide any further assistance, please don't hesitate to ask.

Best wishes,
Chris

[ 1 ] https://stripe.com/docs/integrations


## No. 4

Hi Francesca,

Thanks for reaching out, I'm happy to help you troubleshoot (1) the amount being charged, and (2) error handling on your front end.

(1) The charge amount issue is a relatively quick (and common) fix: The Stripe backend specifies charge amounts to be denominated in cents.

For example, in the the Gist you provided on line 24 of `frontend.js` the amount `data: { ... , amount: 100 }` actually translates to 100 cents (displayed to you as $1). And that's the amount you are then pass to the `stripe.Charge.create(...)` method on line 15 of `backend.py`.

In order to charge $100 just multiply the dollar amount (100) x the number of cents in a dollar (100). The fix on line 24 of `frontend.js` would look like `data: { ... , amount: 10000 }`.

For your reference, I've included a link to the relevant section in the Stripe API documentation [1].

(2) As for the error handling on your front end, when I play around with it, I think I am able to recreate the issue: it appears that instead of displaying text from the error, it instead prints `[object Object]`.

The code is currently printing `response.error` to the page which actually returns an object. You can fix this issue by reaching into the object's `message` attribute like so: `(...).text(response.error.message)`.

I've copied the full error response object below. Take a look at how the `error` key returns those nested brackets (`{...}`).

```
{
  "error": {
    "code": "incorrect_number",
    "doc_url": "https://stripe.com/docs/error-codes#incorrect-number",
    "message": "Your card number is incorrect.",
    "param": "number",
    "type": "card_error"
  }
}
```

In JavaScript this means that `response.error` returns an object. Since you want the text itself, you would chain your method call into the nested object to the `"message"` key in order to return the value: `"Your card number is incorrect."`.

Below is the link [2] to the Stripe documentation with further details about the error response in particular.

If you any of the above is unclear or you we can be of further assistance, please let us know.

Best regards,
Chris

[ 1 ] https://stripe.com/docs/api#create_charge-amount
[ 2 ] https://stripe.com/docs/stripe-js/v2#card-createToken (scroll down to the section discussing `stripeResponseHandler`)











