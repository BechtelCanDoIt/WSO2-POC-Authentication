

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
      <Link className="mockbutton" to="/asgardeo/asgardeo">
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
