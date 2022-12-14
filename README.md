# GraphQL SubScriptions Example with Ballerina

Real-time chat application backend using GraphQL Subscriptions and Ballerina.


## Prerequisites

[Download](https://ballerina.io/downloads/) & install Ballerina 2201.2.0 (Swan Lake Update 2) version or higher.

## Service

Clone the github repository into a local folder.
Run the ballerina service using the following command

```
bal run
```

## Test GraphQL Subscriptions

Open a web browser & enter the following URL.

```
http://localhost:4000/graphiql
```

In the GraphiQL IDE run the query below to execute a subscription

```graphql
subscription receive {
    receiveMessage{
        id
        name
        content
    }
}
```

Open another window with the same URL and run this mutation.

```graphql
mutation send {
    sendMessage(name: "User", content: "Hello"){
    id
    name
    content
    }
}
```

Execute the mutation a couple of times and understand how the subscription keeps getting updated, each time a mutation has occurred.
