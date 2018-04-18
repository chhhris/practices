## Question #1

Hi Donald,

Congrats on getting your site up and running - and with one thousand charges in your first week... that sounds incredible!

I'm sorry for the trouble you've had accessing your data via the API. The good news is it's definitely possible to get the info you're looking for.

From code sample you provided, it looks like you are requesting a list of charges without passing in the optional `limit` parameter. Limit [1] specifies the number of objects to be returned. It can range between 1 and 100, and the default is 10.

In order to retrieve more than 100 objects, paginate the request by passing the final charge retrieved by the API request as the `starting_after` parameter in a subsequent request to retrieve the next list of charges. As your reporting needs grow, you may need to regularly paginate results [2], resulting in multiple API requests. We recommend that you store any returned data on your side so that your API requests only need to fetch new or updated data, preventing any performance issues.

In order to request all 1,000 charges, you would paginate the requests:

```
# first 100
first_100_charges = Stripe::Charge.list(limit: 100)

# grab last charge returned
last_charge_id = first_100_charges.data.last.id

# request next 100 charges
second_100_charges = Stripe::Charge.list(limit: 100, started_after: last_charge_id)

# and so on
```

If this is not clear or you have any further questions / issues, please don't hesitate to reach out!

Best regards,<br>
Chris

[ 1 ] https://stripe.com/docs/api/ruby#list_charges-limit
[ 2 ] https://stripe.com/docs/api/ruby#pagination

## Question #2

Hi James,

This sounds like a very frustrating experience on the day before you're planning to go live -- we will do everything we can to to ensure your integration is up and running before the big day.

Using the details you provided, I was able to send a valid request by authenticating via bearer auth (for cross-origin requests):

```
request.Headers.Add("Authorization", "Bearer sk_test_W8xJYzw56NCHun0FT9iGIJeI");
```

(Note: make sure you update the request header with the `clientSecretKey` you access from the `ConfigurationManager` rather than passing the test API key directly as is shown in the code sample you provided.)

You can check the authentication [1] section in our API docs for more details, however if you experience any other issues, please let us know and we'll get back to you ASAP.

Kind regards,<br>
Chris

[ 1 ] https://stripe.com/docs/api#authentication

## Question #3

Hi Jessica,

Thanks for reaching out! It's great to hear everything went well before the launch. I'm happy to help answer your questions about subscriptions and webhooks, and how to get more info about failed payments.

1. You are correct: webhooks [1] will notify your application any time an event happens on your account. The way it works: within your application you would create a URL (also referred to as an "endpoint"), and whenever a certain type of event occurs in your Stripe account, Stripe would send a POST request to that URL with all the information about the event.

Your application can then use / process / report this information however you like. To use a metaphor: if your application were a house, then the URL you create is kind of like a phone line, which Stripe will call anytime there is new information to report.

2. To clarify, Webhooks can be used to give more than just info about subscriptions. They can report all kinds of events! They are best suited for reporting behind-the-scenes transactions - such as failed payments, disputed charges, a transfer is paid, etc.

If the documentation on Webhooks [1] looks intimidating, you may want to consider hiring a developer to help you. There are many freelance providers / platforms available that can help you find the right person for your needs, so I included a few below (in no particular order):

- http://www.guru.com/d/jobs/q/stripe/ (Guru)
- http://www.toptal.com/ (TopTal)
- https://www.upwork.com/o/jobs/browse/skill/stripe/ (UpWork)
- http://www.peopleperhour.com/freelance/stripe (PeoplePerHour)
- https://coworks.com/ (CoWorks)

Stripe also provides many links to some great Integrations [2] if you're thinking you want to venture in alone, but aren't really a Software Developer.


We are eager to help you to get the most out of Stripe and grow your business. If we can provide any further assistance, please don't hesitate to let us know!

Best wishes,<br>
Chris

[ 1 ] https://stripe.com/docs/webhooks
[ 2 ] https://stripe.com/docs/integrations


## Question #4

Hi Francesca,

Thanks for reaching out, I'm happy to help you troubleshoot 1. the amount being charged, and 2. error handling on your front end.

1. The charge amount issue is a relatively quick (and common) fix: The Stripe backend specifies charge amounts to be denominated in cents.

In the Gist you provided, on line 24 of `frontend.js` the amount `data: { ... , amount: 100 }` sets the amount to 100 cents (displayed to you as $1). A $100 charge amount would be `data: { ... , amount: 10000 }`.

For your reference, I've included a link to the relevant section in the Stripe API documentation [1].

2. As for the error handling on your front end, I was able to recreate the issue, whereby instead of displaying the error message, it prints `[object Object]`.

The reason for this is that `response.error` returns an object, which then gets passed to the `text()` method. You can fix this issue by reaching into the object's `message` attribute like so: `(...).text(response.error.message)`.

I've copied the full error response object below. Take a look at how the `error` key returns those nested brackets (`{...}`) indicating it is an object.

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

Below is the link [2] to the Stripe documentation with further details about the error response.

If you any of the above is unclear or you we can be of further assistance, please let us know.

Best regards,<br>
Chris

[ 1 ] https://stripe.com/docs/api#create_charge-amount
[ 2 ] https://stripe.com/docs/stripe-js/v2#card-createToken (scroll down to the section discussing `stripeResponseHandler`)











