import ballerina/graphql;
import nuvindu/pubsub;

@graphql:ServiceConfig {
    graphiql: {
        enable: true
    }
}

service /graphql on new graphql:Listener(4000) {
    Message[] messages;
    pubsub:PubSub pubsub;
    
    function init() {
        self.messages = [];
        self.pubsub = new();
    }

    resource function get greeting() returns string {
       return "Hello, World";    
    }

    resource function get viewMessages() returns Message[]? {
        return self.messages;
    }

    remote function sendMessage(string name, string content) returns Message|error {
        Message message = {id: self.messages.length().toString(), name: name, content: content};
        self.messages.push(message);
        check self.pubsub.publish("MessageTopic", message);
        return message;
    }

    resource function subscribe receiveMessage() returns stream<Message, error?>|error {
        stream<Message, error?> messageStream = check self.pubsub.subscribe("MessageTopic");
        return messageStream;
    }
}

type Message record {|
     string id;
     string name;
     string? content;
|};
