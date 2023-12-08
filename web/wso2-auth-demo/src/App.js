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

import React from "react";
import { BrowserRouter as Router, Routes, Route, Link } from "react-router-dom";
import "./css/styles.css"; 

import HomePage from "./HomePage";

//Identity Server Components
import IdentityServer from "./is/IdentityServer";
import UsernamePassword from "./is/UsernamePassword"; 
import OneTimePasswordEmail from './is/OneTimePasswordEmail';
import OneTimePasswordSMS from "./is/OneTimePasswordSMS";
import SocialLogin from "./is/Social";

//Asgardeo Components
import Asgardeo from "./asgardeo/Asgardeo";

function App() {
  const HomeComponent = () =>
    <div className="centered">
      <img src="/images/wso2-logo.webp" alt="WSO2 Logo" width="100" />
      <h2>WSO2 Authentication Demo</h2>
      <Link className="mockbutton" to="/is/identityserver">
        Identity Server
      </Link>
      //<Link className="mockbutton" to="/asgardeo/asgardeo">
        Asgardeo
      </Link>
    </div>;

  return (
    <Router>
      <Routes>
        {" "}{/* Use Routes to wrap Route components */}
        {/* Define Route for Root Path */}
        <Route exact path="/" element={<HomeComponent />} />
        <Route path="/HomePage" element={<HomePage />} />
        {/* ### IDENTITY SERVER ### */}
        <Route path="/is/identityserver" element={<IdentityServer />} />
        <Route path="/is/usernamepassword" element={<UsernamePassword />} />
        <Route path="/is/otp-email" element={<OneTimePasswordEmail />} />
        <Route path="/is/otp-sms" element={<OneTimePasswordSMS />} />
        <Route path="/is/social" element={<SocialLogin />} />
        {/* ### ASGARDEO ### */}
        <Route path="/asgardeo/asgardeo" element={<Asgardeo />} />
      </Routes>
    </Router>
  );
}

export default App;
