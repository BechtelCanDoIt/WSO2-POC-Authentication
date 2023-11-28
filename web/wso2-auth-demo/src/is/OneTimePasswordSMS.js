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

const OneTimePasswordSMS = () => {
    const handleSubmit = (event) => {
        event.preventDefault();
        // Here you would handle the form submission to your server endpoint
        // Typically you would use fetch or axios to POST the data
        // For example:
        // axios.post('path/to/server/endpoint', { username, sms })
    };

    return (
        <div className="centered">
            <Link to="/" className="logo">
                <img src="/images/wso2-logo.webp" alt="Logo" width="100" />
            </Link>
            <h2>One Time Password - SMS Authentication Demo</h2>
            <form onSubmit={handleSubmit}>
                <div className="form-group">
                    <label htmlFor="username">Username:</label>
                    <input type="text" id="username" name="username" />
                </div>
                <div className="form-group">
                    <label htmlFor="sms">SMS #:</label>
                    <input type="text" id="sms" name="sms" />
                </div>
                <button type="submit">Submit</button>
            </form>
        </div>
    );
};

export default OneTimePasswordSMS;
