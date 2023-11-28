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
import { useNavigate, Link } from 'react-router-dom'; // Updated import
import Cookies from 'js-cookie';
import './css/styles.css';

function HomePage() {
  const navigate = useNavigate(); // Updated to use useNavigate

  const handleLogout = (e) => {
    e.preventDefault();

    // Clear cookies
    Cookies.remove('demo-cookie'); // Replace with your actual cookie name

    // Clear session storage or local storage if used
    sessionStorage.clear();
    localStorage.clear();

    // Redirect to the index page
    navigate('/'); // Updated to use navigate
  };

  return (
    <div className="centered">
      <Link className="logo" to="/">
        <img src="/images/wso2-logo.webp" alt="WSO2 Logo" width="100" />
      </Link>
      <h2>You Have Logged In!</h2>
      <button onClick={handleLogout}>Logout</button>
    </div>
  );
}

export default HomePage;

