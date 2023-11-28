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
import { useNavigate } from 'react-router-dom';
import '../css/styles.css';

const UsernamePassword = () => {
    let navigate = useNavigate();

    const handleLogin = (event) => {
        event.preventDefault();
        // Perform login logic here
        // For example, using fetch or axios to submit the form data

        // After login logic, you can navigate to another route or perform some action
        navigate('/HomePage'); // Redirect to dashboard after login, as an example
    };

    return (
        <div className="centered">
            <a className="logo" href="/">
                <img src="/images/wso2-logo.webp" alt="Logo" width="100" />
            </a>
            <h2>Username/Password Authentication Demo</h2>
            <form onSubmit={handleLogin} method="POST">
                <div className="form-group">
                    <label htmlFor="username">Username:</label>
                    <input type="text" id="username" name="username" />
                </div>
                <div className="form-group">
                    <label htmlFor="password">Password:</label>
                    <input type="password" id="password" name="password" />
                </div>
                <button type="submit">Submit</button>
            </form>
        </div>
    );
};

export default UsernamePassword;