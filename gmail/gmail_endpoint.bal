// Copyright (c) 2018, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

package gmail;

import ballerina/net.http;
import oauth2;

@Description {value:"Struct to set the Gmail configuration."}
public struct GmailConfiguration {
    string accessToken;
    string clientId;
    string clientSecret;
    string refreshToken;
    string refreshTokenEP;
    string refreshTokenPath;
    string baseUrl;
    http:ClientEndpointConfiguration clientConfig;
}

@Description {value:"Set the client configuration."}
public function <GmailConfiguration gmailConfig> GmailConfiguration() {
    gmailConfig.clientConfig = {};
}

@Description {value:"Gmail Endpoint struct."}
public struct GmailEndpoint {
    GmailConfiguration gmailConfig;
    GmailConnector gmailConnector;
}
@Description {value:"Initialize the gmail endpoint"}
public function <GmailEndpoint ep> init (GmailConfiguration gmailConfig) {
    endpoint oauth2:OAuth2Endpoint oauth2EP {
        accessToken:gmailConfig.accessToken,
        clientId:gmailConfig.clientId,
        clientSecret:gmailConfig.clientSecret,
        refreshToken:gmailConfig.refreshToken,
        refreshTokenEP:gmailConfig.refreshTokenEP,
        refreshTokenPath:gmailConfig.refreshTokenPath,
        baseUrl:gmailConfig.baseUrl,
        clientConfig:gmailConfig.clientConfig,
        useUriParams:true
     };
    ep.gmailConnector.oauthEndpoint = oauth2EP;
    ep.gmailConnector.baseUrl = gmailConfig.baseUrl;
}

public function <GmailEndpoint ep> register(typedesc serviceType) {

}

public function <GmailEndpoint ep> start() {

}

@Description { value:"Returns the connector that client code uses"}
@Return { value:"The connector that client code uses" }
public function <GmailEndpoint ep> getClient() returns GmailConnector {
    return ep.gmailConnector;
}

@Description { value:"Stops the registered service"}
@Return { value:"Error occured during registration" }
public function <GmailEndpoint ep> stop() {

}