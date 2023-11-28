/*
 * Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com).
 *
 * WSO2 LLC. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

import React from 'react';
import { Link } from 'react-router-dom';
import '../css/styles.css'; 

const IdentityServer = () => {
    return (
        <div className="centered">
            <Link to="/" className="logo">
                <img src="/images/wso2-logo.webp" alt="WSO2 Logo" width="100" />
            </Link>
            <h2>WSO2 Identity Server Authentication Demo</h2>
            <Link to="/HomePage" className="mockbutton">HomePage (No Auth)</Link>
            <hr/>
            <Link to="/is/usernamepassword" className="mockbutton">Username/Password</Link>
            <Link to="/is/otp-email" className="mockbutton">One Time Password - Email</Link>
            <Link to="/is/otp-sms" className="mockbutton">One Time Password - SMS</Link>
            <Link to="/is/social" className="mockbutton">Social Login</Link>
            <Link to="/is/fido" className="mockbutton">FIDO</Link>
        </div>
    );
};

export default IdentityServer;

